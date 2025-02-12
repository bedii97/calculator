import 'package:flutter/material.dart';
import '../../core/constants.dart';

class DisplayArea extends StatelessWidget {
  final String expression;
  final String result;

  const DisplayArea({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(expression, style: AppTextStyles.displayText),
          ),
          SizedBox(height: 10),
          Text(result, style: AppTextStyles.resultText),
        ],
      ),
    );
  }
}
