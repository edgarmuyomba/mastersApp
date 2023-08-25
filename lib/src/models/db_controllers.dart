import "../db/documents.dart";
import "../db/students.dart";
import "../db/feedback.dart";
import "../db/supervisors.dart";
import "../db/tags.dart";
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

    var profile;

    if (checkStdRole(email)) {
      // check students
      for (var student in students) {
        if (student['email'] == email) profile = student;
      }
      profile = {"status": false};
    } else if (checkSupRole(email)) {
      // check supervisors
      for (var sup in supervisors) {
        if (sup['email'] == email) profile = sup;
      }
      profile = {"status": false};
    } else
      profile = {"status": false};
    return profile;
  }

  static Map<String, dynamic> register() {
    return {};
  }
}
