import 'package:get/state_manager.dart';

class CalculatorController extends GetxController {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operation = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operation == "+") {
        _output = (num1 + num2).toString();
      }
      if (operation == "-") {
        _output = (num1 - num2).toString();
      }
      if (operation == "X") {
        _output = (num1 * num2).toString();
      }
      if (operation == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    output = double.parse(_output).toStringAsFixed(2);

    update();
  }
}
