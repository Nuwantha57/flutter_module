class PaymentInfo {
  final int amountMinor; // Amount in minor units (e.g., 1000 = $10.00)
  final String currency; // e.g., "USD", "EUR"
  final String description; // e.g., "Order #12345"
  final String reference; // Unique transaction reference
  final String? shopperReference; // User ID (optional)
  final String? shopperEmail; // User email (optional)

  PaymentInfo({
    required this.amountMinor,
    required this.currency,
    required this.description,
    required this.reference,
    this.shopperReference,
    this.shopperEmail,
  });

  // Generate unique reference
  factory PaymentInfo.create({
    required int amountMinor,
    required String currency,
    required String description,
    String? shopperReference,
    String? shopperEmail,
  }) {
    return PaymentInfo(
      amountMinor: amountMinor,
      currency: currency,
      description: description,
      reference: 'ORDER-${DateTime.now().millisecondsSinceEpoch}',
      shopperReference: shopperReference,
      shopperEmail: shopperEmail,
    );
  }
}
