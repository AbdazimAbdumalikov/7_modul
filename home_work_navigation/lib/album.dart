class Artist {
  final String name;
  final String link;
  final String about;

  const Artist({
    required this.name,
    required this.link,
    required this.about,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'] as String,
      link: json['link'] as String,
      about: json['about'] as String,
    );
  }
}