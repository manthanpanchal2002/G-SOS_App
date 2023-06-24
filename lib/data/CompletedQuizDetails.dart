// ignore: file_names
import 'dart:convert';

List<CompletedQuizDetails> completedQuizDetailsFromJson(String str) => List<CompletedQuizDetails>.from(json.decode(str).map((x) => CompletedQuizDetails.fromJson(x)));

String completedQuizDetailsToJson(List<CompletedQuizDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompletedQuizDetails {
    int id;
    int userId;
    int subjectId;
    String subjectName;
    String subjectImage;
    int score;
    int totalQues;
    int correctAnswer;
    int wrongAnswer;
    int percentage;
    String grade;
    DateTime date;
    bool success;

    CompletedQuizDetails({
        required this.id,
        required this.userId,
        required this.subjectId,
        required this.subjectName,
        required this.subjectImage,
        required this.score,
        required this.totalQues,
        required this.correctAnswer,
        required this.wrongAnswer,
        required this.percentage,
        required this.grade,
        required this.date,
        required this.success,
    });

    factory CompletedQuizDetails.fromJson(Map<String, dynamic> json) => CompletedQuizDetails(
        id: json["id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        subjectImage: json["subject_image"],
        score: json["score"],
        totalQues: json["total_Ques"],
        correctAnswer: json["correct_answer"],
        wrongAnswer: json["wrong_answer"],
        percentage: json["percentage"],
        grade: json["grade"],
        date: DateTime.parse(json["date"]),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "subject_image": subjectImage,
        "score": score,
        "total_Ques": totalQues,
        "correct_answer": correctAnswer,
        "wrong_answer": wrongAnswer,
        "percentage": percentage,
        "grade": grade,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "success": success,
    };
}
