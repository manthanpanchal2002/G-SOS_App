import 'dart:convert';
import 'package:http/http.dart' as http;

const url = "http://localhost/gsos/api.php?entity=mcqs";
var data = {
  "submit": true,
  "uid": 1,
  "cat_id": 2,
  "data": [
    {
      "user_id": 1,
      "catagory_id": 2,
      "ques_id": 6,
      "user_ans": "A phishing attack conducted through SMS messages"
    },
    {
      "user_id": 1,
      "catagory_id": 2,
      "ques_id": 7,
      "user_ans":
          "By tricking users into providing sensitive information through text messages"
    },
    {
      "user_id": 1,
      "catagory_id": 2,
      "ques_id": 8,
      "user_ans": "All of the above"
    },
    {
      "user_id": 1,
      "catagory_id": 2,
      "ques_id": 9,
      "user_ans": "All of the above"
    },
    {
      "user_id": 1,
      "catagory_id": 2,
      "ques_id": 10,
      "user_ans":
          "To deceive users into sharing personal or financial information"
    }
  ]
};

var jsonEncodedData = jsonEncode(data);

void getUserDataForScore( int id, int userId, int catId) async {
  final http.Response response = await http.post(
    Uri.parse(url),
    body: {
      "submit": true,
      "uid": userId,
      "cat_id": catId,
      "data": [
        {
          "user_id": userId,
          "catagory_id": catId,
          "ques_id": id,
          "user_ans": "A phishing attack conducted through SMS messages"
        },
        {
          "user_id": userId,
          "catagory_id": catId,
          "ques_id": id,
          "user_ans":
              "By tricking users into providing sensitive information through text messages"
        },
        {
          "user_id": userId,
          "catagory_id": catId,
          "ques_id": id,
          "user_ans": "All of the above"
        },
        {
          "user_id": userId,
          "catagory_id": catId,
          "ques_id": id,
          "user_ans": "All of the above"
        },
        {
          "user_id": userId,
          "catagory_id": catId,
          "ques_id": id,
          "user_ans":
              "To deceive users into sharing personal or financial information"
        }
      ]
    },
  );

  if (response.statusCode == 200) {
    print(response.body.toString());
  } else {
    print(response.reasonPhrase);
  }
}
