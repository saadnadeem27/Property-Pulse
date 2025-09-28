# 🏠 Property Pulse - Premium Real Estate Mobile App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" />
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" />
</div>

<div align="center">
  <h3>🏆 A Modern, Feature-Rich Real Estate Application Built with Flutter</h3>
  <p>Experience premium property browsing with sophisticated UI design and seamless user interactions</p>
</div>

---

## 📱 **App Overview**

Property Pulse is a comprehensive real estate mobile application designed with modern UI principles and premium user experience. Built using Flutter and GetX state management, it offers a complete property browsing and management solution with sophisticated gradient designs, smooth animations, and intuitive navigation.

### 🎯 **Key Features**

#### 🔐 **Authentication System**
- **Streamlined Login/Signup** - Clean, modern authentication screens with gradient buttons
- **Demo Mode** - Instant access with dummy credentials for quick testing (just click "Sign In")
- **Persistent Sessions** - Remember user login state with SharedPreferences
- **Password Recovery** - Forgot password functionality with elegant UI
- **No Validation Required** - Quick demo access for portfolio showcase

#### 🏠 **Property Management**
- **Property Listings** - Beautiful grid and list view with 20+ mock properties
- **Advanced Search** - Real-time search by title, description, city, and state
- **Property Details** - Comprehensive property information with image gallery and smooth indicators
- **Favorites System** - Add/remove properties from favorites with heart animations
- **Recently Viewed** - Track and display recently viewed properties
- **Property Categories** - Filter by Villa, House, Apartment types
- **Interactive Elements** - Property cards with gradient backgrounds and enhanced shadows

#### 🎨 **Premium UI/UX Design with Gradients**
- **Material Design 3** - Modern, consistent design language with gradient enhancements
- **Beautiful Gradients** - Multi-layer gradient backgrounds throughout the app
- **Smooth Animations** - Flutter Animate for engaging transitions and micro-interactions
- **Responsive Layout** - Adaptive design for different screen sizes
- **Enhanced Shadows** - Multi-layer shadow effects for depth and premium feel
- **Glass Effects** - Transparent backgrounds with subtle borders
- **Custom Components** - Professionally designed widgets with gradient themes

#### 📊 **User Dashboard & Navigation**
- **Gradient Home Header** - Stunning blue-to-green gradient header background
- **Enhanced Search Bar** - Card gradient with subtle borders and enhanced shadows
- **Property Categories** - Interactive chips with gradient selection states
- **Featured Properties** - Highlighted properties with premium card designs
- **Nearby Properties** - Horizontal scroll list of location-based properties
- **Bottom Navigation** - Fixed gradient navigation with proper icon visibility
- **Profile Management** - User profile with settings and preferences

---

## 🛠️ **Technical Implementation**

### **Architecture & State Management**
- **GetX Pattern** - Reactive state management with dependency injection
- **Clean Architecture** - Organized folder structure with separation of concerns
- **Modular Design** - Feature-based module organization
- **Responsive Widgets** - Adaptive UI components for various screen sizes

### **Key Technologies & Dependencies**
```dart
dependencies:
  flutter: ^3.0.0
  get: ^4.6.6                     # State Management & Navigation
  google_fonts: ^6.3.0           # Typography (Inter Font)
  flutter_animate: ^4.5.0        # Smooth Animations & Transitions
  cached_network_image: ^3.4.0   # Image Caching & Loading
  shared_preferences: ^2.3.1     # Local Storage for Sessions
  smooth_page_indicator: ^1.2.0  # Property Image Gallery Indicators
  shimmer: ^3.0.0                # Loading Effects & Skeletons
  url_launcher: ^6.3.1           # Contact Agent Functionality

dev_dependencies:
  flutter_test: ^3.0.0
  flutter_lints: ^3.0.0          # Code Quality & Standards
```

### **Gradient System & Visual Enhancements**
```dart
// Custom Gradient Definitions
AppColors.homeHeaderGradient     // Blue to Green Header
AppColors.primaryGradient        // Button & Selected States
AppColors.backgroundGradient     // App Background
AppColors.cardGradient          // Property Cards
AppColors.propertyCardGradient  // Enhanced Property Cards
AppColors.buttonGradient        // Login & Action Buttons
```

### **Project Structure**
```
lib/
├── app/
│   ├── core/
│   │   ├── bindings/          # Dependency Injection
│   │   ├── controllers/       # GetX Controllers
│   │   ├── routes/            # App Navigation
│   │   └── theme/             # UI Theme & Colors
│   ├── data/
│   │   └── models/            # Data Models
│   └── modules/
│       ├── auth/              # Authentication Screens
│       ├── home/              # Home Dashboard
│       ├── search/            # Property Search
│       ├── favorites/         # Saved Properties
│       ├── profile/           # User Profile
│       └── property/          # Property Details
└── main.dart                  # App Entry Point
```

---

## 🚀 **Features Showcase**

### **🎬 Onboarding & User Experience**
- **Interactive Walkthrough** - Smooth page transitions with compelling visuals
- **Feature Highlights** - Showcase key app capabilities with animations
- **Skip Option** - Quick access for returning users
- **Demo Mode** - Instant access without validation for portfolio showcase

### **🔍 Advanced Search & Filter System**
- **Real-time Search** - Instant filtering as you type (title, description, location)
- **Property Categories** - Filter by Villa, House, Apartment with gradient chips
- **Search Results** - Dynamic grid layout with property cards
- **Empty States** - Elegant no-results messaging with guidance
- **Search History** - Recently searched properties tracking

### **📱 Modern Interface Components with Gradients**
- **Enhanced Property Cards** - Multi-layer gradients with subtle borders and shadows
- **Image Gallery** - Full-screen property photos with smooth page indicators
- **Gradient Buttons** - Beautiful blue gradient buttons with enhanced shadows
- **Glass Navigation** - Semi-transparent bottom nav with gradient selected states
- **Category Chips** - Interactive selection with gradient backgrounds
- **Shimmer Loading** - Professional skeleton screens for better UX
- **Favorite Hearts** - Animated heart icons with red selection states

### **👤 User Profile & Settings**
- **Profile Management** - Edit personal information and preferences
- **Settings Panel** - App preferences, notifications, and privacy controls
- **Activity History** - View recent searches and property interactions
- **Contact Support** - Direct access to customer support

---

## 🎨 **Design System**

### **Color Palette & Gradient System**
```dart
// Primary Colors
Primary: #2B5CE6 (Royal Blue)
Primary Light: #5A7CED (Light Blue)
Primary Dark: #1E3A8A (Dark Blue)
Secondary: #10B981 (Emerald)
Secondary Light: #34D399 (Light Emerald)

// Status Colors
Success: #10B981 (Emerald)
Warning: #F59E0B (Orange)
Error: #EF4444 (Red)
Info: #3B82F6 (Blue)

// Gradient Definitions
Home Header: Blue → Light Blue → Emerald
Button Gradient: Royal Blue → Dark Blue
Card Gradient: White → Light Gray
Background: Light Gray → Medium Gray
Property Cards: White → Very Light Gray

// Text Colors
Text Primary: #0F172A (Dark Slate)
Text Secondary: #64748B (Slate)
Text Tertiary: #94A3B8 (Light Slate)
```

### **Typography**
- **Font Family**: Inter (Google Fonts)
- **Headings**: Bold weights (600-700)
- **Body Text**: Regular weight (400)
- **Captions**: Medium weight (500)

### **Spacing & Layout**
- **Grid System**: 24px base spacing unit
- **Border Radius**: 12px standard, 16px for buttons
- **Shadows**: Subtle elevation with Material Design principles

---

## 📥 **Installation & Setup**

### **Prerequisites**
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### **Quick Start**
```bash
# Clone the repository
git clone https://github.com/saadnadeem27/Property-Pulse.git

# Navigate to project directory
cd property_pulse

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### **Build for Production**
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## 🎯 **Demo Credentials & Current Features**

For quick testing and demonstration:

**Demo Login:**
- Just click "Sign In" without entering any credentials
- App automatically logs you in as "Demo User"
- No validation required - instant access to all features
- Creates dummy user session with SharedPreferences

**Live Demo Features:**
- ✅ **20+ Mock Properties** - Villas, Houses, Apartments with real images
- ✅ **Search Functionality** - Real-time search by title, description, city
- ✅ **Favorites System** - Add/remove properties with heart animations
- ✅ **Property Categories** - Filter by Villa, House, Apartment types
- ✅ **Property Details** - Full image galleries with smooth indicators
- ✅ **Bottom Navigation** - Fixed gradient navigation (Home, Search, Favorites, Profile)
- ✅ **Gradient UI** - Beautiful gradients throughout the entire app
- ✅ **Animations** - Flutter Animate transitions and micro-interactions
- ✅ **Responsive Design** - Works on all screen sizes

**Property Data Includes:**
- Property images, titles, prices, locations
- Bedrooms, bathrooms, area specifications
- Property types (Villa/House/Apartment)
- Property status (Buy/Rent/Lease)
- Agent information with contact details
- Property amenities and descriptions

---

## 🏗️ **Development Highlights**

### **State Management Excellence**
- **GetX Controllers** - Reactive programming with clean separation
- **Dependency Injection** - Efficient resource management
- **State Persistence** - Maintain app state across sessions

### **Performance Optimizations**
- **Image Caching** - Efficient loading and storage of property images
- **Lazy Loading** - Load content as needed for smooth scrolling
- **Memory Management** - Proper disposal of resources and controllers

### **Code Quality**
- **Clean Architecture** - Maintainable and scalable codebase
- **Type Safety** - Strong typing with Dart for reliability
- **Documentation** - Comprehensive code comments and documentation

---

## 🎪 **Screenshots & Demo**

### **App Flow Preview**
1. **Splash Screen** → **Onboarding** → **Authentication**
2. **Home Dashboard** → **Property Search** → **Property Details**
3. **Favorites Management** → **User Profile** → **Settings**

### **Key Screens & Current Implementation**
- 🎨 **Premium Login/Signup** - Gradient authentication with demo mode (no validation)
- 🏠 **Gradient Home Dashboard** - Blue-to-green header, featured properties, categories
- 🔍 **Real-time Search** - Instant property filtering with gradient search bar
- 📱 **Property Details** - Image gallery with smooth indicators, agent info, amenities
- ❤️ **Favorites Collection** - Heart animations, saved properties management
- 👤 **User Profile** - Demo user profile with settings (placeholder screens)
- 🚀 **Splash Screen** - Animated app logo with smooth transitions
- 📖 **Onboarding** - Feature showcase with compelling visuals

### **Screen Flow:**
```
Splash → Onboarding → Login → Main Navigation
    ↓
Home (Featured Properties) ↔ Search ↔ Favorites ↔ Profile
    ↓
Property Details → Agent Contact
```

---

## 🚀 **Future Enhancements**

### **Phase 2 Features**
- [ ] **Real Estate Agent Portal** - Agent profiles and contact system
- [ ] **Virtual Property Tours** - 360° property viewing experience
- [ ] **Mortgage Calculator** - Built-in loan calculation tools
- [ ] **Push Notifications** - Property alerts and price updates
- [ ] **Social Features** - Share properties and create wishlists

### **Technical Improvements**
- [ ] **Backend Integration** - REST API with real property data
- [ ] **Real-time Updates** - Live property availability and pricing
- [ ] **Offline Support** - Cache favorite properties for offline viewing
- [ ] **Performance Analytics** - User interaction tracking and optimization

---

## 👨‍💻 **Developer Information**

**Developed by:** Saad Nadeem  
**Portfolio:** [GitHub Profile](https://github.com/saadnadeem27)  
**Technology Stack:** Flutter • Dart • GetX • Material Design  
**Development Time:** Complete Frontend Implementation  
**Version:** 1.0.0  

---

## 📄 **License**

This project is created for portfolio demonstration purposes. The code showcases modern Flutter development practices and premium UI design principles.

---

<div align="center">
  <h3>🌟 Crafted with passion for modern mobile development 🌟</h3>
  <p>Built with ❤️ using Flutter & GetX</p>
</div>

---

### 🔗 **Connect & Follow**

- **GitHub:** [@saadnadeem27](https://github.com/saadnadeem27)
- **LinkedIn:** [Connect on LinkedIn](https://www.linkedin.com/in/saad-nadeem-07-an-expert-flutter-developer/)
<!-- - **Portfolio:** [Your Portfolio Website]
- **Email:** [Your Email] -->

> **Note:** This is a frontend-only implementation with dummy data for demonstration purposes. Perfect for showcasing Flutter development skills and modern UI/UX design principles.
