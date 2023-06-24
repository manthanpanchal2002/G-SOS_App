// ignore: file_names
import 'dart:convert';

List<GalleryForSapDetails> galleryForSapDetailsFromJson(String str) =>
    List<GalleryForSapDetails>.from(
        json.decode(str).map((x) => GalleryForSapDetails.fromJson(x)));

String galleryForSapDetailsToJson(List<GalleryForSapDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryForSapDetails {
  int id;
  int catagoryId;
  String contentTitle;
  String contentImage;
  int status;
  bool success;

  GalleryForSapDetails({
    required this.id,
    required this.catagoryId,
    required this.contentTitle,
    required this.contentImage,
    required this.status,
    required this.success,
  });

  factory GalleryForSapDetails.fromJson(Map<String, dynamic> json) =>
      GalleryForSapDetails(
        id: json["id"],
        catagoryId: json["catagory_id"],
        contentTitle: json["content_title"],
        contentImage: json["content_image"],
        status: json["status"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catagory_id": catagoryId,
        "content_title": contentTitle,
        "content_image": contentImage,
        "status": status,
        "success": success,
      };
}
