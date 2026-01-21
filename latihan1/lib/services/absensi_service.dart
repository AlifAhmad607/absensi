import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AbsensiService {
  // Ambil default app
  final FirebaseApp app = Firebase.app();

  // Pakai instanceFor dengan databaseURL Singapore
  late final DatabaseReference _db = FirebaseDatabase.instanceFor(
    app: app,
    databaseURL: "https://flutterpushnotification-ec867-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("absensi");

  DatabaseReference get ref => _db;

  Future<void> tambahAbsensi({
  required String nama,
  required String kelas,
  required String status,
}) async {
  await _db.push().set({
    "nama": nama,
    "kelas": kelas,
    "status": status,
    "tanggal": DateTime.now().toString().substring(0, 10),
  });
}


  void hapusAbsensi(String key) {
    _db.child(key).remove();
  }

  void updateStatus(String key, String status) {
    _db.child(key).update({
      "status": status,
    });
  }
  
  Future<void> updateAbsensi({
  required String key,
  required String nama,
  required String kelas,
  required String status,
}) async {
  _db.child(key).update({
    "nama": nama,
    "kelas": kelas,
    "status": status,
  });
}

}
