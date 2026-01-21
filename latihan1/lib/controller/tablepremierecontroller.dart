import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan1/Model/tablepremiere.dart';

class PremiereController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <TableData>[].obs; // ✅ ganti nama class dari "Table" ke "TableData" agar tidak bentrok dengan Flutter's Table()

  @override
  void onInit() {
    super.onInit();
    fetchApiTablePremiere();
  }

  Future<void> fetchApiTablePremiere() async {
    const url =
        "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['table'] != null) {
          final List standings = data['table'];
          tableStandings.assignAll(
            standings.map((e) => TableData.fromJson(e)).toList(),
          );
        } else {
          Get.snackbar("Info", "Data tidak ditemukan di API");
        }
      } else {
        Get.snackbar("Error", "Gagal mengambil data dari API");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
