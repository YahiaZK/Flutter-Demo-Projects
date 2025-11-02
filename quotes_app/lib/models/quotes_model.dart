class Quote {
  final String quote;
  final String author;
  final String work;
  final List<String> categories;

  const Quote({
    required this.quote,
    required this.author,
    required this.work,
    required this.categories,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    final categoriesFromJson = json['categories'] as List;
    final List<String> categoriesList = categoriesFromJson
        .map((category) => category.toString())
        .toList();

    return Quote(
      quote: json['quote'],
      author: json['author'],
      work: json['work'],
      categories: categoriesList,
    );
  }
}
