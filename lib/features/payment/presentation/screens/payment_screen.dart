import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adyen_checkout/adyen_checkout.dart';
import '../cubits/payment_cubit.dart';
import '../cubits/payment_state.dart';
import '../../domain/entities/payment_info.dart';

class PaymentScreen extends StatefulWidget {
  final int amountMinor;
  final String currency;

  const PaymentScreen({
    super.key,
    this.amountMinor = 1000,
    this.currency = 'USD',
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().loadConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            ),
            configLoaded: (clientKey, environment, merchantAccount) {
              return _buildConfigLoadedView(context);
            },
            sessionCreated: (sessionId, sessionData, clientKey, environment) {
              return _buildSessionView(
                sessionId,
                sessionData,
                clientKey,
                environment,
              );
            },
            processing: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Processing payment...'),
                ],
              ),
            ),
            success: (resultCode, pspReference) {
              return _buildSuccessScreen(pspReference);
            },
            failed: (reason) => _buildFailedScreen(reason),
            error: (message) => _buildErrorScreen(message),
          );
        },
      ),
    );
  }

  Widget _buildConfigLoadedView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.payment, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              'Card Payment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Amount: ${_formatAmount(widget.amountMinor, widget.currency)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => _startPayment(),
              icon: const Icon(Icons.credit_card),
              label: const Text('Pay with Card'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 56),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionView(
    String sessionId,
    String sessionData,
    String clientKey,
    String environment,
  ) {
    final cardConfiguration = CardComponentConfiguration(
      environment: environment == 'live'
          ? Environment.europe
          : Environment.test,
      clientKey: clientKey,
      countryCode: 'US',
      shopperLocale: 'en_US',
    );

    return FutureBuilder<SessionCheckout>(
      future: AdyenCheckout.session.create(
        sessionId: sessionId,
        sessionData: sessionData,
        configuration: cardConfiguration,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Preparing payment...'),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('Unable to create session'));
        }

        final sessionCheckout = snapshot.data!;

        // Extract card payment method from paymentMethods map
        final paymentMethodsList =
            sessionCheckout.paymentMethods['paymentMethods'] as List?;
        final cardPaymentMethod = paymentMethodsList?.firstWhere(
          (method) => method['type'] == 'scheme',
          orElse: () => null,
        );

        if (cardPaymentMethod == null) {
          return const Center(child: Text('No card payment method available'));
        }

        return AdyenCardComponent(
          configuration: cardConfiguration,
          paymentMethod: cardPaymentMethod,
          checkout: sessionCheckout,
          onPaymentResult: (PaymentResult paymentResult) async {
            switch (paymentResult) {
              case PaymentSessionFinished():
                context.read<PaymentCubit>().handlePaymentResult(
                  paymentResult.resultCode.name,
                  pspReference: paymentResult.sessionResult,
                );
              case PaymentError():
                context.read<PaymentCubit>().handleError(
                  paymentResult.reason ?? 'Payment error',
                );
              case PaymentCancelledByUser():
                context.read<PaymentCubit>().handleError('Payment cancelled');
              case PaymentAdvancedFinished():
                context.read<PaymentCubit>().handlePaymentResult(
                  paymentResult.resultCode.name,
                  pspReference: null,
                );
            }
          },
        );
      },
    );
  }

  Widget _buildSuccessScreen(String? pspReference) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 24),
            const Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Amount: ${_formatAmount(widget.amountMinor, widget.currency)}',
              style: const TextStyle(fontSize: 18),
            ),
            if (pspReference != null) ...[
              const SizedBox(height: 8),
              Text(
                'Reference: $pspReference',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('Done', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFailedScreen(String reason) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 100),
            const SizedBox(height: 24),
            const Text(
              'Payment Failed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              reason,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.read<PaymentCubit>().loadConfig(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('Try Again', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning, color: Colors.orange, size: 100),
            const SizedBox(height: 24),
            const Text(
              'Something went wrong',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.read<PaymentCubit>().loadConfig(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('Retry', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _startPayment() {
    final paymentInfo = PaymentInfo.create(
      amountMinor: widget.amountMinor,
      currency: widget.currency,
      description: 'Payment via card',
    );

    context.read<PaymentCubit>().createSession(paymentInfo);
  }

  String _formatAmount(int amountMinor, String currency) {
    final amount = amountMinor / 100;
    return '$currency ${amount.toStringAsFixed(2)}';
  }
}
