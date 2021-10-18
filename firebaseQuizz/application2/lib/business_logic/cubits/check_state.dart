part of 'check_cubit.dart';

@immutable
abstract class CheckState {}

class CheckInitial extends CheckState {
  int questionNumber = 0;
  int score = 0;

  CheckInitial(this.questionNumber, this.score);
}