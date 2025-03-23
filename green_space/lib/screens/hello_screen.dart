import 'package:flutter/material.dart';
import 'package:green_space/screens/login_screen.dart';
import 'package:green_space/screens/registration_screen.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e5df),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/homeScreen/leafs.png',
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            )
                          ]
                        ),
                        children: [
                          TextSpan(
                            text: 'Забота о растении – это первый шаг к заботе о ',
                          ),
                          TextSpan(
                            text: 'мире',
                            style: TextStyle(color: Color(0xff3b6029)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildStartButton(),
                    const Spacer(),
                    _buildLoginSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = true;
        });

        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            _isPressed = false;
          });
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen())
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFF305529),
              Color(0xFFB3C08B),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: 0,
              left: _isPressed ? 50 : 0, // Сдвигаем текст вправо при нажатии
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/icons/arrow_right_in_circle_512.png',
                      height: 36,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: const Text(
                        'Начинаем!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Image.asset(
                        'assets/icons/three_arrows_next_512.png',
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginSection() {
    return Column(
      children: [
        const Text(
          'Уже есть аккаунт?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen())
              );
          },
          child: const Text(
            'Вход',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5A8D61),
            ),
          ),
        ),
      ],
    );
  }
}

