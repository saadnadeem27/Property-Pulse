class Property {
  final String id;
  final String title;
  final String description;
  final PropertyType type;
  final PropertyStatus status;
  final double price;
  final String currency;
  final PropertyAddress address;
  final List<String> images;
  final List<String> amenities;
  final PropertyDetails details;
  final Agent agent;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isVerified;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.price,
    required this.currency,
    required this.address,
    required this.images,
    required this.amenities,
    required this.details,
    required this.agent,
    required this.createdAt,
    this.updatedAt,
    required this.rating,
    required this.reviewCount,
    required this.isFeatured,
    required this.isVerified,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: PropertyType.values.firstWhere((e) => e.name == json['type']),
      status: PropertyStatus.values.firstWhere((e) => e.name == json['status']),
      price: json['price'].toDouble(),
      currency: json['currency'],
      address: PropertyAddress.fromJson(json['address']),
      images: List<String>.from(json['images']),
      amenities: List<String>.from(json['amenities']),
      details: PropertyDetails.fromJson(json['details']),
      agent: Agent.fromJson(json['agent']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      isFeatured: json['isFeatured'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'status': status.name,
      'price': price,
      'currency': currency,
      'address': address.toJson(),
      'images': images,
      'amenities': amenities,
      'details': details.toJson(),
      'agent': agent.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'rating': rating,
      'reviewCount': reviewCount,
      'isFeatured': isFeatured,
      'isVerified': isVerified,
    };
  }
}

enum PropertyType {
  house,
  apartment,
  villa,
  townhouse,
  studio,
  office,
  retail,
  warehouse
}

enum PropertyStatus { rent, buy, lease, sold, rented }

class PropertyAddress {
  final String street;
  final String city;
  final String state;
  final String country;
  final String zipCode;
  final double latitude;
  final double longitude;
  final String? neighborhood;

  PropertyAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
    this.neighborhood,
  });

  factory PropertyAddress.fromJson(Map<String, dynamic> json) {
    return PropertyAddress(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      neighborhood: json['neighborhood'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'neighborhood': neighborhood,
    };
  }

  String get fullAddress => '$street, $city, $state $zipCode';
}

class PropertyDetails {
  final int bedrooms;
  final int bathrooms;
  final double area; // in square feet/meters
  final String areaUnit;
  final int? parking;
  final int? floors;
  final int? yearBuilt;
  final bool? furnished;
  final bool? petFriendly;

  PropertyDetails({
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.areaUnit,
    this.parking,
    this.floors,
    this.yearBuilt,
    this.furnished,
    this.petFriendly,
  });

  factory PropertyDetails.fromJson(Map<String, dynamic> json) {
    return PropertyDetails(
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'].toDouble(),
      areaUnit: json['areaUnit'],
      parking: json['parking'],
      floors: json['floors'],
      yearBuilt: json['yearBuilt'],
      furnished: json['furnished'],
      petFriendly: json['petFriendly'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'areaUnit': areaUnit,
      'parking': parking,
      'floors': floors,
      'yearBuilt': yearBuilt,
      'furnished': furnished,
      'petFriendly': petFriendly,
    };
  }
}

class Agent {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? avatar;
  final String? company;
  final double rating;
  final int totalSales;
  final bool isVerified;

  Agent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    this.company,
    required this.rating,
    required this.totalSales,
    required this.isVerified,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      company: json['company'],
      rating: json['rating'].toDouble(),
      totalSales: json['totalSales'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'company': company,
      'rating': rating,
      'totalSales': totalSales,
      'isVerified': isVerified,
    };
  }
}
