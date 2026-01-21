import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/profilecontroller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Center( // 👈 semua isi ditengah layar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 👈 vertikal di tengah
            crossAxisAlignment: CrossAxisAlignment.center, // 👈 horizontal di tengah
            children: [

              Obx(() => CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(controller.profilePictUrl.value),
              )),
              const SizedBox(height: 20),

              Obx(() => Text(
                controller.name.value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 10),

              Obx(() => Text(
                controller.email.value,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              )),
              const SizedBox(height: 8),

              Obx(() => Text(
                controller.address.value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              )),
              ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                controller.logout();
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  