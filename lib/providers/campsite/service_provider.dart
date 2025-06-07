import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/campsite_service.dart';

final campsiteServiceProvider = Provider<CampsiteService>((ref) {
  return CampsiteService();
}); 