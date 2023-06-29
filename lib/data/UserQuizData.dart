// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

import '../Routes/routes.dart';
import '../pages/landing_page.dart';
import '../pages/quiz_page.dart';

Future<http.Response> getUserDataForScore() async {
  var url = "http://$ipAddress/gsos/api.php?entity=mcqs";
  Map data = {
    "uid": user_id,
    "cat_id": questions_for_quiz[0].catagoryId,
    "data": [
      {
        "user_id": user_id,
        "catagory_id": questions_for_quiz[0].catagoryId,
        "ques_id": questions_for_quiz[0].id,
        "user_ans": quizCard1_user_choice
      },
      {
        "user_id": user_id,
        "catagory_id": questions_for_quiz[0].catagoryId,
        "ques_id": questions_for_quiz[1].id,
        "user_ans": quizCard2_user_choice
      },
      {
        "user_id": user_id,
        "catagory_id": questions_for_quiz[0].catagoryId,
        "ques_id": questions_for_quiz[2].id,
        "user_ans": quizCard3_user_choice
      },
      {
        "user_id": user_id,
        "catagory_id": questions_for_quiz[0].catagoryId,
        "ques_id": questions_for_quiz[3].id,
        "user_ans": quizCard4_user_choice
      },
      {
        "user_id": user_id,
        "catagory_id": questions_for_quiz[0].catagoryId,
        "ques_id": questions_for_quiz[4].id,
        "user_ans": quizCard5_user_choice
      }
    ]
  };

  var jsonEncodedData = jsonEncode(data);

  final response = await post(Uri.parse(url), body: jsonEncodedData);

  if (response.statusCode == 200) {
    print(response.body.toString());
  } else {
    print(response.reasonPhrase);
  }
  return response;
}
