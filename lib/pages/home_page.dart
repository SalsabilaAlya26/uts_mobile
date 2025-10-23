import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tasbih_page.dart';
import 'doa_page.dart';
import 'reminder_page.dart';
import 'note_page.dart';
import 'qiblah_page.dart';
import 'tracker_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<_HomeFeature> features = [
    _HomeFeature("Tasbih", Icons.brightness_low_rounded, Color(0xFFFFB6C1)),
    _HomeFeature("Doa Harian", Icons.menu_book_rounded, Color(0xFFFFC1CC)),
    _HomeFeature("Reminder", Icons.access_time_rounded, Color(0xFFFFD6E0)),
    _HomeFeature("Catatan", Icons.note_alt_rounded, Color(0xFFFFB6B9)),
    _HomeFeature("Kiblat", Icons.explore_rounded, Color(0xFFFFDCE6)),
    _HomeFeature("Tracker", Icons.check_circle_outline_rounded, Color(0xFFFFC6D9)),
  ];

  final List<Widget> pages = [
    TasbihPage(),
    DoaPage(),
    ReminderPage(),
    NotePage(),
    QiblahPage(),
    TrackerPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xFFFFDCE6), Color(0xFFFFF7F9)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Widget homeContent = Container(
      decoration: BoxDecoration(gradient: gradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Text(
                "Assalamu’alaikum 🌸",
                style: GoogleFonts.sacramento(
                  fontSize: 32,
                  color: Color(0xFF6A2C3A),
                ),
              ),
              Text(
                "Selamat datang, Boooooooooo!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),

              // fitur grid
              Expanded(
                child: GridView.builder(
                  itemCount: features.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final f = features[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => pages[index]),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: f.color.withOpacity(0.25),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(f.icon, color: f.color, size: 32),
                            ),
                            SizedBox(height: 12),
                            Text(
                              f.title,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Color(0xFF6A2C3A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final Widget settingContent = SettingsPage();

    return Scaffold(
      body: _selectedIndex == 0 ? homeContent : settingContent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -3)),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFDB4C8A),
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Setting',
            ),
          ],
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
        ),
      ),
    );
  }
}

class _HomeFeature {
  final String title;
  final IconData icon;
  final Color color;
  _HomeFeature(this.title, this.icon, this.color);
}
