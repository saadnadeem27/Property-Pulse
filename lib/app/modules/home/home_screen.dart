import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/controllers/auth_controller.dart';
import '../../core/controllers/property_controller.dart';
import '../../core/controllers/location_controller.dart';
import '../../data/models/property_model.dart';
import '../property/property_details_screen.dart';
import '../search/search_screen.dart';
import '../notifications/notifications_screen.dart';
import 'widgets/property_card.dart';
import 'widgets/category_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final PropertyController propertyController = Get.find();
    final LocationController locationController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            propertyController.loadMockData();
          },
          child: CustomScrollView(
            slivers: [
              // App Bar
              _buildSliverAppBar(authController, locationController),
              
              // Search Bar
              _buildSearchSection(),
              
              // Categories
              _buildCategoriesSection(),
              
              // Featured Properties
              _buildFeaturedSection(propertyController),
              
              // Nearby Properties
              _buildNearbySection(propertyController),
              
              // All Properties
              _buildAllPropertiesSection(propertyController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(AuthController authController, LocationController locationController) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Top Row
            Row(
              children: [
                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.3),
                      const SizedBox(height: 4),
                      Obx(() => Text(
                        authController.user?.displayName ?? 'Guest User',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      )).animate().fadeIn(delay: 200.ms).slideX(begin: -0.3),
                    ],
                  ),
                ),
                
                // Notification Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowLight,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const NotificationsScreen());
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ).animate().fadeIn(delay: 300.ms).scale(delay: 300.ms),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Location
            Obx(() => Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    locationController.currentAddress.isEmpty 
                        ? 'Getting location...' 
                        : locationController.currentAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (locationController.currentAddress.isEmpty)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
              ],
            )).animate().fadeIn(delay: 400.ms).slideX(begin: -0.3),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const SearchScreen());
          },
          child: Container(
            padding: const EdgeInsets.all(16),
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
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Search for properties...',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.3),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      CategoryItem('All', Icons.home, true),
      CategoryItem('House', Icons.house, false),
      CategoryItem('Apartment', Icons.apartment, false),
      CategoryItem('Villa', Icons.villa, false),
      CategoryItem('Office', Icons.business, false),
    ];

    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == categories.length - 1 ? 0 : 12),
              child: CategoryChip(
                category: categories[index],
                onTap: () {
                  // TODO: Filter properties by category
                },
              ),
            ).animate(delay: (600 + index * 100).ms).fadeIn().scale();
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedSection(PropertyController propertyController) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Properties',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.3),
          
          Container(
            height: 280,
            child: Obx(() {
              final featuredProperties = propertyController.featuredProperties;
              if (featuredProperties.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: featuredProperties.length,
                itemBuilder: (context, index) {
                  final property = featuredProperties[index];
                  return Padding(
                    padding: EdgeInsets.only(right: index == featuredProperties.length - 1 ? 0 : 16),
                    child: SizedBox(
                      width: 260,
                      child: PropertyCard(
                        property: property,
                        onTap: () => Get.to(() => PropertyDetailsScreen(property: property)),
                      ),
                    ),
                  ).animate(delay: (900 + index * 100).ms).fadeIn().slideX(begin: 0.3);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbySection(PropertyController propertyController) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 1200.ms).slideX(begin: -0.3),
          
          SizedBox(
            height: 200,
            child: Obx(() {
              final nearbyProperties = propertyController.nearbyProperties;
              if (nearbyProperties.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: nearbyProperties.length,
                itemBuilder: (context, index) {
                  final property = nearbyProperties[index];
                  return Padding(
                    padding: EdgeInsets.only(right: index == nearbyProperties.length - 1 ? 0 : 16),
                    child: _buildNearbyCard(property),
                  ).animate(delay: (1300 + index * 100).ms).fadeIn().slideX(begin: 0.3);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyCard(Property property) {
    return GestureDetector(
      onTap: () => Get.to(() => PropertyDetailsScreen(property: property)),
      child: Container(
        width: 160,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: property.images.first,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.surface,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${property.currency} ${property.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllPropertiesSection(PropertyController propertyController) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Properties',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ).animate().fadeIn(delay: 1600.ms).slideX(begin: -0.3),
            
            const SizedBox(height: 16),
            
            Obx(() {
              final properties = propertyController.properties;
              if (properties.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == properties.length - 1 ? 0 : 16),
                    child: PropertyCard(
                      property: property,
                      onTap: () => Get.to(() => PropertyDetailsScreen(property: property)),
                    ),
                  ).animate(delay: (1700 + index * 100).ms).fadeIn().slideY(begin: 0.3);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final IconData icon;
  final bool isSelected;

  CategoryItem(this.name, this.icon, this.isSelected);
}