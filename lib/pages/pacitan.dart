import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PacitanPage extends StatelessWidget {
  const PacitanPage({super.key});

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
                    "PACITAN",
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
                    "KESENIAN WAYANG BEBER",
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
                        "assets/images/pacitan.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// DESCRIPTION
                  const Text(
                    """Wayang beber Pacitan termasuk salah satu warisan seni tradisi yang langka dan unik karena  tidak ditemukan di tempat lain. Kelangkaan dan  keunikan wayang beber Pacitan dapat dilihat  dari bentuk, fungsi, dan makna yang terkandung  di dalamnya. Kesenian ini sangat disakralkan  oleh pendukungnya khususnya keluarga dalang Wayang beber yang tinggal di Dusun Karangta lun, Desa Gedompol, Donorojo. Namun kesenian tradisi ini terancam punah karena terdesak oleh nilai-nilai budaya modern. Usaha revitalisasi wayang beber telah dilakukan walaupun belum optimal karena beberapa hambatan. Pandangan lama atas wayang beber dan desakan budaya modern menghambat revitalisasi wayang beber. Demikian pula mentransformasikan Wayang beber dari seni sakral (community art) menjadi seni hiburan (tourist art) menjadi hambatan lain yang belum sepenuhnya teratasi. Oleh karena itu, revitalisasi wayang beber harus dimulai dengan kebijakan yang tepat, komitmen pemimpin daerah, dukungan masyarakat dan swasta, serta dilakukan secara sinergis antarpara pihak yang peduli terhadap wayang beber.""",
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
                    "Paramita Vol. 22, No. 1 - Januari 2012: 1-130 WAYANG BEBER PACITAN: FUNGSI, MAKNA, DAN USAHA REVITALISASI: W a r t o. Jurusan Sejarah, Universitas Sebelas Maret, Surakarta",
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
                        "https://drive.google.com/drive/folders/1lZ0D4SkoB1RyaECntZU84M-FWz1P7dry?usp=sharing",
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