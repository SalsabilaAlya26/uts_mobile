import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotePage extends StatefulWidget {
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<String> notes = ["Bersyukur setiap hari 🌸", "Jangan lupa dzikir pagi"];
  final TextEditingController _ctrl = TextEditingController();

  void _addNote() {
    if (_ctrl.text.trim().isEmpty) return;
    setState(() {
      notes.add(_ctrl.text.trim());
      _ctrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catatan", style: GoogleFonts.poppins(color: Color(0xFF6A2C3A)))),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFFFEEF3), Colors.white]),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: notes.length,
          itemBuilder: (context, i) => Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Text(notes[i], style: TextStyle(color: Color(0xFF6A2C3A))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFDB4C8A),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Tambah Catatan Baru"),
              content: TextField(controller: _ctrl, decoration: InputDecoration(hintText: "Tulis catatanmu...")),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text("Batal")),
                ElevatedButton(onPressed: () { _addNote(); Navigator.pop(context); }, child: Text("Simpan")),
              ],
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
