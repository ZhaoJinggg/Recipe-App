import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/user.dart';
import 'package:recipe_app/models/post.dart';

class MockDataService {
  static final List<Recipe> _recipes = [
    Recipe(
      id: '1',
      title: 'Crepes with Orange and Honey',
      category: 'Western',
      imageUrl: 'https://images.unsplash.com/photo-1565299543923-37dd37887442',
      rating: 4.5,
      prepTimeMinutes: 35,
      servings: 3,
      calories: 103,
      ingredients: [
        '2 Eggs',
        '1 Cup All purpose flour',
        '1/2 Cup Whole milk',
        '2 Tablespoon Butter',
        '1 Orange',
        '3 Tablespoon Honey',
      ],
      directions: [
        'In a large mixing bowl, whisk together the flour and the eggs. Gradually add in the milk and water, stirring to combine.',
        'Add the salt and butter; beat until smooth.',
        'Heat a lightly oiled griddle or frying pan over medium-high heat.',
        'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each crepe.',
        'Tilt the pan with a circular motion so that the batter coats the surface evenly.',
        'Cook the crepe for about 2 minutes, until the bottom is light brown. Loosen with a spatula, turn and cook the other side.',
        'Serve with sliced oranges and drizzle with honey.',
      ],
      authorId: 'user1',
      authorName: 'Chef Teresa',
    ),
    Recipe(
      id: '2',
      title: 'Chicken Curry',
      category: 'Asian',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641',
      rating: 4.8,
      prepTimeMinutes: 45,
      servings: 4,
      calories: 320,
      ingredients: [
        '500g Chicken breast',
        '2 Onions',
        '3 Garlic cloves',
        '1 tbsp Ginger',
        '2 tbsp Curry powder',
        '400ml Coconut milk',
        'Fresh coriander',
      ],
      directions: [
        'Dice chicken into 1-inch cubes.',
        'Sauté onions, garlic, and ginger until fragrant.',
        'Add curry powder and stir for 1 minute.',
        'Add chicken and cook until no longer pink.',
        'Pour in coconut milk and simmer for 20 minutes.',
        'Garnish with fresh coriander before serving.',
      ],
      authorId: 'user2',
      authorName: 'Chef Mike',
    ),
    Recipe(
      id: '3',
      title: 'Classic Tiramisu',
      category: 'Dessert',
      imageUrl: 'https://images.unsplash.com/photo-1586040140378-939a5d982dc4',
      rating: 4.9,
      prepTimeMinutes: 30,
      servings: 8,
      calories: 420,
      ingredients: [
        '6 Egg yolks',
        '3/4 Cup Sugar',
        '2/3 Cup Milk',
        '1 1/4 Cups Heavy cream',
        '1/2 tsp Vanilla extract',
        '1 Cup Strong coffee, room temperature',
        '24 Ladyfingers',
        '2 tbsp Cocoa powder',
      ],
      directions: [
        'In a medium saucepan, whisk together egg yolks and sugar until well blended.',
        'Whisk in milk and cook over medium heat, stirring constantly, until mixture boils.',
        'Boil gently for 1 minute, remove from heat and allow to cool slightly.',
        'Cover tightly and chill in refrigerator 1 hour.',
        'Beat cream with vanilla until stiff peaks form.',
        'Whisk mascarpone into yolk mixture until smooth.',
        'In a small bowl, combine coffee and rum. Split ladyfingers in half lengthwise and drizzle with coffee mixture.',
        'Arrange half of soaked ladyfingers in bottom of a 7x11 inch dish.',
        'Spread half of mascarpone mixture over ladyfingers, then half of whipped cream over that.',
        'Repeat layers and sprinkle with cocoa.',
        'Cover and refrigerate 4 to 6 hours, until set.',
      ],
      authorId: 'user3',
      authorName: 'Chef Sophia',
    ),
  ];

  static final User _currentUser = User(
    id: 'current_user',
    name: 'Teresa',
    email: 'teresa@example.com',
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    favoriteRecipes: ['1'],
  );

  static final List<Post> _posts = [
    Post(
      id: 'post1',
      userId: 'user1',
      userName: 'Chef Teresa',
      userProfileUrl: 'https://randomuser.me/api/portraits/women/43.jpg',
      content:
          'Just made these amazing crepes with orange and honey! So delicious and easy to make.',
      imageUrl: 'https://images.unsplash.com/photo-1565299543923-37dd37887442',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      likes: 24,
    ),
    Post(
      id: 'post2',
      userId: 'user2',
      userName: 'Chef Mike',
      userProfileUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      content:
          'Experimenting with some new curry recipes today. What\'s your favorite curry dish?',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      likes: 18,
      comments: [
        Comment(
          id: 'comment1',
          userId: 'user3',
          userName: 'Chef Sophia',
          content:
              'Thai green curry is my favorite! Would love to see your take on it.',
          createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        ),
      ],
    ),
    Post(
      id: 'post3',
      userId: 'user3',
      userName: 'Chef Sophia',
      userProfileUrl: 'https://randomuser.me/api/portraits/women/66.jpg',
      content:
          'Who else loves making desserts? Just finished this tiramisu for a family dinner tonight!',
      imageUrl: 'https://images.unsplash.com/photo-1586040140378-939a5d982dc4',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      likes: 42,
    ),
  ];

  // Get all recipes
  static List<Recipe> getAllRecipes() {
    return List.from(_recipes);
  }

  // Get recipes by category
  static List<Recipe> getRecipesByCategory(String category) {
    return _recipes.where((recipe) => recipe.category == category).toList();
  }

  // Get recipe by ID
  static Recipe? getRecipeById(String id) {
    try {
      return _recipes.firstWhere((recipe) => recipe.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get current user
  static User getCurrentUser() {
    return _currentUser;
  }

  // Get favorite recipes
  static List<Recipe> getFavoriteRecipes() {
    return _recipes
        .where((recipe) => _currentUser.favoriteRecipes.contains(recipe.id))
        .toList();
  }

  // Get all posts
  static List<Post> getAllPosts() {
    return List.from(_posts);
  }

  // Mock adding a new post
  static Post addPost(String content, String? imageUrl) {
    final newPost = Post(
      id: 'post${_posts.length + 1}',
      userId: _currentUser.id,
      userName: _currentUser.name,
      userProfileUrl: _currentUser.profileImageUrl,
      content: content,
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
    );

    // In a real app, this would be saved to a database
    // _posts.add(newPost);

    return newPost;
  }
}
