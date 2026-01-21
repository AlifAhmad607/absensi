import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latihan1/Model/footballplayer.dart';
import 'package:latihan1/controller/footballcontroller.dart';

class Editplayercontroller extends GetxController {
  final nama = TextEditingController();
  final posisi = TextEditingController();
  final nomor = TextEditingController();
  final gambar = TextEditingController();

  final playerController = Get.find<Footbalplayercontroller>();
  late int index;
  
   void onInit() {
    super.onInit();
    index = Get.arguments as int;

    final player = playerController.players[index];
    nama.text = player.nama;
    posisi.text = player.posisi;
    nomor.text = player.nomorPunggung.toString();
  }

  void save() {
    playerController.updatePlayer(
      index,
      Player(
        nama: nama.text,
        posisi: posisi.text,
        nomorPunggung: int.parse(nomor.text),
        images: playerController.players[index].images,
      ),
       
    );
    Get.back();
  }
     void onClose() {
    nama.dispose();
    posisi.dispose();
    nomor.dispose();
    super.onClose();
  }
}
  
