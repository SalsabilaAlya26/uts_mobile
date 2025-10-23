import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Malang coordinates
  static const double lat = -7.9823;
  static const double lon = 112.6300;

  /// Ambil jadwal sholat untuk tanggal hari ini (Aladhan API)
  static Future<Map<String, String>> fetchPrayerTimes() async {
    final int timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    final uri = Uri.parse(
      'http://api.aladhan.com/v1/timings/$timestamp?latitude=$lat&longitude=$lon&method=2'
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final timings = body['data']['timings'] as Map<String, dynamic>;
      // Ambil 5 waktu: Fajr, Dhuhr, Asr, Maghrib, Isha
      return {
        'fajr': timings['Fajr'] ?? '',
        'dhuhr': timings['Dhuhr'] ?? '',
        'asr': timings['Asr'] ?? '',
        'maghrib': timings['Maghrib'] ?? '',
        'isha': timings['Isha'] ?? '',
      };
    } else {
      throw Exception('Gagal mengambil jadwal sholat. Status: ${response.statusCode}');
    }
  }
}
