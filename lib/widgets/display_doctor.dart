import 'package:flutter/material.dart';

class DisplayDoctor extends StatelessWidget {
  const DisplayDoctor({
    super.key,
    required this.imageLink,
    required this.dName,
    required this.dQualification,
  });

  final String imageLink;
  final String dName;
  final String dQualification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageLink,
            height: 120,
            width: 120,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  dQualification,
                  style: const TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
