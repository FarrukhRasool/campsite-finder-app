import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/campsite.dart';
import '../services/campsite_service.dart';

final campsiteServiceProvider = Provider<CampsiteService>((ref) {
  return CampsiteService();
});

final campsitesProvider = FutureProvider<List<Campsite>>((ref) async {
  final service = ref.watch(campsiteServiceProvider);
  return service.getCampsites();
});

final filteredCampsitesProvider = Provider<List<Campsite>>((ref) {
  final campsitesAsync = ref.watch(campsitesProvider);
  final filters = ref.watch(campsiteFiltersProvider);

  return campsitesAsync.maybeWhen(
    data: (campsites) {
      return campsites.where((campsite) {
        if (filters.isCloseToWater == true && campsite.isCloseToWater != true) {
          return false;
        }
        if (filters.isCampFireAllowed == true && campsite.isCampFireAllowed != true) {
          return false;
        }
        if (filters.maxPrice != null && campsite.pricePerNight != null && campsite.pricePerNight! > filters.maxPrice!) {
          return false;
        }
        if (filters.speakingLanguages != null && filters.speakingLanguages!.isNotEmpty) {
          final hostLangs = campsite.hostLanguages?.map((e) => e.toString()).toList() ?? [];
          if (!filters.speakingLanguages!.any((lang) => hostLangs.contains(lang))) {
            return false;
          }
        }
        return true;
      }).toList();
    },
    orElse: () => [],
  );
});

class CampsiteFilters {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final double? maxPrice;
  final List<String>? speakingLanguages;

  CampsiteFilters({
    this.isCloseToWater,
    this.isCampFireAllowed,
    this.maxPrice,
    this.speakingLanguages,
  });

  CampsiteFilters copyWith({
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    double? maxPrice,
    List<String>? speakingLanguages,
  }) {
    return CampsiteFilters(
      isCloseToWater: isCloseToWater ?? this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed ?? this.isCampFireAllowed,
      maxPrice: maxPrice ?? this.maxPrice,
      speakingLanguages: speakingLanguages ?? this.speakingLanguages,
    );
  }
}

final campsiteFiltersProvider = StateProvider<CampsiteFilters>((ref) => CampsiteFilters()); 