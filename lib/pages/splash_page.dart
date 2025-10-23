import 'package:flutter/material.dart';
import 'package:uts_mobile/pages/home_page.dart';
import 'welcome_page.dart';
import '../theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    // animate title fade-in
    Future.delayed(
      Duration(milliseconds: 200),
      () => setState(() => _opacity = 1.0),
    );
    // show buttons after short delay
    Future.delayed(
      Duration(milliseconds: 1200),
      () => setState(() => _showButtons = true),
    );
    // optional: auto navigate to Welcome after 4s (disabled to respect "Mulai" choice)
    // Future.delayed(Duration(seconds: 4), () => _goToWelcome());
  }

  void _goToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => WelcomePage()),
    );
  }

  void _skipToHome() {
    // HomePage exists in your project — adjust import if needed
    Navigator.pushReplacementNamed(
      context,
      '/home',
    ); // if you use named route; fallback to Welcome
    // If you don't use named routes, simply navigate to WelcomePage for now:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xFFF4ACB7), Color(0xFFFFF0F3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: 48),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 900),
                  opacity: _opacity,
                  child: Column(
                    children: [
                      // cute circle decoration
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.8),
                              Color(0xFFFFE6F0),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.mosque,
                            size: 56,
                            color: Color(0xFFDB4C8A),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // "Assalamu'alaikum" with hand-written style (Sacramento)
                      Text(
                        "Assalamu'alaikum",
                        style: TextStyle(
                          fontFamily:
                              'Sacramento', // google_fonts will be used in text if needed; fallback ok
                          fontSize: 34,
                          color: Color(0xFF6A2C3A),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Selamat datang di Shalat & Dzikirku",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A2C3A),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                if (_showButtons)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _goToWelcome,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 6,
                            shadowColor: Color(0xFFDB4C8A).withOpacity(0.25),
                          ),
                          child: Text(
                            "Mulai",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            // if no named route for home, go to WelcomePage as fallback
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(0xFFDB4C8A).withOpacity(0.3),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            "Langsung ke Home",
                            style: TextStyle(color: Color(0xFF6A2C3A)),
                          ),
                        ),
                      ),
                      SizedBox(height: 28),
                      Opacity(
                        opacity: 0.9,
                        child: Text(
                          "v1.0 — UTS Project",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A2C3A),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
