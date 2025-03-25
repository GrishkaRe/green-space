import 'package:flutter/material.dart';

class QrCodeReadScreen extends StatefulWidget {
  const QrCodeReadScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeReadScreen> createState() => _QrCodeReadScreenState();
}

class _QrCodeReadScreenState extends State<QrCodeReadScreen> {
  bool _isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    const qrFrameSize = 200.0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFEEECE4), // Light beige background color
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isFlashOn = !_isFlashOn;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A9A6B), // Green background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.flash_on,
                        color: Colors.white,
                        size: 24,
                      ),
                      if (!_isFlashOn)
                        Transform.rotate(
                          angle: -45 * 3.14159 / 180,
                          child: Container(
                            width: 2,
                            height: 30,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 30,
            left: 80,
            child: Row(
              children: const [
                Text(
                  'Активируй',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4A6741), // Green color
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'свой стеллаж',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          
          Positioned(
            left: (screenWidth - qrFrameSize) / 2,
            top: (screenHeight - qrFrameSize) / 2,
            child: Container(
              width: qrFrameSize,
              height: qrFrameSize,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _buildCorner(),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: _buildCorner(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Transform.rotate(
                      angle: 270 * 3.14159 / 180,
                      child: _buildCorner(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Transform.rotate(
                      angle: 180 * 3.14159 / 180,
                      child: _buildCorner(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 30,
            left: (screenWidth - 50) / 2,
            child: GestureDetector(
              onTap: () {
                print('Открыть галлерию');
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A9A6B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.photo_library,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorner() {
    return SizedBox(
      width: 30,
      height: 30,
      child: CustomPaint(
        painter: CornerPainter(),
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw L shape
    final path = Path()
      ..moveTo(0, size.height * 0.4)
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.4, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}