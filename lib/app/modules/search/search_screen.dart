import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/controllers/property_controller.dart';
import '../property/property_details_screen.dart';
import '../home/widgets/property_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PropertyController _propertyController = Get.find();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),

          // Search Results
          Expanded(
            child: Obx(() {
              if (_propertyController.searchQuery.isEmpty) {
                return _buildEmptyState();
              }

              if (_propertyController.searchResults.isEmpty) {
                return _buildNoResultsState();
              }

              return _buildSearchResults();
            }),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.textPrimary,
        ),
      ),
      title: const Text(
        'Search Properties',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Open filters
          },
          icon: const Icon(
            Icons.tune,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          _propertyController.searchProperties(query);
        },
        decoration: InputDecoration(
          hintText: 'Search for location, property type...',
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textSecondary,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _propertyController.searchProperties('');
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.textSecondary,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    ).animate().fadeIn().slideY(begin: -0.3);
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              Icons.search_outlined,
              size: 60,
              color: AppColors.textSecondary,
            ),
          ).animate().scale(delay: 300.ms),

          const SizedBox(height: 24),

          const Text(
            'Search for Properties',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn(delay: 500.ms),

          const SizedBox(height: 8),

          const Text(
            'Enter location, property type, or any\nkeyword to find your perfect home',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 600.ms),

          const SizedBox(height: 32),

          // Popular Searches
          _buildPopularSearches(),
        ],
      ),
    );
  }

  Widget _buildPopularSearches() {
    final popularSearches = [
      'Miami Apartments',
      'Luxury Villas',
      'Downtown Condos',
      'Family Houses',
      'Studio Apartments',
    ];

    return Column(
      children: [
        const Text(
          'Popular Searches',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 700.ms),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: popularSearches.map((search) {
            return GestureDetector(
              onTap: () {
                _searchController.text = search;
                _propertyController.searchProperties(search);
                setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  search,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            );
          }).toList(),
        ).animate().fadeIn(delay: 800.ms),
      ],
    );
  }

  Widget _buildNoResultsState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              Icons.search_off_outlined,
              size: 60,
              color: AppColors.textSecondary,
            ),
          ).animate().scale(delay: 300.ms),
          const SizedBox(height: 24),
          const Text(
            'No Results Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: 8),
          Text(
            'We couldn\'t find any properties matching\n"${_propertyController.searchQuery}"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 600.ms),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              _searchController.clear();
              _propertyController.searchProperties('');
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Clear Search'),
          ).animate().fadeIn(delay: 700.ms).scale(delay: 700.ms),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _propertyController.searchResults.length,
      itemBuilder: (context, index) {
        final property = _propertyController.searchResults[index];
        return Padding(
          padding: EdgeInsets.only(
              bottom: index == _propertyController.searchResults.length - 1
                  ? 0
                  : 16),
          child: PropertyCard(
            property: property,
            onTap: () =>
                Get.to(() => PropertyDetailsScreen(property: property)),
          ),
        ).animate(delay: (index * 100).ms).fadeIn().slideY(begin: 0.3);
      },
    );
  }
}
