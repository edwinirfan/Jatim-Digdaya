import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PamekasanPage extends StatelessWidget {
  const PamekasanPage({super.key});

  /// OPEN URL
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          /// GRID EFFECT
          CustomPaint(
            size: Size.infinite,
            painter: GridPainter(),
          ),

          /// CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  /// LOGO
                  Image.asset(
                    "assets/images/logo.png",
                    width: 90,
                  ),

                  const SizedBox(height: 30),

                  /// TITLE NEON
                  const Text(
                    "PAMEKASAN",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 25,
                          color: Color(0xFF00D1FF),
                          offset: Offset(0, 0),
                        ),
                        Shadow(
                          blurRadius: 45,
                          color: Color(0xFF00D1FF),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// SUBTITLE
                  const Text(
                    "KESENIAN TARI TOPENG GETHAK",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// IMAGE
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        "assets/images/pamekasan.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// DESCRIPTION
                  const Text(
                    "Tari Topeng Gethak disebut juga Tari Klonoan , Tarian ini diciptakan pada abad ke 17. Tarian ini merupakan manifestasi atau tiruan dari salah satu bentuk tokoh yang dikenal dalam penyajian seni Topeng Dalang, yaitu tokoh Prabu Baladewa. Namun pendapat lain menyatakan bahwa Tari Topeng Gethak/Topeng Klonoan ini menggambarkan seorang satria yang sedang berkelana. Hal ini sesuai dengan nama tarinya yaitu Tari Klonoan (kelana). Dalam pertunjukan Tari Topeng Gethak selalu menyatu dengan kesenian sandur dan menjadi isyarat pembuka dalam kesenian sandur. Gerakan Tari Topeng Gethak menggambarkan seseorang yang tegas, tangguhdan wibawa. Musik yang mengiringi pertunjukan ini menggunakan irama Saronen Kennong Tello’ atau gamelan tabuan kenek.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// SOURCE TEXT
                  const Text(
                    "AVATARA, e-Journal Pendidikan Sejarah Volume 3, No. 3, Oktober 2015 PERKEMBANGAN TARI TOPENG GETHAK DI KABUPATEN PAMEKASAN PADA TAHUN 1980-2005 DHAEVATUN FITRIYAH ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  /// GOOGLE DRIVE SOURCE
                  GestureDetector(
                    onTap: () {
                      openLink(
                        "https://drive.google.com/drive/folders/135e_vyobkSnXwHs9vMDXqjAI-s884zhF?usp=sharing",
                      );
                    },
                    child: const Text(
                      "Sumber : Google Drive",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// BACK BUTTON
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 40,
                  //       vertical: 16,
                  //     ),
                  //     backgroundColor: const Color(0xFF00AEEF),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Text(
                  //     "KEMBALI",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       letterSpacing: 1,
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// GRID BACKGROUND EFFECT
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..strokeWidth = 1;

    const gridSize = 40;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}