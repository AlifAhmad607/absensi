import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/editplayercontroller.dart';

class Editplayerpage extends StatelessWidget {
  final Editplayercontroller editplayercontroller = Get.put(Editplayercontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Player")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: editplayercontroller.nama,
              decoration: InputDecoration(labelText: "Nama Player"),
            ),
            SizedBox(height: 8),
            TextField(
              controller: editplayercontroller.posisi,
              decoration: InputDecoration(labelText: "Posisi"),
            ),
            SizedBox(height: 8),
            TextField(
              controller: editplayercontroller.nomor,
              decoration: InputDecoration(labelText: "Nomor Punggung"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: editplayercontroller.save,
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
