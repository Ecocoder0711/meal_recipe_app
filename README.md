<div align="center">

# 🍽️ Meal Recipe App

### *Discover, Explore, and Save Your Favorite Recipes*

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?style=for-the-badge&logo=dart)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/Riverpod-2.6.1-purple?style=for-the-badge)](https://riverpod.dev)

---

</div>

## 📱 App Demo

<div align="center">
  <img src="assets/video/meal_recipe.gif" alt="Meal Recipe App Demo" width="300"/>
</div>

---

## ✨ Features

🎯 **Browse Categories** - Explore meals organized by cuisine and dish type  
❤️ **Favorites Management** - Save and manage your favorite recipes with ease  
📖 **Detailed Recipes** - View ingredients, cooking steps, and nutritional information  
⏱️ **Duration & Complexity** - See cooking time and difficulty level at a glance  
🥗 **Dietary Filters** - Find meals that match your dietary preferences (Vegan, Vegetarian, Gluten-Free, Lactose-Free)  
💰 **Affordability Indicator** - Know the cost level before you start cooking  
🎨 **Beautiful UI** - Modern, intuitive design with smooth animations  
🌙 **Custom Theme** - Eye-pleasing color scheme with Google Fonts integration

---

## 🏗️ App Architecture

The app follows a **clean architecture** pattern with proper separation of concerns:

```
lib/
├── main.dart                 # App entry point
├── runapp.dart              # App configuration
├── data/                    # Data layer
│   ├── category_data.dart   # Category data source
│   └── meal_data.dart       # Meal data source
├── model/                   # Data models
│   ├── category_model.dart  # Category structure
│   └── meals_model.dart     # Meal structure with enums
├── provider/                # State management (Riverpod)
│   ├── favorites_provider.dart
│   └── meal_provider.dart
├── screen/                  # UI screens
│   ├── homescreen.dart      # Main navigation
│   ├── category_screen.dart # Category grid view
│   ├── meals_screen.dart    # Meals list view
│   ├── recipe_page.dart     # Detailed recipe view
│   └── favorites_screen.dart
├── widget/                  # Reusable components
│   ├── item_trait.dart
│   └── snackbar.dart
└── utils/                   # Utilities
    └── theme_data.dart      # App theming
```

---

## 🔄 App Logic Flow

### 1️⃣ **App Initialization**
```
main.dart → ProviderScope → MealRecipeApp
```
- The app wraps the root widget with `ProviderScope` for Riverpod state management
- Initializes theme and navigation

### 2️⃣ **Home Screen Navigation**
```
Homescreen → Bottom Navigation Bar
    ├── CategoryScreen (Index 0)
    └── FavoritesScreen (Index 1)
```
- Bottom navigation allows switching between Categories and Favorites
- State is managed locally with `StatefulWidget`

### 3️⃣ **Category → Meals Flow**
```
CategoryScreen → Select Category → MealsScreen → Display Filtered Meals
```
- User taps on a category
- App filters meals based on selected category ID
- Displays meals in a list/grid format

### 4️⃣ **Meal Details & Recipe**
```
MealsScreen → Tap Meal → RecipePage
    ├── Display: Image, Title, Duration, Complexity, Affordability
    ├── Ingredients List
    ├── Cooking Steps
    └── Favorite Toggle Button
```
- Shows complete meal information
- User can add/remove from favorites

### 5️⃣ **Favorites Management (Riverpod)**
```
FavoritesMealsNotifier (StateNotifier)
    ├── toggleMealFavState() → Add/Remove meal
    └── state → List<Mealmodel>
```
- `StateNotifier` manages favorites list
- `toggleMealFavState()` checks if meal exists:
  - **If exists**: Removes from favorites → Returns `false`
  - **If not exists**: Adds to favorites → Returns `true`
- UI updates automatically via Riverpod

### 6️⃣ **Data Flow**
```
Data Layer (Static Data)
    ├── category_data.dart → List<CategoryModel>
    └── meal_data.dart → List<Mealmodel>
         ↓
    Providers (State Management)
         ↓
    UI Screens (Consumer Widgets)
```

---

## 🎨 Data Models

### Meal Model
```dart
- id: String
- categories: List<String>
- title: String
- imageUrl: String
- ingredients: List<String>
- steps: List<String>
- duration: int
- complexity: Enum (simple, challenging, hard)
- affordability: Enum (affordable, pricey, luxurious)
- Dietary flags: isGlutenFree, isLactoseFree, isVegan, isVegetarian
```

### Category Model
```dart
- id: String
- title: String
- color: Color
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| **Flutter 3.9.2** | Cross-platform UI framework |
| **Dart 3.9.2** | Programming language |
| **Riverpod 2.6.1** | State management solution |
| **Google Fonts** | Custom typography |
| **Transparent Image** | Image loading placeholders |
| **Animated Text Kit** | Text animations |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.9.2)
- Dart SDK (>=3.9.2)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDEs)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/meal_recipe_app.git
   cd meal_recipe_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   
   # Web
   flutter build web --release
   ```

---

## 📂 Project Structure Details

### **Providers**
- `favoriteMealsProvider`: Manages the list of favorite meals
- `mealProvider`: Provides access to meal data

### **Screens**
- `Homescreen`: Main navigation container with bottom nav bar
- `CategoryScreen`: Grid of meal categories
- `MealsScreen`: List of meals filtered by category
- `RecipePage`: Detailed recipe view with ingredients and steps
- `FavoritesScreen`: Collection of user's favorite recipes

### **Widgets**
- `ItemTrait`: Reusable widget for displaying meal attributes
- `Snackbar`: Custom snackbar for user feedback

---

## 🎯 Key Features Implementation

### State Management with Riverpod
```dart
// Provider definition
final favoriteMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Mealmodel>>(
  (ref) => FavoritesMealsNotifier()
);

// Usage in widget
final favorites = ref.watch(favoriteMealsProvider);
```

### Toggle Favorites Logic
```dart
bool toggleMealFavState(Mealmodel meal) {
  bool mealIsFav = state.contains(meal);
  if (mealIsFav) {
    state = state.where((m) => m.id != meal.id).toList();
    return false; // Removed
  } else {
    state = [...state, meal];
    return true; // Added
  }
}
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 👨‍💻 Author

**Saksham Kashyap**

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for elegant state management
- Google Fonts for beautiful typography
- All contributors and supporters

---

<div align="center">

### ⭐ Don't forget to star this repo if you found it helpful!

**Made with ❤️ and Flutter**

</div>
