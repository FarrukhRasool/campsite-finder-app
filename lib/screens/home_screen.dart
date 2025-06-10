import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/campsite.dart';
import '../providers/campsite_provider.dart';
import '../resources/colors.dart';
import '../widgets/filterbottomsheet/campsite_filter_bottom_sheet.dart';
import 'campsite_detail_screen.dart';
import '../widgets/campsitelist/campsite_list.dart';
import '../widgets/appbar/home_app_bar.dart';
import '../widgets/appbar/home_search_bar.dart';

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
      backgroundColor: lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CampsiteFilterBottomSheet(
        filters: filters,
        darkGreen: darkGreen,
        availableLanguages: availableLanguages,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final campsites = ref.watch(filteredCampsitesProvider);
    final filters = ref.watch(campsiteFiltersProvider);

    final filteredCampsites = _searchQuery.isEmpty
        ? campsites
        : campsites
            .where((c) => c.label.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: HomeAppBar(onFilterPressed: () => _showFilterBottomSheet(context, ref, filters)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: lightGrey,
          child: Column(
            children: [
              HomeSearchBar(
                controller: _searchController,
                focusNode: _searchFocusNode,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
              Expanded(
                child: CampsiteList(
                  campsites: filteredCampsites,
                  onTap: (campsite) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CampsiteDetailScreen(campsite: campsite),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

