import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:adyen_checkout/adyen_checkout.dart'; // TODO: Uncomment when implementing
import '../cubits/payment_cubit.dart';
import '../cubits/payment_state.dart';
// import '../../domain/entities/payment_info.dart'; // TODO: Uncomment when implementing

class PaymentScreen extends StatefulWidget {
  final int amountMinor; // Pass from parent (e.g., 1000 for $10.00)
  final String currency; // Pass from parent (e.g., "USD")

  const PaymentScreen({
    super.key,
    this.amountMinor = 1000, // Default $10.00 for testing
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
            requires3DS: (action, paymentData) {
              _handle3DS(context, action, paymentData);
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
                  Text('Loading payment configuration...'),
                ],
              ),
            ),
            configLoaded: (clientKey, environment, merchantAccount) {
              return _buildPaymentForm(
                context,
                clientKey,
                environment,
                merchantAccount,
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
            requires3DS: (action, paymentData) => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Completing authentication...'),
                ],
              ),
            ),
            success: (pspReference) => _buildSuccessScreen(pspReference),
            failed: (reason) => _buildFailedScreen(reason),
            error: (message) => _buildErrorScreen(message),
          );
        },
      ),
    );
  }

  Widget _buildPaymentForm(
    BuildContext context,
    String clientKey,
    String environment,
    String merchantAccount,
  ) {
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
              onPressed: () => _startCardPayment(
                context,
                clientKey,
                environment,
                merchantAccount,
              ),
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

  Widget _buildSuccessScreen(String pspReference) {
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
            const SizedBox(height: 8),
            Text(
              'Reference: $pspReference',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
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

  Future<void> _startCardPayment(
    BuildContext context,
    String clientKey,
    String environment,
    String merchantAccount,
  ) async {
    try {
      // For now, show a message that direct integration is needed
      // The adyen_checkout package API requires checking the official documentation
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Payment integration in progress. Please check adyen_checkout package documentation for the correct API.',
          ),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 5),
        ),
      );

      // TODO: Implement based on actual adyen_checkout v1.7.0 API
      // The correct implementation depends on the package's exposed methods
      // Check: https://pub.dev/packages/adyen_checkout for documentation
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Card payment cancelled or error: $e'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  Future<void> _handle3DS(
    BuildContext context,
    Map<String, dynamic> action,
    String paymentData,
  ) async {
    try {
      // TODO: Implement 3DS handling based on actual adyen_checkout v1.7.0 API
      // The correct implementation depends on the package's exposed methods
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '3DS handling needs to be implemented with correct adyen_checkout API',
          ),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('3DS failed: $e'), backgroundColor: Colors.red),
      );
    }
  }

  String _formatAmount(int amountMinor, String currency) {
    final amount = amountMinor / 100;
    return '$currency ${amount.toStringAsFixed(2)}';
  }
}
