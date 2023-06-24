// ignore: file_names
import 'dart:convert';

List<SecurityAwarenessDetails> securityAwarenessDetailsFromJson(String str) =>
    List<SecurityAwarenessDetails>.from(
        json.decode(str).map((x) => SecurityAwarenessDetails.fromJson(x)));

String securityAwarenessDetailsToJson(List<SecurityAwarenessDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SecurityAwarenessDetails {
  int id;
  String catagoryName;
  String catagoryImage;
  bool success;

  SecurityAwarenessDetails({
    required this.id,
    required this.catagoryName,
    required this.catagoryImage,
    required this.success,
  });

  factory SecurityAwarenessDetails.fromJson(Map<String, dynamic> json) =>
      SecurityAwarenessDetails(
        id: json["id"],
        catagoryName: json["catagory_name"],
        catagoryImage: json["catagory_image"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catagory_name": catagoryName,
        "catagory_image": catagoryImage,
        "success": success,
      };
}
