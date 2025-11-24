import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 96,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  buildButtonRow(["AC", "%", "del", "÷"]),
                  buildButtonRow(["7", "8", "9", "×"]),
                  buildButtonRow(["4", "5", "6", "-"]),
                  buildButtonRow(["1", "2", "3", "+"]),
                  buildButtonRow(["00", "0", ".", "="]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return Expanded(
            flex: 1,
            child: CalculatorButton(
              text: buttonText,
              backgroundColor: getButtonColor(buttonText),
              textColor: getTextColor(buttonText),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color getButtonColor(String buttonText) {
    if (buttonText == '÷' || buttonText == '×' || buttonText == '-' || buttonText == '+' || buttonText == '=') {
      return Colors.orange;
    } else if (buttonText == 'AC' || buttonText == '%' || buttonText == 'del') {
      return Colors.grey.shade300;
    } else {
      return Colors.grey.shade800;
    }
  }

  Color getTextColor(String buttonText) {
    if (buttonText == 'AC' || buttonText == '%' || buttonText == 'del') {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Material(
          color: backgroundColor,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
