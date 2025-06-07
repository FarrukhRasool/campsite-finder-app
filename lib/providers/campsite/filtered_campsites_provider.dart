import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/campsite.dart';
import '../filter/filter_model.dart';
import '../filter/filter_provider.dart';
import 'campsites_provider.dart';

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
        if (filters.minPrice != null && campsite.pricePerNight != null && campsite.pricePerNight! < filters.minPrice!) {
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