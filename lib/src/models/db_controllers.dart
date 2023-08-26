import "package:masters_pms/src/models/models.dart";
import "../db/documents.dart";
import "../db/students.dart";
import "../db/feedback.dart";
import "../db/supervisors.dart";
import '../db/tags.dart';
import "../db/topics.dart";
import "../db/tasks.dart";

class AuthService {
  bool checkStdRole(email) {
    if (email.endsWith('@student.com')) return true;
    return false;
  }

  bool checkSupRole(email) {
    if (email.endsWith('@supervisor.com')) return true;
    return false;
  }

  Map<String, dynamic> login(email) {
    var students = Students;
    var supervisors = Supervisors;

    var account = {'status': false, 'profile': {}};

    if (checkStdRole(email)) {
      // check students
      for (var student in students) {
        if (student['email'] == email) {
          account = {'status': true, 'profile': student};
        }
        ;
      }
    } else if (checkSupRole(email)) {
      // check supervisors
      for (var sup in supervisors) {
        if (sup['email'] == email) {
          account = {'status': true, 'profile': sup};
        }
        ;
      }
    }
    return account;
  }

  Map<String, dynamic> register() {
    return {};
  }

  List<String> fetchSupNames() {
    List<String> sups = [];
    for (var sup in Supervisors) {
      sups.add("${sup['first_name']} ${sup['last_name']}");
    }
    return sups;
  }

  int fetchSupId(String name) {
    for (var sup in Supervisors) {
      var _names = name.split(' ');
      if (sup['first_name'] == _names[0] && sup['last_name'] == _names[1])
        return int.parse(sup['id'].toString());
    }
    return 0;
  }

  static getSup(int id) {
    for (var sup in Supervisors) {
      if (sup['id'] == id) return Supervisor.fromMap(sup);
    }
  }

  static getStd(int id) {
    for (var std in Students) {
      if (std['id'] == id) return std;
    }
  }
}

class TopicService {
  static void saveTopic(Topic topic) {
    Topics.add({
      "id": topic.id,
      "title": topic.title,
      "tags": topic.theme,
      "student": topic.student,
      "supervisor": topic.supervisor,
      "plan": topic.plan,
    });
  }

  static fetchTopic(int id) {
    for (var topic in Topics) {
      if (topic['id'] == id) return Topic.fromMap(topic);
    }
  }
}

class TagService {
  List<Tag> fetchTags() {
    List<Tag> tags = [];
    for (var tag in Tags) {
      tags.add(Tag.fromMap(tag));
    }
    return tags;
  }

  List<String> fetchTagNames() {
    List<String> tags = [];
    for (var tag in fetchTags()) {
      tags.add(tag.name);
    }
    return tags;
  }

  int get_tag_id(String title) {
    for (var tag in Tags) {
      var _tag = Tag.fromMap(tag);
      if (tag['name'] == title) return _tag.id;
    }
    return 0;
  }
}

class TaskService {
  int topic;

  TaskService({required this.topic});

  Map<String, dynamic> fetchTasks() {
    Map<String, dynamic> tasks = {'Research': [], 'Proposal': [], 'Review': []};

    for (var task in Tasks) {
      var _task = Task.fromMap(task);
      tasks[_task.stage].add(_task);
    }
    return tasks;
  }

  static List<Task> fetchFreeTasks(stage) {
    List<Task> tasks = [];

    for (var task in Tasks) {
      var _task = Task.fromMap(task);
      if (_task.stage == stage) tasks.add(_task);
    }
    return tasks;
  }
}

class FeedService {
  static List<Feed> fetchFeeds(int id) {
    List<Feed> feeds = [];
    for (var feed in Feedback) {
      if (feed['task'] == id) feeds.add(Feed.fromMap(feed));
    }
    return feeds;
  }
}

class DocService {
  static List<Document> fetchDocs(Task task) {
    List<Document> docs = [];
    for (var doc in Documents) {
      if (doc['task'] == task.id) docs.add(Document.fromMap(doc));
    }
    return docs;
  }
}
