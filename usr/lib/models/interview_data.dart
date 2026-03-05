class Question {
  final int id;
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });
}

class InterviewSession {
  String candidateName = '';
  String email = '';
  String phone = '';
  String position = '';
  
  int aptitudeScore = 0;
  List<String> interviewAnswers = [];
  String aiFeedback = '';

  // Singleton pattern for simple state management across screens
  static final InterviewSession _instance = InterviewSession._internal();
  factory InterviewSession() => _instance;
  InterviewSession._internal();

  void reset() {
    candidateName = '';
    email = '';
    phone = '';
    position = '';
    aptitudeScore = 0;
    interviewAnswers = [];
    aiFeedback = '';
  }
}
