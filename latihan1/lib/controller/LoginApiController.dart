import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan1/Model/LoginApi.dart';
import 'package:latihan1/pages/homepage.dart';
import 'package:latihan1/pages/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginAPIController extends GetxController {
  var isLoading = false.obs;
  var googleUser = Rx<GoogleSignInAccount?>(null);

  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  // 🔹 LOGIN API biasa
  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("https://mediadwi.com/api/latihan/login");
      var response = await http.post(url, body: {
        'username': username,
        'password': password,
      });

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == true) {
        LoginApi model = LoginApi.fromJson(data);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", model.token);

        Get.snackbar("Success", "Sukses Login");
        Get.offAll(() =>  HomePage());
      } else {
        Get.snackbar("Error", data["message"] ?? "Login gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 🔹 LOGIN dengan GOOGLE
  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;
      final googleUserData = await _googleSignIn.signIn();

      if (googleUserData == null) {
        Get.snackbar("Batal", "Login Google dibatalkan");
        return;
      }

      googleUser.value = googleUserData;

      final googleAuth = await googleUserData.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      Get.snackbar("Berhasil", "Login Google sukses");
      Get.offAll(() =>  HomePage());
    } catch (e) {
      Get.snackbar("Error", "Gagal login Google: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 🔹 LOGOUT dari Google
  Future<void> logout() async {
    try {
      await _auth.signOut();  
      await _googleSignIn.signOut();
      googleUser.value = null;
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
  }
}
