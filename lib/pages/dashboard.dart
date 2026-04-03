import 'package:flutter/material.dart';
import 'magetan.dart';
import 'malang.dart';
import 'pacitan.dart';
import 'pamekasan.dart';
import 'ponorogo.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<String> kabupaten = const [
    "PONOROGO","MAGETAN","PAMEKASAN","PACITAN","MALANG",
    "BOJONEGORO","TUBAN","NGANJUK","LAMONGAN","JOMBANG",
    "TULUNGAGUNG","KEDIRI","BLITAR","TRENGGALEK","BATU",
    "GRESIK","SURABAYA","MOJOKERTO","PASURUAN","SIDOARJO",
    "LUMAJANG","PROBOLINGGO","JEMBER","BONDOWOSO","SITUBONDO",
    "BANYUWANGI","BANGKALAN","NGAWI","MADIUN","SUMENEP"
  ];

  @override
  Widget build(BuildContext context) {

    /// MAP HALAMAN
    final Map<String, Widget> pages = {
      "MAGETAN": const MagetanPage(),
      "MALANG": const MalangPage(),
      "PACITAN": const PacitanPage(),
      "PAMEKASAN": const PamekasanPage(),
      "PONOROGO": const PonorogoPage(),
    };

    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                /// ===== LOGO =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/gub.png", height: 80),
                      Image.asset("assets/images/logo.png", height: 110),
                      Image.asset("assets/images/wagub.png", height: 80),
                    ],
                  ),
                ),

                const SizedBox(height: 7),

                /// ===== TITLE =====
                const Text(
                  "JAWA TIMUR\nDIGDAYA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1,
                    shadows: [
                      Shadow(
                        blurRadius: 30,
                        color: Colors.cyanAccent,
                        offset: Offset(0,0),
                      ),
                      Shadow(
                        blurRadius: 60,
                        color: Colors.blue,
                        offset: Offset(0,0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  "Jawa Timur Digitalisasi Budaya",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),

                /// ===== MAP =====
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 55),

                /// ===== GRID BUTTON =====
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kabupaten.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 3,
                      ),
                      itemBuilder: (context, index) {

                        String kota = kabupaten[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {

                            if (pages.containsKey(kota)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => pages[kota]!,
                                ),
                              );
                            }

                          },

                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7B61FF),
                                  Color(0xFF2EC4FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(0,3),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                kota,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 7,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}