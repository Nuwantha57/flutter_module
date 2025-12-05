import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_state.dart';
import '../../data/repositories/payment_repository.dart';
import '../../domain/entities/payment_info.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _repository;
  String? _clientKey;
  String? _environment;

  PaymentCubit(this._repository) : super(const PaymentState.initial());

  /// Load Adyen configuration
  Future<void> loadConfig() async {
    try {
      emit(const PaymentState.loading());

      final config = await _repository.getConfig();

      _clientKey = config.clientKey;
      _environment = config.environment;

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

  /// Create payment session
  Future<void> createSession(PaymentInfo info) async {
    try {
      emit(const PaymentState.loading());

      final session = await _repository.createSession(info);

      emit(
        PaymentState.sessionCreated(
          sessionId: session.id,
          sessionData: session.sessionData,
          clientKey: _clientKey!,
          environment: _environment!,
        ),
      );
    } catch (e) {
      emit(PaymentState.error(message: 'Failed to create session: $e'));
    }
  }

  /// Handle payment result from Adyen component
  void handlePaymentResult(String resultCode, {String? pspReference}) {
    if (resultCode == 'Authorised') {
      emit(
        PaymentState.success(
          resultCode: resultCode,
          pspReference: pspReference,
        ),
      );
    } else if (resultCode == 'Refused' || resultCode == 'Cancelled') {
      emit(PaymentState.failed(reason: resultCode));
    } else {
      emit(PaymentState.error(message: 'Unknown result: $resultCode'));
    }
  }

  void handleError(String message) {
    emit(PaymentState.error(message: message));
  }
}
