import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/aptitude_screen.dart';
import 'screens/interview_screen.dart';
import 'screens/feedback_screen.dart';

void main() {
  runApp(const AIInterviewApp());
}

class AIInterviewApp extends StatelessWidget {
  const AIInterviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Interview System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F3460),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistrationScreen(),
        '/aptitude': (context) => const AptitudeScreen(),
        '/interview': (context) => const InterviewScreen(),
        '/feedback': (context) => const FeedbackScreen(),
      },
    );
  }
}
