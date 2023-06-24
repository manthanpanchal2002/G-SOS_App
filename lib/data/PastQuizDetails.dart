// To parse this JSON data, do
//
//     final pastQuizDetails = pastQuizDetailsFromJson(jsonString);

import 'dart:convert';

List<PastQuizDetails> pastQuizDetailsFromJson(String str) => List<PastQuizDetails>.from(json.decode(str).map((x) => PastQuizDetails.fromJson(x)));

String pastQuizDetailsToJson(List<PastQuizDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PastQuizDetails {
    int id;
    int userId;
    int subjectId;
    String subjectName;
    String subjectImage;
    int duration;
    DateTime date;
    bool success;

    PastQuizDetails({
        required this.id,
        required this.userId,
        required this.subjectId,
        required this.subjectName,
        required this.subjectImage,
        required this.duration,
        required this.date,
        required this.success,
    });

    factory PastQuizDetails.fromJson(Map<String, dynamic> json) => PastQuizDetails(
        id: json["id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        subjectImage: json["subject_image"],
        duration: json["duration"],
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
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "success": success,
    };
}
