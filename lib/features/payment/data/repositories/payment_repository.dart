import 'package:flutter_module/services/payment_api_service.dart';
import '../../domain/entities/payment_info.dart';

class PaymentRepository {
  final PaymentApiService _apiService;

  PaymentRepository(this._apiService);

  Future<AdyenConfigDto> getConfig() async {
    return await _apiService.getAdyenConfig();
  }

  Future<PaymentResponseDto> initiatePayment(
    PaymentInfo info,
    Map<String, dynamic> paymentMethod,
  ) async {
    final request = PaymentRequestDto(
      amount: AmountDto(currency: info.currency, value: info.amountMinor),
      reference: info.reference,
      returnUrl: 'myapp://payment-return', // Configure this in Adyen dashboard
      paymentMethod: paymentMethod,
      shopperReference: info.shopperReference,
      shopperEmail: info.shopperEmail,
    );

    return await _apiService.initiatePayment(request);
  }

  Future<PaymentResponseDto> submitPaymentDetails(
    Map<String, String> details,
    String paymentData,
  ) async {
    final request = PaymentDetailsRequestDto(
      details: details,
      paymentData: paymentData,
    );

    return await _apiService.submitPaymentDetails(request);
  }
}
