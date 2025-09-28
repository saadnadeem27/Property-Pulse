import 'package:get/get.dart';
import '../../data/models/property_model.dart';
import '../../data/models/filter_model.dart';

class PropertyController extends GetxController {
  static PropertyController get instance => Get.find();

  // Observables
  final RxList<Property> _properties = <Property>[].obs;
  final RxList<Property> _favoriteProperties = <Property>[].obs;
  final RxList<Property> _recentlyViewed = <Property>[].obs;
  final RxList<Property> _searchResults = <Property>[].obs;
  final Rx<PropertyFilter> _currentFilter = PropertyFilter().obs;
  final RxBool _isLoading = false.obs;
  final RxString _searchQuery = ''.obs;

  // Getters
  List<Property> get properties => _properties;
  List<Property> get favoriteProperties => _favoriteProperties;
  List<Property> get recentlyViewed => _recentlyViewed;
  List<Property> get searchResults => _searchResults;
  PropertyFilter get currentFilter => _currentFilter.value;
  bool get isLoading => _isLoading.value;
  String get searchQuery => _searchQuery.value;

  List<Property> get featuredProperties =>
      _properties.where((property) => property.isFeatured).toList();

  List<Property> get nearbyProperties =>
      _properties.take(10).toList(); // Mock nearby properties

  @override
  void onInit() {
    super.onInit();
    loadMockData();
  }

  void loadMockData() {
    _isLoading.value = true;

    // Mock property data
    final mockProperties = [
      Property(
        id: '1',
        title: 'Modern Luxury Villa',
        description:
            'Beautiful modern villa with stunning city views and premium amenities.',
        type: PropertyType.villa,
        status: PropertyStatus.buy,
        price: 850000,
        currency: 'USD',
        address: PropertyAddress(
          street: '123 Palm Avenue',
          city: 'Miami',
          state: 'FL',
          country: 'USA',
          zipCode: '33101',
          latitude: 25.7617,
          longitude: -80.1918,
          neighborhood: 'Downtown',
        ),
        images: [
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=800',
          'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?w=800',
        ],
        amenities: ['Swimming Pool', 'Gym', 'Garden', 'Garage', 'Security'],
        details: PropertyDetails(
          bedrooms: 4,
          bathrooms: 3,
          area: 3500,
          areaUnit: 'sqft',
          parking: 2,
          floors: 2,
          yearBuilt: 2020,
          furnished: true,
          petFriendly: true,
        ),
        agent: Agent(
          id: 'agent1',
          name: 'Sarah Johnson',
          email: 'sarah@realestate.com',
          phone: '+1-555-0123',
          avatar:
              'https://images.unsplash.com/photo-1494790108755-2616b612c601?w=150',
          company: 'Premium Realty',
          rating: 4.8,
          totalSales: 156,
          isVerified: true,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        rating: 4.7,
        reviewCount: 23,
        isFeatured: true,
        isVerified: true,
      ),
      Property(
        id: '2',
        title: 'Downtown Apartment',
        description:
            'Spacious apartment in the heart of the city with modern amenities.',
        type: PropertyType.apartment,
        status: PropertyStatus.rent,
        price: 2500,
        currency: 'USD',
        address: PropertyAddress(
          street: '456 City Center Blvd',
          city: 'Miami',
          state: 'FL',
          country: 'USA',
          zipCode: '33131',
          latitude: 25.7743,
          longitude: -80.1937,
          neighborhood: 'Brickell',
        ),
        images: [
          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800',
          'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800',
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800',
        ],
        amenities: ['Balcony', 'Gym', 'Concierge', 'Pool', 'Parking'],
        details: PropertyDetails(
          bedrooms: 2,
          bathrooms: 2,
          area: 1200,
          areaUnit: 'sqft',
          parking: 1,
          floors: 1,
          yearBuilt: 2019,
          furnished: false,
          petFriendly: false,
        ),
        agent: Agent(
          id: 'agent2',
          name: 'Mike Davis',
          email: 'mike@cityrealty.com',
          phone: '+1-555-0124',
          avatar:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
          company: 'City Realty Group',
          rating: 4.6,
          totalSales: 89,
          isVerified: true,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        rating: 4.5,
        reviewCount: 18,
        isFeatured: false,
        isVerified: true,
      ),
      Property(
        id: '3',
        title: 'Cozy Family House',
        description:
            'Perfect family home with a large backyard and quiet neighborhood.',
        type: PropertyType.house,
        status: PropertyStatus.buy,
        price: 425000,
        currency: 'USD',
        address: PropertyAddress(
          street: '789 Maple Street',
          city: 'Coral Gables',
          state: 'FL',
          country: 'USA',
          zipCode: '33134',
          latitude: 25.7213,
          longitude: -80.2684,
          neighborhood: 'Coral Gables',
        ),
        images: [
          'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800',
          'https://images.unsplash.com/photo-1588880331179-bc9b93a8cb5e?w=800',
          'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800',
        ],
        amenities: ['Garden', 'Garage', 'Fireplace', 'Patio', 'Storage'],
        details: PropertyDetails(
          bedrooms: 3,
          bathrooms: 2,
          area: 1800,
          areaUnit: 'sqft',
          parking: 2,
          floors: 1,
          yearBuilt: 2015,
          furnished: false,
          petFriendly: true,
        ),
        agent: Agent(
          id: 'agent3',
          name: 'Emma Wilson',
          email: 'emma@familyhomes.com',
          phone: '+1-555-0125',
          avatar:
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
          company: 'Family Homes Realty',
          rating: 4.9,
          totalSales: 203,
          isVerified: true,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        rating: 4.8,
        reviewCount: 34,
        isFeatured: true,
        isVerified: true,
      ),
    ];

    _properties.assignAll(mockProperties);
    _isLoading.value = false;
  }

  void searchProperties(String query) {
    _searchQuery.value = query;
    if (query.isEmpty) {
      _searchResults.clear();
      return;
    }

    final results = _properties
        .where((property) =>
            property.title.toLowerCase().contains(query.toLowerCase()) ||
            property.description.toLowerCase().contains(query.toLowerCase()) ||
            property.address.city.toLowerCase().contains(query.toLowerCase()) ||
            property.address.state.toLowerCase().contains(query.toLowerCase()))
        .toList();

    _searchResults.assignAll(results);
  }

  void applyFilter(PropertyFilter filter) {
    _currentFilter.value = filter;
    // TODO: Implement filtering logic
    filterProperties();
  }

  void filterProperties() {
    // TODO: Implement actual filtering based on _currentFilter
    // For now, just return all properties
  }

  void toggleFavorite(String propertyId) {
    final property = _properties.firstWhere((p) => p.id == propertyId);
    if (_favoriteProperties.any((p) => p.id == propertyId)) {
      _favoriteProperties.removeWhere((p) => p.id == propertyId);
    } else {
      _favoriteProperties.add(property);
    }
  }

  bool isFavorite(String propertyId) {
    return _favoriteProperties.any((p) => p.id == propertyId);
  }

  void addToRecentlyViewed(Property property) {
    _recentlyViewed.removeWhere((p) => p.id == property.id);
    _recentlyViewed.insert(0, property);
    if (_recentlyViewed.length > 10) {
      _recentlyViewed.removeLast();
    }
  }

  Property? getPropertyById(String id) {
    try {
      return _properties.firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Property> getPropertiesByType(PropertyType type) {
    return _properties.where((property) => property.type == type).toList();
  }

  List<Property> getPropertiesByStatus(PropertyStatus status) {
    return _properties.where((property) => property.status == status).toList();
  }
}
