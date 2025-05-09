import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/signup_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/favorites_screen.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';
import 'package:recipe_app/screens/community_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/community': (context) => const CommunityScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/recipe') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(
              recipeId: args['recipeId'],
            ),
          );
        }
        return null;
      },
    );
  }
}
