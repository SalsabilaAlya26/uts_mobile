import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xFFFFDCE6), Color(0xFFFFF7F9)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    // small decorative badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
                      ),
                      child: Row(children: [Icon(Icons.star, size: 16, color: Color(0xFFDB4C8A)), SizedBox(width:8), Text("Pinky Coquette", style: TextStyle(fontSize: 12))]),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),
                // big illustration area
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // circle with flower decorations
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 190,
                            height: 190,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(colors: [Colors.white, Color(0xFFFFEEF3)]),
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0,8))],
                            ),
                          ),
                          Icon(Icons.menu_book, size: 64, color: Color(0xFFDB4C8A)),
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(color: Color(0xFFFFF3F6), shape: BoxShape.circle),
                              child: Icon(Icons.local_florist, size: 18, color: Color(0xFFDB4C8A)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Shalat & Dzikirku",
                        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF6A2C3A)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Reminder Sholat • Tasbih • Doa Harian",
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                // action buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          elevation: 8,
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          side: BorderSide(color: Color(0xFFDB4C8A).withOpacity(0.28)),
                        ),
                        child: Text("Register", style: TextStyle(fontSize: 16, color: Color(0xFF6A2C3A), fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text("Atau jelajahi aplikasi tanpa akun", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
