import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A simple calculator page that was missing its widget wrapper and state.
/// This file provides a complete, self-contained StatefulWidget implementation
/// including a small CalcButton widget so the previous stray bracket/comma
/// errors are resolved.

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  double? _firstOperand;
  String? _operator;
  final TextStyle btnStyle = const TextStyle(fontSize: 20);

  void _inputDigit(String d) {
    setState(() {
      if (_display == '0') {
        _display = d;
      } else {
        _display += d;
      }
    });
  }

  void _inputDot() {
    setState(() {
      if (!_display.contains('.')) {
        _display += '.';
      }
    });
  }

  void _setOperator(String op) {
    setState(() {
      _firstOperand = double.tryParse(_display) ?? 0.0;
      _operator = op;
      _display = '0';
    });
  }

  void _equals() {
    setState(() {
      final second = double.tryParse(_display) ?? 0.0;
      double result = second;
      if (_firstOperand != null && _operator != null) {
        switch (_operator) {
          case '+':
            result = _firstOperand! + second;
            break;
          case '-':
            result = _firstOperand! - second;
            break;
          case '×':
            result = _firstOperand! * second;
            break;
          case '÷':
            if (second == 0) {
              _display = 'Error';
              _firstOperand = null;
              _operator = null;
              return;
            } else {
              result = _firstOperand! / second;
            }
            break;
          default:
            result = second;
        }
      }
      // show integer without decimal when possible
      if (result % 1 == 0) {
        _display = result.toInt().toString();
      } else {
        _display = result.toString();
      }
      _firstOperand = null;
      _operator = null;
    });
  }

  void _clearAll() {
    setState(() {
      _display = '0';
      _firstOperand = null;
      _operator = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final btnStyleLocal = btnStyle;

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(12),
                child: Text(
                  _display,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CalcButton(
                    label: 'C',
                    onTap: _clearAll,
                    background: Colors.grey.shade200,
                    textStyle: btnStyleLocal,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CalcButton(
                    label: '±',
                    onTap: () {
                      setState(() {
                        if (_display.startsWith('-')) {
                          _display = _display.substring(1);
                        } else if (_display != '0') {
                          _display = '-' + _display;
                        }
                      });
                    },
                    textStyle: btnStyleLocal,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CalcButton(
                    label: '%',
                    onTap: () {
                      setState(() {
                        final v = double.tryParse(_display) ?? 0.0;
                        _display = (v / 100).toString();
                      });
                    },
                    textStyle: btnStyleLocal,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CalcButton(
                    label: '÷',
                    onTap: () => _setOperator('÷'),
                    background: Colors.indigo.shade50,
                    textStyle: btnStyleLocal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CalcButton(
                  label: '7',
                  onTap: () => _inputDigit('7'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '8',
                  onTap: () => _inputDigit('8'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '9',
                  onTap: () => _inputDigit('9'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '×',
                  onTap: () => _setOperator('×'),
                  background: Colors.indigo.shade50,
                  textStyle: btnStyleLocal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CalcButton(
                  label: '4',
                  onTap: () => _inputDigit('4'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '5',
                  onTap: () => _inputDigit('5'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '6',
                  onTap: () => _inputDigit('6'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '-',
                  onTap: () => _setOperator('-'),
                  background: Colors.indigo.shade50,
                  textStyle: btnStyleLocal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CalcButton(
                  label: '1',
                  onTap: () => _inputDigit('1'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '2',
                  onTap: () => _inputDigit('2'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '3',
                  onTap: () => _inputDigit('3'),
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '+',
                  onTap: () => _setOperator('+'),
                  background: Colors.indigo.shade50,
                  textStyle: btnStyleLocal,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CalcButton(
                          label: '0',
                          onTap: () => _inputDigit('0'),
                          textStyle: btnStyleLocal,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CalcButton(
                          label: '.',
                          onTap: _inputDot,
                          textStyle: btnStyleLocal,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CalcButton(
                          label: '+/-',
                          onTap: () {
                            setState(() {
                              if (_display.startsWith('-')) {
                                _display = _display.substring(1);
                              } else if (_display != '0') {
                                _display = '-$_display';
                              }
                            });
                          },
                          textStyle: btnStyleLocal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 84,
                  child: CalcButton(
                    label: '=',
                    onTap: _equals,
                    background: Colors.indigo,
                    foreground: Colors.white,
                    textStyle: btnStyleLocal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// A small reusable button used by this page. If your project already
/// defines a CalcButton, you can remove this and use the existing one.
class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? background;
  final Color? foreground;
  final TextStyle? textStyle;

  const CalcButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.background,
    this.foreground,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = background ?? Colors.grey.shade100;
    final fg = foreground ?? Colors.black;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style:
                textStyle?.copyWith(color: fg) ??
                TextStyle(color: fg, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
