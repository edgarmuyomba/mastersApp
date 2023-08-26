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
    // required this.id,
    required this.title,
    required this.theme,
    required this.student,
    // required this.stage,
    // required this.completion,
    required this.plan,
    required this.supervisor,
  });

  factory Topic.fromMap(Map<String, dynamic> topic) {
    return Topic(
      // id: topic['id'],
      title: topic['title'],
      theme: topic['tags'],
      student: topic['student'],
      // stage: topic['stage'],
      // completion: topic['completion'],
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

class Task{
  int id;
  String title;
  String due_date;
  int student;
  String status;
  int topic;
  String stage;

  Task({
    required this.id,
    required this.title,
    required this.due_date,
    required this.student,
    required this.status,
    required this.topic,
    required this.stage,
  });

  factory Task.fromMap(Map<String, dynamic> task) {
    return Task(
      id: task['id'],
      title: task['title'],
      due_date: task['due_date'],
      student: task['student'],
      status: task['status'],
      topic: task['topic'],
      stage: task['stage']
    );
  }
}

class Supervisor {
  int id;
  String first_name;
  String last_name;
  String contact;
  String bio_data;
  String username;
  String email;
  Map<String, dynamic> educ_bg;
  List<int> expertise;
  List<int> interests;
  // List<int> assignments;
  List<int> former_students;

  Supervisor({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.contact,
    required this.bio_data,
    required this.username,
    required this.email,
    required this.educ_bg,
    required this.expertise,
    required this.interests,
    // required this.assignments,
    required this.former_students,
  });

  factory Supervisor.fromMap(Map<String, dynamic> sup) {
    return Supervisor(
      id: sup['id'], 
      first_name: sup['first_name'], 
      last_name: sup['last_name'], 
      contact: sup['contact'], 
      bio_data: sup['bio_data'], 
      username: sup['username'], 
      email: sup['email'], 
      educ_bg: sup['educ_bg'], 
      expertise: sup['expertise'], 
      interests: sup['interests'], 
      // assignments: sup['assignments'], 
      former_students: sup['former_students']);
  }
}

class Feed {
  int id;
  String title;
  String content;
  int supervisor;
  int task;
  String timestamp;

  Feed({
    required this.id,
    required this.title,
    required this.content,
    required this.supervisor,
    required this.task,
    required this.timestamp,
  });

  factory Feed.fromMap(Map<String, dynamic> feedback) {
    return Feed(
      id: feedback['id'],
      title: feedback['title'],
      content: feedback['content'],
      supervisor: feedback['supervisor'],
      task: feedback['task'],
      timestamp: feedback['timestamp'],
    );
  }
}

class Document {
  int id;
  String title;
  String file;
  String submission_date;
  int task;

  Document({
    required this.id,
    required this.title,
    required this.file,
    required this.submission_date,
    required this.task
  });

  factory Document.fromMap(Map<String, dynamic> doc) {
    return Document(
      id: doc['id'],
      title: doc['title'],
      file: doc['file'],
      submission_date: doc['submission_date'],
      task: doc['task'],
    );
  }
}

class Student {
  int id;
  String first_name;
  String last_name;
  String contact;
  String bio_data;
  String username;
  String email;
  Map<String, dynamic> educ_bg;

  Student({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.contact,
    required this.bio_data,
    required this.username,
    required this.email,
    required this.educ_bg,
  });

  factory Student.fromMap(Map<String, dynamic> std) {
    return Student(
      id: std['id'], 
      first_name: std['first_name'], 
      last_name: std['last_name'], 
      contact: std['contact'], 
      bio_data: std['bio_data'], 
      username: std['username'], 
      email: std['email'], 
      educ_bg: std['educ_bg'], 
      );
  }
}