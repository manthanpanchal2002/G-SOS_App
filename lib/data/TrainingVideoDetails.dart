

import 'dart:convert';

List<TrainingVideoDetails> trainingVideoDetailsFromJson(String str) => List<TrainingVideoDetails>.from(json.decode(str).map((x) => TrainingVideoDetails.fromJson(x)));

String trainingVideoDetailsToJson(List<TrainingVideoDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainingVideoDetails {
    String trainingName;
    String trainingImage;
    String trainingVideo;
    int duration;
    bool success;

    TrainingVideoDetails({
        required this.trainingName,
        required this.trainingImage,
        required this.trainingVideo,
        required this.duration,
        required this.success,
    });

    factory TrainingVideoDetails.fromJson(Map<String, dynamic> json) => TrainingVideoDetails(
        trainingName: json["training_name"],
        trainingImage: json["training_image"],
        trainingVideo: json["training_video"],
        duration: json["duration"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "training_name": trainingName,
        "training_image": trainingImage,
        "training_video": trainingVideo,
        "duration": duration,
        "success": success,
    };
}
