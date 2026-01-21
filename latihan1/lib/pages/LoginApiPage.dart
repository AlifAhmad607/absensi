import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controller/LoginApiController.dart';

class LoginAPIPage extends StatelessWidget {
  const LoginAPIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginAPIController>();
    final userC = TextEditingController();
    final passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login API")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userC,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passC,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      controller.login(userC.text, passC.text);
                    },
                    child: const Text("Login API"),
                  )),
            const SizedBox(height: 25),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("atau"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 25),

            // 🔥 Tombol Google Sign-In
            Obx(() => controller.isLoading.value
                ? const SizedBox.shrink()
                : ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    
                    label: const Text('Sign in with Google'),
                    onPressed: controller.loginWithGoogle,
                  )),
          ],
        ),
      ),
    );
  }
}
