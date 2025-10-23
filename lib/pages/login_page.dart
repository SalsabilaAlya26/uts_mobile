import 'package:flutter/material.dart';
import 'home_page.dart'; // pastikan home_page.dart ada
import 'package:google_fonts/google_fonts.dart';
import 'register_page.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  void _login() {
    // dummy: langsung ke HomePage
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [Color(0xFFFFF0F3), Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      BackButton(color: Color(0xFF6A2C3A)),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Card container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,8))],
                    ),
                    child: Column(
                      children: [
                        Text("Masuk", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF6A2C3A))),
                        SizedBox(height: 8),
                        Text("Masukkan email dan kata sandi untuk melanjutkan", style: TextStyle(color: Colors.grey[600], fontSize: 13), textAlign: TextAlign.center),
                        SizedBox(height: 16),
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined, color: Color(0xFFDB4C8A)),
                            hintText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: _pass,
                          obscureText: _obscure,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline, color: Color(0xFFDB4C8A)),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                        ),
                    SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: _login,
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFDB4C8A), // pink lebih tua
      foregroundColor: Colors.white, // teks putih biar kontras
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: EdgeInsets.symmetric(vertical: 14),
      elevation: 6,
      shadowColor: Color(0xFFDB4C8A).withOpacity(0.3),
    ),
    child: Text(
      'Login',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  ),
),

                        SizedBox(height: 12),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage())),
                          child: Text('Lanjut tanpa login', style: TextStyle(color: Color(0xFF6A2C3A))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // register hint
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Belum punya akun? ", style: TextStyle(color: Colors.grey[700])),
                    GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())), child: Text("Daftar sekarang", style: TextStyle(color: Color(0xFFDB4C8A), fontWeight: FontWeight.w600))),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
