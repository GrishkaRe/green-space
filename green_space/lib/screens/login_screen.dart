import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:green_space/screens/qr_code_read_screen.dart';
import 'package:green_space/widgets/next_button.dart';
import 'package:green_space/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backrounds/leaves_2.jpg'),
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
                  'Вход',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                
                const SizedBox(height: 60),

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
                    spacing: 32,
                    children: [
                      Column(
                        spacing: 25,
                        children: [
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

                      NextButton(onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QrCodeReadScreen())
                          )
                      })
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