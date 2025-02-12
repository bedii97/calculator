import 'package:math_expressions/math_expressions.dart';

class CalculatorRepository {
  double evaluateExpression(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel contextModel = ContextModel();
    return exp.evaluate(EvaluationType.REAL, contextModel);
  }
}
