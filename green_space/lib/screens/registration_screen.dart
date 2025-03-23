import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:green_space/widgets/next_button.dart';
import 'package:green_space/widgets/text_input.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backrounds/leaves_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                _buildBackButton(),

                const SizedBox(height: 55),

                const Text(
                  'Регистрация',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                
                const SizedBox(height: 60),
                
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color(0xffe6e5df),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: 100,
                  ),
                ),

                const SizedBox(height: 32),

                _buildRegistrationForm(),
              ],
              ),
            )
          )
        )
      );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_ios_rounded),
        )
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Container(
      decoration: const BoxDecoration(

      ),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.20)
                  ),
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Column(
                        spacing: 25,
                        children: [
                          SizedBox(
                            height: 30,
                            child: TextInput(
                              // controller: ,
                              placeholder: 'Имя', 
                              borderRadius: 24,
                            )
                          ),
                          SizedBox(
                            height: 30,
                            child: TextInput(
                              // controller: ,
                              placeholder: 'Email', 
                              borderRadius: 24,
                            )
                          ),
                          SizedBox(
                            height: 30,
                            child: TextInput(
                              // controller: ,
                              placeholder: 'Пароль', 
                              borderRadius: 24,
                            )
                          )
                        ],
                      ),
                      
                      Row(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.9,
                            child: Checkbox(
                              value: acceptTerms,
                              onChanged: (bool? value) {
                                setState(() {
                                  acceptTerms = value!;
                                });
                              },
                              checkColor: Colors.white,
                              side: BorderSide(color: Colors.white, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 24,
                            child: const Text(
                            'Согласен на обработку персональных данных',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                          )
                        ],
                      ),
                      NextButton(onPressed: () => {})
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}