enum AppTextType {
  displayLarge(56),
  displayMedium(44),
  displaySmall(36),
  headlineLarge(32),
  headlineMedium(28),
  headlineSmall(26),
  titleLarge(20),
  titleMedium(16),
  titleSmall(14),
  bodyLarge(16),
  bodyMedium(14),
  bodySmall(12),
  labelLarge(14),
  labelMedium(12),
  labelSmall(10)
  ;

  const AppTextType(this.fontSize);

  final double fontSize;
}
