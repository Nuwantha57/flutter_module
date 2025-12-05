import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentApiService {
  // Replace with your backend URL
  static const String baseUrl = 'http://10.0.2.2:8080'; // Android emulator
  // For real device: use your computer's local IP, e.g., 'http://192.168.1.100:8080'

  /// Fetch Adyen configuration from backend
  Future<AdyenConfigDto> getAdyenConfig() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/payments/adyen/config'),
    );

    if (response.statusCode == 200) {
      return AdyenConfigDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Adyen config: ${response.statusCode}');
    }
  }

  /// Initiate payment
  Future<PaymentResponseDto> initiatePayment(PaymentRequestDto request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/payments/adyen/initiate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return PaymentResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Payment failed: ${response.body}');
    }
  }

  /// Submit payment details (3DS completion)
  Future<PaymentResponseDto> submitPaymentDetails(
    PaymentDetailsRequestDto request,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/payments/adyen/details'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return PaymentResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Payment details submission failed: ${response.body}');
    }
  }

  /// Create payment session
  Future<SessionResponseDto> createSession(SessionRequestDto request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/payments/adyen/sessions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return SessionResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Session creation failed: ${response.body}');
    }
  }
}

// DTOs
class AdyenConfigDto {
  final String clientKey;
  final String environment;
  final String merchantAccount;

  AdyenConfigDto({
    required this.clientKey,
    required this.environment,
    required this.merchantAccount,
  });

  factory AdyenConfigDto.fromJson(Map<String, dynamic> json) {
    return AdyenConfigDto(
      clientKey: json['clientKey'] as String,
      environment: json['environment'] as String,
      merchantAccount: json['merchantAccount'] as String,
    );
  }
}

class PaymentRequestDto {
  final AmountDto amount;
  final String reference;
  final String returnUrl;
  final Map<String, dynamic> paymentMethod;
  final String? shopperReference;
  final String? shopperEmail;

  PaymentRequestDto({
    required this.amount,
    required this.reference,
    required this.returnUrl,
    required this.paymentMethod,
    this.shopperReference,
    this.shopperEmail,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.toJson(),
      'reference': reference,
      'returnUrl': returnUrl,
      'paymentMethod': paymentMethod,
      if (shopperReference != null) 'shopperReference': shopperReference,
      if (shopperEmail != null) 'shopperEmail': shopperEmail,
    };
  }
}

class AmountDto {
  final String currency;
  final int value; // Amount in minor units (e.g., 1000 = $10.00)

  AmountDto({required this.currency, required this.value});

  Map<String, dynamic> toJson() {
    return {'currency': currency, 'value': value};
  }
}

class PaymentResponseDto {
  final String resultCode;
  final String? pspReference;
  final String? refusalReason;
  final Map<String, dynamic>? action;
  final String? merchantReference;

  PaymentResponseDto({
    required this.resultCode,
    this.pspReference,
    this.refusalReason,
    this.action,
    this.merchantReference,
  });

  factory PaymentResponseDto.fromJson(Map<String, dynamic> json) {
    return PaymentResponseDto(
      resultCode: json['resultCode'] as String,
      pspReference: json['pspReference'] as String?,
      refusalReason: json['refusalReason'] as String?,
      action: json['action'] as Map<String, dynamic>?,
      merchantReference: json['merchantReference'] as String?,
    );
  }
}

class PaymentDetailsRequestDto {
  final Map<String, String> details;
  final String paymentData;

  PaymentDetailsRequestDto({required this.details, required this.paymentData});

  Map<String, dynamic> toJson() {
    return {'details': details, 'paymentData': paymentData};
  }
}

class SessionRequestDto {
  final AmountDto amount;
  final String reference;
  final String returnUrl;
  final String? shopperReference;
  final String? shopperEmail;
  final String countryCode;

  SessionRequestDto({
    required this.amount,
    required this.reference,
    required this.returnUrl,
    this.shopperReference,
    this.shopperEmail,
    this.countryCode = 'US',
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.toJson(),
      'reference': reference,
      'returnUrl': returnUrl,
      if (shopperReference != null) 'shopperReference': shopperReference,
      if (shopperEmail != null) 'shopperEmail': shopperEmail,
      'countryCode': countryCode,
    };
  }
}

class SessionResponseDto {
  final String id;
  final String sessionData;

  SessionResponseDto({required this.id, required this.sessionData});

  factory SessionResponseDto.fromJson(Map<String, dynamic> json) {
    return SessionResponseDto(
      id: json['id'] as String,
      sessionData: json['sessionData'] as String,
    );
  }
}
