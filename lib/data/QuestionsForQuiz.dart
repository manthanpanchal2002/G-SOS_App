// ignore: file_names
import 'dart:convert';

List<QuestionsForQuiz> questionsForQuizFromJson(String str) => List<QuestionsForQuiz>.from(json.decode(str).map((x) => QuestionsForQuiz.fromJson(x)));

String questionsForQuizToJson(List<QuestionsForQuiz> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionsForQuiz {
    int id;
    int catagoryId;
    String subject;
    String subjectImage;
    String questions;
    String option1;
    String option2;
    String option3;
    String option4;
    String answer;
    bool success;

    QuestionsForQuiz({
        required this.id,
        required this.catagoryId,
        required this.subject,
        required this.subjectImage,
        required this.questions,
        required this.option1,
        required this.option2,
        required this.option3,
        required this.option4,
        required this.answer,
        required this.success,
    });

    factory QuestionsForQuiz.fromJson(Map<String, dynamic> json) => QuestionsForQuiz(
        id: json["id"],
        catagoryId: json["catagory_id"],
        subject: json["subject"],
        subjectImage: json["subject_image"],
        questions: json["questions"],
        option1: json["option 1"],
        option2: json["option 2"],
        option3: json["option 3"],
        option4: json["option 4"],
        answer: json["answer"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catagory_id": catagoryId,
        "subject": subject,
        "subject_image": subjectImage,
        "questions": questions,
        "option 1": option1,
        "option 2": option2,
        "option 3": option3,
        "option 4": option4,
        "answer": answer,
        "success": success,
    };
}
