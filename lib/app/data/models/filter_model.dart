import 'property_model.dart';

class PropertyFilter {
  final PropertyType? type;
  final PropertyStatus? status;
  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final int? maxBedrooms;
  final int? minBathrooms;
  final int? maxBathrooms;
  final double? minArea;
  final double? maxArea;
  final String? city;
  final String? state;
  final List<String>? amenities;
  final bool? furnished;
  final bool? petFriendly;
  final double? radius; // in km
  final double? centerLat;
  final double? centerLng;
  final SortBy? sortBy;
  final SortOrder? sortOrder;

  PropertyFilter({
    this.type,
    this.status,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.maxBedrooms,
    this.minBathrooms,
    this.maxBathrooms,
    this.minArea,
    this.maxArea,
    this.city,
    this.state,
    this.amenities,
    this.furnished,
    this.petFriendly,
    this.radius,
    this.centerLat,
    this.centerLng,
    this.sortBy,
    this.sortOrder,
  });

  PropertyFilter copyWith({
    PropertyType? type,
    PropertyStatus? status,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    int? maxBedrooms,
    int? minBathrooms,
    int? maxBathrooms,
    double? minArea,
    double? maxArea,
    String? city,
    String? state,
    List<String>? amenities,
    bool? furnished,
    bool? petFriendly,
    double? radius,
    double? centerLat,
    double? centerLng,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) {
    return PropertyFilter(
      type: type ?? this.type,
      status: status ?? this.status,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minBedrooms: minBedrooms ?? this.minBedrooms,
      maxBedrooms: maxBedrooms ?? this.maxBedrooms,
      minBathrooms: minBathrooms ?? this.minBathrooms,
      maxBathrooms: maxBathrooms ?? this.maxBathrooms,
      minArea: minArea ?? this.minArea,
      maxArea: maxArea ?? this.maxArea,
      city: city ?? this.city,
      state: state ?? this.state,
      amenities: amenities ?? this.amenities,
      furnished: furnished ?? this.furnished,
      petFriendly: petFriendly ?? this.petFriendly,
      radius: radius ?? this.radius,
      centerLat: centerLat ?? this.centerLat,
      centerLng: centerLng ?? this.centerLng,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type?.name,
      'status': status?.name,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'minBedrooms': minBedrooms,
      'maxBedrooms': maxBedrooms,
      'minBathrooms': minBathrooms,
      'maxBathrooms': maxBathrooms,
      'minArea': minArea,
      'maxArea': maxArea,
      'city': city,
      'state': state,
      'amenities': amenities,
      'furnished': furnished,
      'petFriendly': petFriendly,
      'radius': radius,
      'centerLat': centerLat,
      'centerLng': centerLng,
      'sortBy': sortBy?.name,
      'sortOrder': sortOrder?.name,
    };
  }
}

enum SortBy { price, area, bedrooms, rating, createdAt }

enum SortOrder { ascending, descending }