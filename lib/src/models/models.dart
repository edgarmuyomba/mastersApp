import '../utils/get_id.dart';

class Topic {
  int id = get_id();
  String title;
  int theme;
  int student;
  int supervisor = 0;
  String stage = "Proposal";
  int completion = 0;
  String plan;

  Topic({
    required this.title,
    required this.theme,
    required this.student,
    required this.plan,
    required this.supervisor,
  });
}

class Tag {
  int id;
  String name;
  List topics;
  String description;
  String category;

  Tag({
    required this.id,
    required this.name,
    required this.topics,
    required this.description,
    required this.category,
  });

  factory Tag.fromMap(Map<String, dynamic> tag) {
    return Tag(
      id: tag['id'],
      name: tag['name'],
      topics: tag['topics'],
      description: tag['description'],
      category: tag['category']
    );
  }
}