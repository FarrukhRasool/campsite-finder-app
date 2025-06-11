import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/campsite.dart';
import '../providers/campsite_provider.dart';
import '../resources/colors.dart';
import '../widgets/filter_bottom_sheet/campsite_filter_bottom_sheet.dart';
import 'campsite_detail_screen.dart';
import '../widgets/campsitelist/campsite_list.dart';
import '../widgets/app_bar/home_app_bar.dart';
import '../widgets/app_bar/home_search_bar.dart';
import '../widgets/green_loader.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../widgets/no_internet_screen.dart';

const availableLanguages = [
  {'code': 'en', 'label': 'English'},
  {'code': 'de', 'label': 'German'},
];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  bool _hasInternet = true;
  late final Connectivity _connectivity;
  late final Stream<ConnectivityResult> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen((result) {
      final hasInternet = result != ConnectivityResult.none;
      if (mounted) {
        setState(() {
          _hasInternet = hasInternet;
        });
      }
    });
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    if (mounted) {
      setState(() {
        _hasInternet = result != ConnectivityResult.none;
      });
      if (_hasInternet) {
        ref.refresh(campsitesProvider);
      }
    }
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet(BuildContext context, WidgetRef ref, CampsiteFilters filters) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CampsiteFilterBottomSheet(
        filters: filters,
        darkGreen: AppColors.darkGreen,
        availableLanguages: availableLanguages,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final campsitesAsync = ref.watch(campsitesProvider);
    final filteredCampsites = ref.watch(filteredCampsitesProvider);
    final filters = ref.watch(campsiteFiltersProvider);

    if (!_hasInternet) {
      return Scaffold(
        appBar: HomeAppBar(onFilterPressed: () => _showFilterBottomSheet(context, ref, filters)),
        body: NoInternetScreen(
          onRetry: _checkInitialConnection,
        ),
      );
    }

    Widget content = campsitesAsync.when(
      data: (_) {
        final searchResults = _searchQuery.isEmpty
            ? filteredCampsites
            : filteredCampsites
                .where((c) => c.label.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();
        return CampsiteList(
          campsites: searchResults,
          onTap: (campsite) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CampsiteDetailScreen(campsite: campsite),
            ),
          ),
        );
      },
      loading: () => const GreenLoader(),
      error: (e, st) => Center(child: Text('Error: $e')),
    );

    return Scaffold(
      appBar: HomeAppBar(onFilterPressed: () => _showFilterBottomSheet(context, ref, filters)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: AppColors.lightGrey,
          child: Column(
            children: [
              HomeSearchBar(
                controller: _searchController,
                focusNode: _searchFocusNode,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
              Expanded(child: content),
            ],
          ),
        ),
      ),
    );
  }
}

