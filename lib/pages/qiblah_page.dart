import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QiblahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [Color(0xFFFFE6EF), Color(0xFFFFF9FB)]);

    return Scaffold(
      appBar: AppBar(title: Text("Arah Kiblat", style: GoogleFonts.poppins(color: Color(0xFF6A2C3A)))),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.explore, size: 120, color: Color(0xFFDB4C8A)),
              SizedBox(height: 20),
              Text("Arah Kiblat saat ini", style: TextStyle(fontSize: 16, color: Color(0xFF6A2C3A))),
              Text("⬆️  295° Barat Laut", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink[700])),
            ],
          ),
        ),
      ),
    );
  }
}
