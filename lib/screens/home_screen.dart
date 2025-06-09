import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite_provider.dart';
import '../models/campsite.dart';
import '../widgets/campsite_card.dart';
import 'campsite_detail_screen.dart';
import 'package:flutter/services.dart';
import '../widgets/price_box.dart';
import '../widgets/campsite_filter_bottom_sheet.dart';
import '../resources/colors.dart';
import '../resources/constants.dart';

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

    // Filter by search query
    final filteredCampsites = _searchQuery.isEmpty
        ? campsites
        : campsites.where((c) => c.label.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => _showFilterBottomSheet(context, ref, filters),
        ),
        title: const Text(
          campsitesAppBarTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: lightGrey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: SizedBox(
                  height: 38,
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, size: 18),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: grey300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: grey300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: darkGreen),
                      ),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    onTap: () {
                      _searchFocusNode.requestFocus();
                    },
                  ),
                ),
              ),
              Expanded(
                child: filteredCampsites.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 64, color: grey300),
                            SizedBox(height: 16),
                            Text(
                              'No Result Found',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 20,
                                color: grey300,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredCampsites.length,
                        itemBuilder: (context, index) {
                          final campsite = filteredCampsites[index];
                          return CampsiteCard(
                            campsite: campsite,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CampsiteDetailScreen(campsite: campsite),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 