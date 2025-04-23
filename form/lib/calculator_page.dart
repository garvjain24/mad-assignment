import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = '';
  String _output = '0';
  String _operator = '';
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '0';
        _operator = '';
        _num1 = 0;
        _num2 = 0;
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        _num1 = double.tryParse(_input) ?? 0;
        _operator = value;
        _input = '';
      } else if (value == '=') {
        _num2 = double.tryParse(_input) ?? 0;
        switch (_operator) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '*':
            _output = (_num1 * _num2).toString();
            break;
          case '/':
            _output = _num2 != 0 ? (_num1 / _num2).toString() : 'Error';
            break;
        }
        _input = _output;
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(value),
        child: Text(value, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(_output, style: const TextStyle(fontSize: 36)),
            ),
          ),
          Column(
            children: [
              Row(children: ['7', '8', '9', '/'].map(_buildButton).toList()),
              Row(children: ['4', '5', '6', '*'].map(_buildButton).toList()),
              Row(children: ['1', '2', '3', '-'].map(_buildButton).toList()),
              Row(children: ['C', '0', '=', '+'].map(_buildButton).toList()),
            ],
          ),
        ],
      ),
    );
  }
}
