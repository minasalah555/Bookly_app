import 'package:bookly_app/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class ActionBook extends StatelessWidget {
  const ActionBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CustomButton(
            fontColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            title: '19.99£',
            fontSize: 20,
          ),
          CustomButton(
            fontColor: Colors.white,
            backgroundColor: Color(0xffEF8360),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            title: 'Free Preview',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
