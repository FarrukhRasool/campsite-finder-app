class CampsiteFilters {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final double? maxPrice;
  final double? minPrice;
  final List<String>? speakingLanguages;

  CampsiteFilters({
    this.isCloseToWater,
    this.isCampFireAllowed,
    this.maxPrice,
    this.minPrice,
    this.speakingLanguages,
  });

  CampsiteFilters copyWith({
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    double? maxPrice,
    double? minPrice,
    List<String>? speakingLanguages,
  }) {
    return CampsiteFilters(
      isCloseToWater: isCloseToWater ?? this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed ?? this.isCampFireAllowed,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      speakingLanguages: speakingLanguages ?? this.speakingLanguages,
    );
  }
} 