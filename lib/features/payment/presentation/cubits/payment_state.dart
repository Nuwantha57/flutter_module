import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.configLoaded({
    required String clientKey,
    required String environment,
    required String merchantAccount,
  }) = _ConfigLoaded;
  const factory PaymentState.sessionCreated({
    required String sessionId,
    required String sessionData,
    required String clientKey,
    required String environment,
  }) = _SessionCreated;
  const factory PaymentState.processing() = _Processing;
  const factory PaymentState.success({
    required String resultCode,
    String? pspReference,
  }) = _Success;
  const factory PaymentState.failed({required String reason}) = _Failed;
  const factory PaymentState.error({required String message}) = _Error;
}
