import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:latihan1/controller/LoginApiController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
    
  var name = "Alif".obs;
  var email = "Alifahmda@gmail.com".obs;
  var address = "Kudus".obs;
  var profilePictUrl = "https://www.gramedia.com/blog/content/images/2018/11/Kurt-Cobain-2.jpeg".obs;
  
  Future<void> logout() async {
    try {
      // 🔸 1. Logout dari Google dan Firebase
      await _googleSignIn.signOut();
      await _auth.signOut();

      // 🔸 2. Hapus semua data di SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // 🔸 3. Bersihkan field login kalau controller aktif
     }catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
    Get.offAllNamed(Approutes.loginApi);
  
}
  } 
  