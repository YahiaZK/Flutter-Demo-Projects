import 'package:calculator/utils/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  var expression = '';
  var result = '';

  List<String> buttons = [
    'C',
    'Del',
    'AC',
    '/',

    '7',
    '8',
    '9',
    'x',

    '4',
    '5',
    '6',
    '-',

    '1',
    '2',
    '3',
    '+',

    '.',
    '0',
    '%',
    '=',
  ];

  bool isOperator(String x) {
    if (x == '=' || x == '+' || x == '-' || x == 'x' || x == '/' || x == '%') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    if (expression.isEmpty) {
      return;
    }

    String finalExpression = expression;
    finalExpression = finalExpression.replaceAll('x', '*');
    try {
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(finalExpression);
      var cm = ContextModel();
      var evaluator = RealEvaluator(cm);
      num eval = evaluator.evaluate(exp);

      if (eval.isInfinite || eval.isNaN) {
        result = 'Error';
      } else {
        result = eval.toString();
        if (result.endsWith('.0')) {
          result = result.substring(0, result.length - 2);
        }
      }
    } catch (e) {
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      expression,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      result,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (buttons[index] == 'C') {
                    return MyButton(
                      color: Colors.grey[500],
                      buttonText: buttons[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          expression = '';
                        });
                      },
                    );
                  } else if (buttons[index] == 'AC') {
                    return MyButton(
                      color: Colors.grey[500],
                      buttonText: buttons[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          expression = '';
                          result = '';
                        });
                      },
                    );
                  } else if (buttons[index] == 'Del') {
                    return MyButton(
                      color: Colors.grey[500],
                      buttonText: buttons[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          try {
                            expression = expression.substring(
                              0,
                              expression.length - 1,
                            );
                          } catch (e) {
                            expression = '';
                          }
                        });
                      },
                    );
                  } else if (buttons[index] == '=') {
                    return MyButton(
                      color: Colors.orange,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                    );
                  } else {
                    return MyButton(
                      color: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.grey[850],
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          String buttonText = buttons[index];

                          if (isOperator(buttonText) &&
                              expression.isNotEmpty &&
                              isOperator(expression[expression.length - 1])) {
                            expression = expression.substring(
                              0,
                              expression.length - 1,
                            );
                          }
                          if (isOperator(buttonText) &&
                              expression.isEmpty &&
                              buttonText != '-') {
                            return;
                          }
                          expression += buttonText;
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
