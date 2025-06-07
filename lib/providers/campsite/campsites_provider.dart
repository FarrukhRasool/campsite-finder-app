import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/campsite.dart';
import 'service_provider.dart';

final campsitesProvider = FutureProvider<List<Campsite>>((ref) async {
  final service = ref.watch(campsiteServiceProvider);
  return service.getCampsites();
}); 