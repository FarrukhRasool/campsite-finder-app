import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'filter_model.dart';

final campsiteFiltersProvider = StateProvider<CampsiteFilters>((ref) => CampsiteFilters()); 