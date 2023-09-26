import 'package:flutter/material.dart';

class DisplayFaqs extends StatelessWidget {
  const DisplayFaqs({
    required this.question,
    required this.answer,
    super.key,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.black,
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 124, 195, 252),
            Color.fromARGB(255, 232, 244, 254),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
