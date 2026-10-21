class Game {
  final int id;
  final String name;
  final String genre;
  final String description;
  final String releaseDate;
  final double rating;
  final String imageUrl;
  final String developer;
  final String platforms;
  final String websiteUrl;

  const Game({
    required this.id,
    required this.name,
    required this.genre,
    required this.description,
    required this.releaseDate,
    required this.rating,
    required this.imageUrl,
    required this.developer,
    required this.platforms,
    required this.websiteUrl,
  });
}