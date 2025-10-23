import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaPage extends StatefulWidget {
  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  List<dynamic> doaList = [];

  @override
  void initState() {
    super.initState();
    _loadDoa();
  }

  Future<void> _loadDoa() async {
    final raw = await rootBundle.loadString('assets/data/doa_dummy.json');
    setState(() {
      doaList = jsonDecode(raw)["doa"];
    });
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
          'Doa Harian 🌸',
          style: GoogleFonts.poppins(
            color: Color(0xFF6A2C3A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: doaList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xFFDB4C8A)),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: doaList.length,
                  itemBuilder: (context, i) {
                    final item = doaList[i];
                    return GestureDetector(
                      onTap: () => _showDetailDialog(context, item),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 14),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFFC6D9).withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.menu_book_rounded,
                                color: Color(0xFFDB4C8A),
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['judul'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF6A2C3A),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item['terjemahan'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey[700],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFFDB4C8A),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Map doa) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  doa['judul'],
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6A2C3A),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                Divider(color: Color(0xFFFFC1CC)),
                SizedBox(height: 14),
                Text(
                  doa['arab'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFDB4C8A),
                    fontWeight: FontWeight.w500,
                    height: 2,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  doa['terjemahan'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 18),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFFFE6EF),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Tutup",
                    style: GoogleFonts.poppins(
                      color: Color(0xFFDB4C8A),
                      fontWeight: FontWeight.w600,
                    ),
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
