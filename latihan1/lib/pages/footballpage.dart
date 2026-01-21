import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:latihan1/controller/footballcontroller.dart';



class Footballpage extends StatelessWidget{
  Footballpage({super.key});

  final Footbalplayercontroller footbalplayercontroller = 
      Get.put(Footbalplayercontroller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("man united player")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() => ListView.builder(
          itemCount: footbalplayercontroller.players.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: () {
    Get.toNamed(Approutes.editplayerpage, arguments: index);
  },
  leading: CircleAvatar(
    backgroundImage: AssetImage(footbalplayercontroller.players[index].images),
  ),
  title: Text(footbalplayercontroller.players[index].nama),
  subtitle: Text(footbalplayercontroller.players[index].posisi),
  trailing: Text(
    footbalplayercontroller.players[index].nomorPunggung.toString(),
  ),
  
            );
          }
        ))
      ),
    );
  }
}
