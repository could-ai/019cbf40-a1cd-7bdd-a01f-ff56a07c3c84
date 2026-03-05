import 'package:flutter/material.dart';
import '../models/interview_data.dart';
import '../services/ai_engine.dart';

class AptitudeScreen extends StatefulWidget {
  const AptitudeScreen({super.key});

  @override
  State<AptitudeScreen> createState() => _AptitudeScreenState();
}

class _AptitudeScreenState extends State<AptitudeScreen> {
  late List<Question> _questions;
  final Map<int, String> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    _questions = AIEngine.generateAptitudeQuestions();
  }

  void _submitAptitude() {
    if (_selectedAnswers.length < _questions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please answer all questions before submitting.")),
      );
      return;
    }

    int score = 0;
    for (var q in _questions) {
      if (_selectedAnswers[q.id] == q.correctAnswer) {
        score++;
      }
    }

    InterviewSession().aptitudeScore = score;
    Navigator.pushNamed(context, '/interview');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aptitude Round"),
        backgroundColor: const Color(0xFF1A1A2E),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _questions.length + 1,
          itemBuilder: (context, index) {
            if (index == _questions.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: _submitAptitude,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94560),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("SUBMIT APTITUDE TEST", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              );
            }

            final question = _questions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.white.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${index + 1}. ${question.text}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...question.options.map((option) => RadioListTile<String>(
                      title: Text(option, style: const TextStyle(color: Colors.white70)),
                      value: option,
                      groupValue: _selectedAnswers[question.id],
                      activeColor: const Color(0xFFE94560),
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswers[question.id] = value!;
                        });
                      },
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
