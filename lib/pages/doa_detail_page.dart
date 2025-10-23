import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaDetailPage extends StatelessWidget {
  final Map doa;
  const DoaDetailPage({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [Color(0xFFFFE6EF), Color(0xFFFFF9FB)]);
    return Scaffold(
      appBar: AppBar(
        title: Text(doa["judul"], style: GoogleFonts.poppins(color: Color(0xFF6A2C3A))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(doa["judul"], style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF6A2C3A))),
                    SizedBox(height: 16),
                    Text(
                      doa["arab"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Color(0xFFDB4C8A)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      doa["arti"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
