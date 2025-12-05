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
  const factory PaymentState.processing() = _Processing;
  const factory PaymentState.requires3DS({
    required Map<String, dynamic> action,
    required String paymentData,
  }) = _Requires3DS;
  const factory PaymentState.success({required String pspReference}) = _Success;
  const factory PaymentState.failed({required String reason}) = _Failed;
  const factory PaymentState.error({required String message}) = _Error;
}
