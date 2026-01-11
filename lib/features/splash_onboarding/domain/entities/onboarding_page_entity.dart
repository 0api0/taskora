class OnboardingPageEntity {
  final String title;
  final String description;
  final String imagePath;
  final bool isDark;

  const OnboardingPageEntity({
    this.isDark = false,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
