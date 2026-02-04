import 'package:bmi_calculator_app/views/BMIview2.dart';
import 'package:bmi_calculator_app/views/container_data.dart';
import 'package:bmi_calculator_app/views/custom_GenderCard.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  double h = 150;
  int weight = 40;
  int age = 20;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff102135),
        appBar: AppBar(
          backgroundColor: const Color(0xff242638),
          centerTitle: true,
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Gender Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomGenderCard(
                        icon: Icons.male,
                        text: 'Male',
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        isSelected: isMale,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomGenderCard(
                        icon: Icons.female,
                        text: 'Female',
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        isSelected: !isMale,
                      ),
                    ),
                  ],
                ),
              ),

              // Height Card
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 21,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(color: Color(0xff8BBC9E), fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${h.round()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    Slider(
                      value: h,
                      onChanged: (value) {
                        setState(() {
                          h = value;
                        });
                      },
                      min: 80,
                      max: 220,
                      activeColor: const Color(0xffE83067),
                    ),
                  ],
                ),
              ),

              // Weight & Age Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xff333244),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(
                                color: Color(0xff8BBC9E),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ContainerData(
                                  onTap: () => setState(() => weight++),
                                  icon: Icons.add,
                                ),
                                ContainerData(
                                  onTap: () {
                                    setState(() {
                                      if (weight > 1) weight--;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xff333244),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: Color(0xff8BBC9E),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ContainerData(
                                  onTap: () => setState(() => age++),
                                  icon: Icons.add,
                                ),
                                ContainerData(
                                  onTap: () {
                                    setState(() {
                                      if (age > 1) age--;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Calculate Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 15,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 70),
                    backgroundColor: const Color(0xffE83067),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    double bmi = weight / ((h / 100) * (h / 100));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bmiview2(bmi: bmi),
                      ),
                    );
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
