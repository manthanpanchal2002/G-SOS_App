import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Questions/Questions.dart';

class QuestionController extends GetxController
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();
  List<Question> get questions => this._questions;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _correctAnsCount = 0;
  int get correctAnsCount => this._correctAnsCount;
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(minutes: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    super.onInit();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == selectedIndex) {
      _correctAnsCount++;
    }
    _animationController.stop();
    update();
  }
}
