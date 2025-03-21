import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'HelloScreen',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-sFFIrKx9KoyNnnvMZjHZBZYulbj742.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(text: 'Забота о растении – это первый шаг к заботе о '),
                          TextSpan(
                            text: 'мире',
                            style: TextStyle(color: Color(0xFF5A8D61)),
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
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF5A8D61),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Начинаем!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Positioned(
            right: 16,
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 18,
                  ),
              ],
            ),
          ),
        ],
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
        const Text(
          'Вход',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5A8D61),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 120,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

