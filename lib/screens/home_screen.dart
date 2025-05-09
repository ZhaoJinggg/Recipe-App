import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/mock_data_service.dart';
import 'package:recipe_app/widgets/category_selector.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import 'package:recipe_app/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CategoryItem> _categories = [
    CategoryItem(title: 'Popular', icon: Icons.local_fire_department),
    CategoryItem(title: 'Western', icon: Icons.local_pizza),
    CategoryItem(title: 'Drinks', icon: Icons.coffee),
    CategoryItem(title: 'Local', icon: Icons.restaurant),
    CategoryItem(title: 'Dessert', icon: Icons.cake),
  ];

  int _selectedCategoryIndex = 0;
  List<Recipe> _recipes = [];
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() {
    // In a real app, this would fetch from an API
    setState(() {
      _recipes = MockDataService.getAllRecipes();
    });
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      // In a real app, filter recipes by category
      // For now, we'll just use all recipes
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });

    // Navigate to different screens based on index
    switch (index) {
      case 0:
        // Already on home screen
        break;
      case 3:
        Navigator.pushNamed(context, '/favorites');
        break;
      case 4:
        Navigator.pushNamed(context, '/community');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = MockDataService.getCurrentUser();
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profileImageUrl ?? 'https://via.placeholder.com/150',
                          ),
                          radius: 20,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, ${user.name}!',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Make your own food,',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'stay at home',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, size: 28),
                      onPressed: () {
                        // TODO: Implement notifications
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search any recipe',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.tune),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CategorySelector(
                categories: _categories,
                onCategorySelected: _onCategorySelected,
                initialSelected: _selectedCategoryIndex,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Popular Recipes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildRecipeList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildRecipeList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: _recipes.map((recipe) {
          return RecipeCard(
            recipe: recipe,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/recipe',
                arguments: {'recipeId': recipe.id},
              );
            },
          );
        }).toList(),
      ),
    );
  }
} 