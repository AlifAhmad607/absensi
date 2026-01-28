import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AbsensiController extends GetxController {
  final FirebaseApp app = Firebase.app();
  
  late final DatabaseReference _db = FirebaseDatabase.instanceFor(
    app: app,
    databaseURL: "https://flutterpushnotification-ec867-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("absensi");
  
  DatabaseReference get ref => _db;
  
  var absensiList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  
  final namaC = TextEditingController();
  final kelasC = TextEditingController();
  var status = "Hadir".obs;
  
  String? _keyData;
  
  @override
  void onInit() {
    super.onInit();
    _listenToFirebase();
  }
  
  void _listenToFirebase() {
    _db.onValue.listen((event) {
      isLoading.value = false;
      
      if (event.snapshot.value == null) {
        absensiList.value = [];
        return;
      }
      
      final Map data = event.snapshot.value as Map;
      
      final List<Map<String, dynamic>> tempList = [];
      data.forEach((key, value) {
        final item = Map<String, dynamic>.from(value);
        item['key'] = key;
        tempList.add(item);
      });
      
      absensiList.value = tempList.reversed.toList();
    });
  }
  
  void initEditPage() {
    final args = Get.arguments as Map<String, dynamic>;
    _keyData = args['key'] as String;
    final data = Map<String, dynamic>.from(args['data']);
    isiDariData(data);
  }
  
  void isiDariData(Map<String, dynamic> data) {
    namaC.text = data["nama"] ?? '';
    kelasC.text = data["kelas"] ?? '';
    status.value = data["status"] ?? 'Hadir';
  }
  
  Future<void> tambahAbsensi() async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan kelas tidak boleh kosong",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    await _db.push().set({
      "nama": namaC.text,
      "kelas": kelasC.text,
      "status": status.value,
      "tanggal": DateTime.now().toString().substring(0, 10),
    });
    
    namaC.clear();
    kelasC.clear();
    status.value = "Hadir";
    
    Get.snackbar(
      "Sukses",
      "Data berhasil ditambahkan",
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  Future<void> updateAbsensi() async {
    if (namaC.text.isEmpty || kelasC.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan kelas tidak boleh kosong",
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    if (_keyData == null) {
      Get.snackbar(
        "Error",
        "Data tidak valid",
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    await _db.child(_keyData!).update({
      "nama": namaC.text,
      "kelas": kelasC.text,
      "status": status.value,
    });
    
    Get.back();
    Get.snackbar(
      "Sukses",
      "Data berhasil diperbarui",
      backgroundColor: Colors.green.shade100,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  Future<void> hapusAbsensi(String key) async {
    await _db.child(key).remove();
  }
  
  Future<void> updateStatus(String key, String newStatus) async {
    await _db.child(key).update({
      "status": newStatus,
    });
  }

  @override
  void onClose() {
    namaC.dispose();
    kelasC.dispose();
    super.onClose();
  }
}