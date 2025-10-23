import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _name = TextEditingController(text: 'Nama Pengguna');
  final _bio = TextEditingController(text: 'Bio singkat...');

  @override
  void dispose() {
    _name.dispose();
    _bio.dispose();
    super.dispose();
  }

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
          'Profil & Pengaturan',
          style: GoogleFonts.poppins(
            color: Color(0xFF6A2C3A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar section 🌸
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFC1CC), Color(0xFFFFDCE6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 48, color: Color(0xFFDB4C8A)),
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  "Edit Profil Kamu 💕",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6A2C3A),
                  ),
                ),
                SizedBox(height: 16),

                // Input Card 🎀
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _name,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          labelStyle: GoogleFonts.poppins(color: Color(0xFFDB4C8A)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFDB4C8A)),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        controller: _bio,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          labelText: 'Bio',
                          labelStyle: GoogleFonts.poppins(color: Color(0xFFDB4C8A)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFDB4C8A)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Buttons 💗
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Profil diperbarui (dummy)',
                          style: GoogleFonts.poppins(),
                        ),
                        backgroundColor: Color(0xFFDB4C8A),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB4C8A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    elevation: 4,
                  ),
                  child: Text(
                    'Simpan Perubahan',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: 16),

                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFDB4C8A)),
                    foregroundColor: Color(0xFFDB4C8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
                  icon: Icon(Icons.logout_rounded),
                  label: Text(
                    "Logout",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "✨ Versi 1.0.0 - Shalat & Dzikirku",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 12,
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
