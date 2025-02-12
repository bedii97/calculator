import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function(String) onTap;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => onTap(text),
          child: Text(text, style: AppTextStyles.buttonText),
        ),
      ),
    );
  }
}
