import '../utils/get_id.dart';

class Topic {
  int id;
  String title;
  int theme;
  int student;
  int supervisor = 0;
  String stage;
  int completion;
  String plan;

  Topic({
    required this.id,
    required this.title,
    required this.theme,
    required this.student,
    required this.stage,
    required this.completion,
    required this.plan,
    required this.supervisor,
  });

  factory Topic.fromMap(Map<String, dynamic> topic) {
    return Topic(
      id: topic['id'],
      title: topic['title'],
      theme: topic['tags'],
      student: topic['student'],
      stage: topic['stage'],
      completion: topic['completion'],
      plan: topic['plan'],
      supervisor: topic['supervisor']
    );
  }
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