import '../../data/repositories/calculator_repository.dart';

class EvaluateExpression {
  final CalculatorRepository repository;

  EvaluateExpression(this.repository);

  double call(String expression) {
    return repository.evaluateExpression(expression);
  }
}
