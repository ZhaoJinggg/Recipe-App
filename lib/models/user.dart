class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final List<String> favoriteRecipes;
  final List<String> postedRecipes;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.favoriteRecipes = const [],
    this.postedRecipes = const [],
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    List<String>? favoriteRecipes,
    List<String>? postedRecipes,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      favoriteRecipes: favoriteRecipes ?? this.favoriteRecipes,
      postedRecipes: postedRecipes ?? this.postedRecipes,
    );
  }
} 