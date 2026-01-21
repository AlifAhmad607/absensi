import 'package:flutter/material.dart';
import '../services/absensi_service.dart';
import 'absensi_page.dart';
import 'absensi_tambah.dart';

class HomeAbsensiPage extends StatefulWidget {
  const HomeAbsensiPage({super.key});

  @override
  State<HomeAbsensiPage> createState() => _HomeAbsensiPageState();
}

class _HomeAbsensiPageState extends State<HomeAbsensiPage> {
  int index = 0;
  final service = AbsensiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          TambahAbsensiPage(service: service), // TAB 0
          AbsensiPage(service: service),       // TAB 1
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Data',
          ),
        ],
      ),
    );
  }
}
