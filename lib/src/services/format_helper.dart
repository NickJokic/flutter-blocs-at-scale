class FormatHelper {
  FormatHelper();

  String formatPriceToString(double price) => '${price.toStringAsFixed(2).replaceFirst('.', ',')} €';

  String formatWeightKgToGString(double weightKg) => '${(weightKg * 1000).toStringAsFixed(0)} g';
}
