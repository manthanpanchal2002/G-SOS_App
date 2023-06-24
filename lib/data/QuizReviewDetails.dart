// To parse this JSON data, do
//
//     final quizReviewDetails = quizReviewDetailsFromJson(jsonString);

import 'dart:convert';

List<QuizReviewDetails> quizReviewDetailsFromJson(String str) => List<QuizReviewDetails>.from(json.decode(str).map((x) => QuizReviewDetails.fromJson(x)));

String quizReviewDetailsToJson(List<QuizReviewDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizReviewDetails {
    int id;
    int subjectId;
    String subjectName;
    String subjectImage;
    String question;
    String option1;
    String option2;
    String option3;
    String option4;
    String correctAnswer;
    String userAnswer;
    bool success;

    QuizReviewDetails({
        required this.id,
        required this.subjectId,
        required this.subjectName,
        required this.subjectImage,
        required this.question,
        required this.option1,
        required this.option2,
        required this.option3,
        required this.option4,
        required this.correctAnswer,
        required this.userAnswer,
        required this.success,
    });

    factory QuizReviewDetails.fromJson(Map<String, dynamic> json) => QuizReviewDetails(
        id: json["id"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        subjectImage: json["subject_image"],
        question: json["question"],
        option1: json["option_1"],
        option2: json["option_2"],
        option3: json["option_3"],
        option4: json["option_4"],
        correctAnswer: json["correct_answer"],
        userAnswer: json["user_answer"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "subject_image": subjectImage,
        "question": question,
        "option_1": option1,
        "option_2": option2,
        "option_3": option3,
        "option_4": option4,
        "correct_answer": correctAnswer,
        "user_answer": userAnswer,
        "success": success,
    };
}
