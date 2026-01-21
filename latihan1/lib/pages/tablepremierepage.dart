import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/tablepremierecontroller.dart';


class Tablepremierepage extends StatelessWidget {
   Tablepremierepage({super.key});

  final controller = Get.put(PremiereController(),permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Premiere Page')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchApiTablePremiere();
            },
          child:  ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), // wajib untuk refresh
            itemCount: controller.tableStandings.length,
            itemBuilder: (context, index) {
              final team = controller.tableStandings[index];
              return Card(
                child: ListTile(
                  title: Text(team.strTeam),
                  leading: CircleAvatar(backgroundImage: NetworkImage(team.strBadge),radius: 25,),  
                  trailing: Text("D:"+team.intDraw.toString()+" W:"+team.intWin.toString()+" L:"+team.intLoss.toString()),
                  subtitle: Text(team.intPoints),
                ),
              );
            },
          ),
          );  
        }),
      ),  
    );
  }
}