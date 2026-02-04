// ignore: file_names
import 'package:bmi_calculator_app/BMI_calc.dart';
import 'package:flutter/material.dart';

class Bmiview2 extends StatelessWidget {
  final double bmi;
  const Bmiview2({super.key, required this.bmi});

  // دالة لتحديد الحالة حسب قيمة الـ BMI
  String getStatus() {
    if (bmi < 18.5) return "Underweight";
    if (bmi >= 18.5 && bmi < 24.9) return "Normal";
    if (bmi >= 25 && bmi < 29.9) return "Overweight";
    return "Obese";
  }

  // دالة لتحديد اللون حسب الحالة
  Color getStatusColor() {
    if (bmi < 18.5) return Colors.yellow;
    if (bmi >= 18.5 && bmi < 24.9) return Colors.green;
    if (bmi >= 25 && bmi < 29.9) return Colors.orange;
    return Colors.red;
  }

  // دالة لتحديد الرسالة حسب الحالة
  String getMessage() {
    if (bmi < 18.5) return "You are underweight, try to eat more.";
    if (bmi >= 18.5 && bmi < 24.9)
      // ignore: curly_braces_in_flow_control_structures
      return "Your body weight is absolutely normal, Good job! 💪";
    if (bmi >= 25 && bmi < 29.9)
      // ignore: curly_braces_in_flow_control_structures
      return "You are overweight, consider more exercise.";
    return "You are obese, please take care of your health.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff102135),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff242638),
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Your Result",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xff333244),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getStatus(),
                    style: TextStyle(
                      color: getStatusColor(),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      getMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70),
                      backgroundColor: const Color(0xffE83067),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BmiCalc(),
                        ),
                      );
                    },
                    child: const Text(
                      "Re-Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
