import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_one/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int hight = 175;
  int weight = 55;

  late double bmi = calculateBMI(hight: hight, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.female,
                          size: 150,
                        ),
                        Text("Female"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Hight"),
                        Text("$hight", style: kInputcolor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (hight > 50) hight--;
                                  bmi = calculateBMI(
                                      hight: hight, weight: weight);
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (hight < 220) hight++;
                                  bmi = calculateBMI(
                                      hight: hight, weight: weight);
                                });
                              },
                              child: Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Weight"),
                          Text("$weight", style: kInputcolor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 20) weight--;
                                    bmi = calculateBMI(
                                        hight: hight, weight: weight);
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              const SizedBox(width: 25),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 150) weight++;
                                    bmi = calculateBMI(
                                        hight: hight, weight: weight);
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Text("BMI"),
                  Text(
                    "${bmi.toStringAsFixed(5)}",
                    style: kInputcolor.copyWith(
                      color: kOutpotTextColor,
                      fontSize: 60,
                    ),
                  ),
                  Text(getResult(bmi))
                ],
              )
            ],
          )),
    ));
  }

  double calculateBMI({required int hight, required int weight}) {
    return (weight / (hight * hight) * 10000);
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
