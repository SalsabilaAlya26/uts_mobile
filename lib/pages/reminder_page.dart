import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReminderPage extends StatefulWidget {
  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  Map<String, String>? jadwalSholat;
  bool loading = true;
  bool error = false;

  Future<void> getJadwal() async {
    try {
      // Koordinat kota Malang
      final double latitude = -7.9823;
      final double longitude = 112.6300;

      final url = Uri.parse(
          'http://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=2');

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final timings = Map<String, String>.from(data["data"]["timings"]);
        setState(() {
          jadwalSholat = timings;
          loading = false;
        });
      } else {
        setState(() {
          error = true;
          loading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        error = true;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getJadwal();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xFFFFE9F2), Color(0xFFFFF9FB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Sholat", style: GoogleFonts.poppins(color: Color(0xFF6A2C3A))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: loading
            ? Center(child: CircularProgressIndicator(color: Color(0xFFDB4C8A)))
            : error
                ? Center(
                    child: Text(
                      "Gagal memuat jadwal 😢",
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.all(16),
                    children: jadwalSholat!.entries.map((entry) {
                      final sholat = entry.key;
                      final jam = entry.value;
                      // tampilkan hanya 5 waktu wajib
                      if (["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"].contains(sholat)) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _translateSholat(sholat),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6A2C3A),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                jam,
                                style: TextStyle(
                                  color: Color(0xFFDB4C8A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    }).toList(),
                  ),
      ),
    );
  }

  String _translateSholat(String key) {
    switch (key) {
      case "Fajr":
        return "Subuh";
      case "Dhuhr":
        return "Dzuhur";
      case "Asr":
        return "Ashar";
      case "Maghrib":
        return "Maghrib";
      case "Isha":
        return "Isya";
      default:
        return key;
    }
  }
}
