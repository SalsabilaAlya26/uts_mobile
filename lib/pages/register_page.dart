import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool _agree = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _register() {
    if (_name.text.trim().isEmpty || _email.text.trim().isEmpty || _pass.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lengkapi data dengan benar')));
      return;
    }
    if (_pass.text != _confirm.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password konfirmasi tidak sama')));
      return;
    }

    // dummy register => langsung Home
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [Color(0xFFFFF6F8), Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                children: [
                  Row(children: [BackButton(color: Color(0xFF6A2C3A))]),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,8))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Buat Akun", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF6A2C3A))),
                        SizedBox(height: 8),
                        Text("Daftar untuk menyimpan progress ibadahmu", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        SizedBox(height: 14),
                        TextField(controller: _name, decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline, color: Color(0xFFDB4C8A)), hintText: 'Nama lengkap')),
                        SizedBox(height: 10),
                        TextField(controller: _email, decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined, color: Color(0xFFDB4C8A)), hintText: 'Email')),
                        SizedBox(height: 10),
                        TextField(controller: _pass, obscureText: true, decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline, color: Color(0xFFDB4C8A)), hintText: 'Password')),
                        SizedBox(height: 10),
                        TextField(controller: _confirm, obscureText: true, decoration: InputDecoration(prefixIcon: Icon(Icons.lock, color: Color(0xFFDB4C8A)), hintText: 'Konfirmasi Password')),
                        SizedBox(height: 12),
                        Row(children: [
                          Checkbox(value: _agree, onChanged: (v) => setState(() => _agree = v ?? true), activeColor: Color(0xFFDB4C8A)),
                          SizedBox(width: 6),
                          Expanded(child: Text("Saya setuju dengan ketentuan penggunaan aplikasi", style: TextStyle(fontSize: 12, color: Colors.grey[700]))),
                        ]),
                        SizedBox(height: 8),
                        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _register, child: Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Sudah punya akun? ", style: TextStyle(color: Colors.grey[700])),
                    GestureDetector(onTap: () => Navigator.pop(context), child: Text("Login", style: TextStyle(color: Color(0xFFDB4C8A), fontWeight: FontWeight.w600))),
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
