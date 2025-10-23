import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackerPage extends StatefulWidget {
  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  Map<String, bool> tracker = {
    "Subuh": false,
    "Dzuhur": false,
    "Ashar": false,
    "Maghrib": false,
    "Isya": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracker Sholat", style: GoogleFonts.poppins(color: Color(0xFF6A2C3A)))),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFFEEF3), Colors.white])),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: tracker.keys.map((sholat) {
            return CheckboxListTile(
              title: Text(sholat, style: TextStyle(color: Color(0xFF6A2C3A))),
              value: tracker[sholat],
              activeColor: Color(0xFFDB4C8A),
              onChanged: (v) => setState(() => tracker[sholat] = v ?? false),
            );
          }).toList(),
        ),
      ),
    );
  }
}
