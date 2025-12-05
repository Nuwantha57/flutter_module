import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/services/payment_api_service.dart';
import 'payment_state.dart';
import '../../data/repositories/payment_repository.dart';
import '../../domain/entities/payment_info.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _repository;

  PaymentCubit(this._repository) : super(const PaymentState.initial());

  /// Load Adyen configuration from backend
  Future<void> loadConfig() async {
    try {
      emit(const PaymentState.loading());

      final config = await _repository.getConfig();

      emit(
        PaymentState.configLoaded(
          clientKey: config.clientKey,
          environment: config.environment,
          merchantAccount: config.merchantAccount,
        ),
      );
    } catch (e) {
      emit(PaymentState.error(message: 'Failed to load config: $e'));
    }
  }

  /// Initiate payment with card data
  Future<void> initiatePayment(
    PaymentInfo info,
    Map<String, dynamic> paymentMethod,
  ) async {
    try {
      emit(const PaymentState.processing());

      final response = await _repository.initiatePayment(info, paymentMethod);

      _handlePaymentResponse(response);
    } catch (e) {
      emit(PaymentState.error(message: 'Payment failed: $e'));
    }
  }

  /// Submit 3DS details
  Future<void> submit3DSDetails({
    required Map<String, String> details,
    required String paymentData,
  }) async {
    try {
      emit(const PaymentState.processing());

      final response = await _repository.submitPaymentDetails(
        details,
        paymentData,
      );

      _handlePaymentResponse(response);
    } catch (e) {
      emit(PaymentState.error(message: '3DS failed: $e'));
    }
  }

  void _handlePaymentResponse(PaymentResponseDto response) {
    switch (response.resultCode) {
      case 'Authorised':
        emit(PaymentState.success(pspReference: response.pspReference ?? ''));
        break;
      case 'Refused':
        emit(
          PaymentState.failed(
            reason: response.refusalReason ?? 'Payment refused',
          ),
        );
        break;
      case 'RedirectShopper':
      case 'ChallengeShopper':
        if (response.action != null) {
          emit(
            PaymentState.requires3DS(
              action: response.action!,
              paymentData: response.action!['paymentData'] ?? '',
            ),
          );
        } else {
          emit(
            const PaymentState.error(
              message: '3DS required but no action provided',
            ),
          );
        }
        break;
      default:
        emit(
          PaymentState.error(message: 'Unknown result: ${response.resultCode}'),
        );
    }
  }
}
