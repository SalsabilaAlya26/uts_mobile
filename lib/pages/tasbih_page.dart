import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasbihPage extends StatefulWidget {
  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xFFFFE6EF), Color(0xFFFFF9FB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Tasbih Digital",
          style: GoogleFonts.poppins(
            color: Color(0xFF6A2C3A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Judul
                Text(
                  "Hitung Dzikir-mu 🌸",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6A2C3A),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),

                // Lingkaran counter 💕
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFC6D9), Color(0xFFFFE6EF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "$count",
                      style: GoogleFonts.poppins(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDB4C8A),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Tombol utama 🩷
                ElevatedButton(
                  onPressed: () => setState(() => count++),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB4C8A),
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(36),
                    elevation: 6,
                    shadowColor: Colors.pinkAccent.withOpacity(0.3),
                  ),
                  child: Icon(Icons.add, size: 36),
                ),

                SizedBox(height: 20),

                // Tombol reset 🎀
                TextButton.icon(
                  onPressed: () => setState(() => count = 0),
                  icon: Icon(Icons.refresh_rounded, color: Color(0xFF6A2C3A)),
                  label: Text(
                    "Reset",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6A2C3A),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF6A2C3A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
