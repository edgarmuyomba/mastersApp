import "package:masters_pms/src/models/models.dart";
import "../db/documents.dart";
import "../db/students.dart";
import "../db/feedback.dart";
import "../db/supervisors.dart";
import '../db/tags.dart';
import "../db/topics.dart";

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

    var account = {
      'status': false,
      'profile': {}
      };

    if (checkStdRole(email)) {
      // check students
      for (var student in students) {
        if (student['email'] == email) {
          account = {
            'status': true,
            'profile': student
          };
        };
      }
    } else if (checkSupRole(email)) {
      // check supervisors
      for (var sup in supervisors) {
        if (sup['email'] == email) {
          account = {
            'status': true,
            'profile': sup
          };
        };
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
      if (sup['first_name'] == _names[0] && sup['last_name'] == _names[1]) return int.parse(sup['id'].toString());
    }
    return 0;
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