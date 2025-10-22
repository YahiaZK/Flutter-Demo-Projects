import 'package:calculator/utils/my_button.dart';
import 'package:flutter/material.dart';

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
    '%',
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
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[850],
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
                  } else {
                    return MyButton(
                      color: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.grey[850],
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          expression += buttons[index];
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

  bool isOperator(String x) {
    if (x == '=' || x == '+' || x == '-' || x == 'x' || x == '/' || x == '%') {
      return true;
    } else {
      return false;
    }
  }
}
