import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      if (_display == '0' || _display == 'Error') {
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

  // ======================================================
  // FUNGSI BARU: PENGKUADRATAN (SQUARE)
  // ======================================================
  void _square() {
    setState(() {
      final value = double.tryParse(_display);
      if (value != null) {
        // Kuadrat: v * v atau math.pow(v, 2)
        double result = math.pow(value, 2).toDouble();

        // Format hasil
        if (result % 1 == 0) {
          _display = result.toInt().toString();
        } else {
          _display = result.toString();
        }
        _firstOperand = null;
        _operator = null;
      } else {
        _display = 'Error';
      }
    });
  }

  // ======================================================
  // FUNGSI BARU: AKAR KUADRAT (SQUARE ROOT)
  // ======================================================
  void _squareRoot() {
    setState(() {
      final value = double.tryParse(_display);
      if (value != null) {
        if (value < 0) {
          _display = 'Error';
        } else {
          double result = math.sqrt(value);

          // Format hasil
          if (result % 1 == 0) {
            _display = result.toInt().toString();
          } else {
            _display = result.toStringAsFixed(4); // Batasi desimal untuk akar
          }
        }
        _firstOperand = null;
        _operator = null;
      } else {
        _display = 'Error';
      }
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

      // Format hasil
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
      // AppBar dihapus karena biasanya kalkulator menjadi bagian dari Dashboard
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
                    fontSize: 64, // Perbesar tampilan
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            // ======================================================
            // BARIS FUNGSI BARU (KUADRAT, AKAR, HAPUS, BAGI)
            // ======================================================
            Row(
              children: [
                Expanded(
                  // Tombol C
                  child: CalcButton(
                    label: 'C',
                    onTap: _clearAll,
                    background: Colors.red.shade200,
                    textStyle: btnStyleLocal,
                  ),
                ),
                const SizedBox(width: 8),
                CalcButton(
                  // Tombol Kuadrat (x²)
                  label: 'x²',
                  onTap: _square,
                  background: Colors.amber.shade100,
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  // Tombol Akar Kuadrat (√)
                  label: '√',
                  onTap: _squareRoot,
                  background: Colors.amber.shade100,
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  // Tombol Bagi (÷)
                  label: '÷',
                  onTap: () => _setOperator('÷'),
                  background: Colors.indigo.shade50,
                  textStyle: btnStyleLocal,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // BARIS 7, 8, 9, KALI
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

            // BARIS 4, 5, 6, KURANG
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

            // BARIS 1, 2, 3, TAMBAH
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

            // BARIS 0, TITIK, EQUALS
            Row(
              children: [
                CalcButton(
                  label: '0',
                  onTap: () => _inputDigit('0'),
                  textStyle: btnStyleLocal,
                  // Agar tombol 0 lebih lebar
                  flex: 2,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '.',
                  onTap: _inputDot,
                  textStyle: btnStyleLocal,
                ),
                const SizedBox(width: 8),
                CalcButton(
                  label: '=',
                  onTap: _equals,
                  background: Colors.indigo,
                  foreground: Colors.white,
                  textStyle: btnStyleLocal,
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

/// A small reusable button used by this page.
class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? background;
  final Color? foreground;
  final TextStyle? textStyle;
  final int flex;

  const CalcButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.background,
    this.foreground,
    this.textStyle,
    this.flex = 1, // Default flex adalah 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bg = background ?? Colors.grey.shade100;
    final fg = foreground ?? Colors.black;
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12), // Diperhalus jadi 12
            boxShadow: [
              // Tambah shadow untuk efek menawan
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
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
