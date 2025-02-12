import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../domain/usecases/evaluate_expression.dart';
import '../../data/repositories/calculator_repository.dart';
import '../../data/repositories/history_repository.dart';
import '../widgets/calculator_button.dart';
import '../widgets/display_area.dart';
import '../widgets/history_modal.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _expression = '';
  String _result = '';
  List<String> _history = [];

  late EvaluateExpression evaluateExpressionUseCase;
  late HistoryRepository historyRepository;

  @override
  void initState() {
    super.initState();
    evaluateExpressionUseCase = EvaluateExpression(CalculatorRepository());
    historyRepository = HistoryRepository();
    _loadHistory();
  }

  void _loadHistory() {
    setState(() {
      _history = historyRepository.getHistory();
    });
  }

  void _onPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        _expression = '';
        _result = '';
      });
    } else if (buttonText == "=") {
      _evaluateExpression();
    } else {
      setState(() {
        _expression += buttonText;
      });
    }
  }

  Future<void> _evaluateExpression() async {
    try {
      double eval = evaluateExpressionUseCase(_expression);
      String newEntry = '$_expression = $eval';
      await historyRepository.addHistory(newEntry);
      setState(() {
        _result = eval.toString();
        _history = historyRepository.getHistory();
        _expression = '';
      });
    } catch (e) {
      setState(() {
        _result = "Error";
      });
    }
  }

  void _showHistory() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return HistoryModal(history: _history);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegant Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            tooltip: 'View Calculation History',
            onPressed: _showHistory,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DisplayArea(
              expression: _expression,
              result: _result,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  CalculatorButton(
                    text: "7",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "8",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "9",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "/",
                    color: AppColors.primary,
                    onTap: _onPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: "4",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "5",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "6",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "*",
                    color: AppColors.primary,
                    onTap: _onPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: "1",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "2",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "3",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "-",
                    color: AppColors.primary,
                    onTap: _onPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: "0",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: ".",
                    color: AppColors.buttonBackground,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "C",
                    color: AppColors.error,
                    onTap: _onPressed,
                  ),
                  CalculatorButton(
                    text: "+",
                    color: AppColors.primary,
                    onTap: _onPressed,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        onPressed: () => _onPressed("="),
                        child: Text("=", style: AppTextStyles.buttonText),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
