import 'package:flutter/material.dart';
import 'package:health_care/models/faqs_data.dart';
import 'package:health_care/widgets/display_faqs.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (healthFAQs.length) ~/ 2,
      itemBuilder: (context, index) {
        final question = healthFAQs['Q${index.toString()}'].toString();
        final answer = healthFAQs['A${index.toString()}'].toString();
        return DisplayFaqs(question: question, answer: answer);
      },
    );
  }
}
