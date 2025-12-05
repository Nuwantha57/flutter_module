import '../../../../services/payment_api_service.dart';
import '../../domain/entities/payment_info.dart';

class PaymentRepository {
  final PaymentApiService _apiService;

  PaymentRepository(this._apiService);

  Future<AdyenConfigDto> getConfig() async {
    return await _apiService.getAdyenConfig();
  }

  Future<SessionResponseDto> createSession(PaymentInfo info) async {
    final request = SessionRequestDto(
      amount: AmountDto(currency: info.currency, value: info.amountMinor),
      reference: info.reference,
      returnUrl: 'myapp://payment-return',
      shopperReference: info.shopperReference,
      shopperEmail: info.shopperEmail,
      countryCode: 'US', // Change based on your region
    );

    return await _apiService.createSession(request);
  }
}
