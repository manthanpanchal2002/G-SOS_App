// To parse this JSON data, do
//
//     final trainingDetails = trainingDetailsFromJson(jsonString);

import 'dart:convert';

List<TrainingDetails> trainingDetailsFromJson(String str) =>
    List<TrainingDetails>.from(
        json.decode(str).map((x) => TrainingDetails.fromJson(x)));

String trainingDetailsToJson(List<TrainingDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainingDetails {
  int id;
  String trainingName;
  String trainingImage;
  String trainingVideo;
  int duration;
  bool success;

  TrainingDetails({
    required this.id,
    required this.trainingName,
    required this.trainingImage,
    required this.trainingVideo,
    required this.duration,
    required this.success,
  });

  factory TrainingDetails.fromJson(Map<String, dynamic> json) =>
      TrainingDetails(
        id: json["id"],
        trainingName: json["training_name"],
        trainingImage: json["training_image"],
        trainingVideo: json["training_video"],
        duration: json["duration"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "training_name": trainingName,
        "training_image": trainingImage,
        "training_video": trainingVideo,
        "duration": duration,
        "success": success,
      };
}
