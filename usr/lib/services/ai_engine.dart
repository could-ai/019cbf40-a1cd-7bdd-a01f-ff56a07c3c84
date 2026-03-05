import '../models/interview_data.dart';

class AIEngine {
  static List<Question> generateAptitudeQuestions() {
    return [
      Question(
        id: 1,
        text: "A shopkeeper gives 10% discount on ₹500. What is final price?",
        options: ["450", "400", "470", "430"],
        correctAnswer: "450",
      ),
      Question(
        id: 2,
        text: "If 5 men can do a work in 10 days, how many days will 10 men take?",
        options: ["2", "5", "10", "20"],
        correctAnswer: "5",
      ),
      Question(
        id: 3,
        text: "Cost price is ₹100, Selling price is ₹120. What is profit %?",
        options: ["10%", "15%", "20%", "25%"],
        correctAnswer: "20%",
      ),
      Question(
        id: 4,
        text: "Average of 10, 20, 30, 40, 50 is?",
        options: ["25", "30", "35", "40"],
        correctAnswer: "30",
      ),
      Question(
        id: 5,
        text: "Ratio of 500g to 2kg is?",
        options: ["1:4", "1:2", "4:1", "2:1"],
        correctAnswer: "1:4",
      ),
    ];
  }

  static String generateFeedback(int score, List<String> answers) {
    // Mock AI evaluation logic based on score and answer length
    String feedback = "";
    
    // Analytical feedback
    if (score >= 5) {
      feedback += "Excellent analytical skills. ";
    } else if (score >= 3) {
      feedback += "Good analytical skills. ";
    } else {
      feedback += "Needs improvement in analytical skills. ";
    }

    // Communication feedback based on response length
    int totalLength = answers.fold(0, (sum, item) => sum + item.length);
    if (totalLength > 150) {
      feedback += "Candidate demonstrates strong communication ability with detailed responses.";
    } else if (totalLength > 50) {
      feedback += "Communication is clear but could be more elaborate.";
    } else {
      feedback += "Responses are too brief; candidate should elaborate more.";
    }

    return feedback;
  }
  
  static List<String> getInterviewQuestions() {
    return [
      "Tell me about yourself.",
      "Why should we hire you?",
      "What are your strengths?",
      "Where do you see yourself in 5 years?",
    ];
  }
}
