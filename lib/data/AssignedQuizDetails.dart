// ignore: file_names
import 'dart:convert';

List<AssignedQuizDetails> assignedQuizDetailsFromJson(String str) =>
List<AssignedQuizDetails>.from(json.decode(str).map((x) => 
AssignedQuizDetails.fromJson(x)));

String assignedQuizDetailsToJson(List<AssignedQuizDetails> data) => 
json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssignedQuizDetails {
    int id;
    int userId;
    int subjectId;
    String subjectName;
    String subjectImage;
    int duration;
    int criteria;
    DateTime date;
    bool success;

    AssignedQuizDetails({
        required this.id,
        required this.userId,
        required this.subjectId,
        required this.subjectName,
        required this.subjectImage,
        required this.duration,
        required this.criteria,
        required this.date,
        required this.success,
    });

    factory AssignedQuizDetails.fromJson(Map<String, dynamic> json) => 
    AssignedQuizDetails(
        id: json["id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        subjectImage: json["subject_image"],
        duration: json["duration"],
        criteria: json["criteria"],
        date: DateTime.parse(json["date"]),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "subject_image": subjectImage,
        "duration": duration,
        "criteria": criteria,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.
        toString().padLeft(2, '0')}-${date.day.toString().
        padLeft(2, '0')}",
        "success": success,
    };
}
