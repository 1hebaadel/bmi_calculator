import 'dart:math';

import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/shared/colors.dart';
import 'package:bmi_calculator/shared/grnder_tab_shared.dart';
import 'package:bmi_calculator/shared/sharedIcon.dart';
import 'package:bmi_calculator/shared/shared_text.dart';
import 'package:bmi_calculator/shared/text_and_value.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  double valueOfSlider = 0;
  bool isMale = true;
  int weightValue = 45;
  int ageValue = 18;
  double heightValue = 175;
  double resultValue = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenColor30,
        centerTitle: true,
        title: Text(
          'Body Mass Index',
          style: TextStyle(
            color: whiteColorFf
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0 , right: 12 ,left: 12),
        child: Column(
          children: [
            Expanded(
              child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                          child: buildGenderTab('Male' , Icons.male , isMale ? yellowColorD9 : greenColor30),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: buildGenderTab('Female' , Icons.female , isMale ? greenColor30 : yellowColorD9),
                      ),
                    ),
                  ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0 ,right: 6 ,left: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor30 ,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          color: whiteColorFf,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${heightValue.toStringAsFixed(1)}',
                            style: TextStyle(
                              color: whiteColorFf,
                              fontWeight: FontWeight.w800,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                              'CM',
                            style: TextStyle(
                              color: whiteColorFf,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: yellowColorD9,
                        inactiveColor: greenColor08,
                        min: 60,
                        max: 240,
                        divisions: 100,
                        value: heightValue,
                        onChanged: (value){
                          setState(() {
                            heightValue = value;
                          });
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: greenColor30,
                          borderRadius: BorderRadius.circular(
                            15.0
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 8),
                          child: Column(
                            children: [
                              buildTextAndValue('Weight' , weightValue),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: 'weightValue++',
                                    onPressed: (){
                                      setState(() {
                                        weightValue++;
                                      });
                                    },
                                    child: Icon(
                                        Icons.add,
                                      color: greenColor08,
                                      size: 30,
                                    ),
                                    backgroundColor: yellowColorD9,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FloatingActionButton(
                                      heroTag: 'weightValue--',
                                      onPressed: (){
                                        setState(() {
                                          weightValue--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: greenColor08,
                                        size: 30,
                                      ),
                                      backgroundColor: yellowColorD9,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            color: greenColor30,
                            borderRadius: BorderRadius.circular(
                                15.0
                            )
                        ),
                        child: Column(
                          children: [
                            buildTextAndValue('Age' , ageValue),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'ageValue++',
                                  onPressed: (){
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: greenColor08,
                                    size: 30,
                                  ),
                                  backgroundColor: yellowColorD9,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FloatingActionButton(
                                    heroTag: 'ageValue--',
                                    onPressed: (){
                                      setState(() {
                                        ageValue--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: greenColor08,
                                      size: 30,
                                    ),
                                    backgroundColor: yellowColorD9,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              height: MediaQuery.of(context).size.height /15,
              minWidth: double.infinity,
              onPressed: (){
                resultValue = weightValue / pow(heightValue /100 , 2);
                Navigator.push(context ,MaterialPageRoute(builder: (context){
                  return ResultScreen(
                    height: heightValue,
                    weight: weightValue,
                    result: resultValue,
                    isMale: isMale,
                    age: ageValue
                  );
                }),
                );
              },
              color: greenColor08,
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: whiteColorFf,
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
