import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:latihan1/Bindings/LoginApiBinding.dart';
import 'package:latihan1/Routes/Approutes.dart';
import 'package:latihan1/pages/LoginApiPage.dart';
import 'package:latihan1/pages/SplashScreenPage.dart';
import 'package:latihan1/pages/calculatorpage.dart';
import 'package:latihan1/pages/editplayerpage.dart';
import 'package:latihan1/pages/footballpage.dart';
import 'package:latihan1/pages/home_page_notif.dart';
import 'package:latihan1/pages/homepage.dart';
import 'package:latihan1/pages/profilepage.dart';
import 'package:latihan1/pages/tablepremierepage.dart';

class Apppage {
  static final pages = [
  GetPage(name: Approutes.calculatorpage,page: ()=> CalculatorPage(hasil: '',)),
  GetPage(name: Approutes.footballpage,page: ()=> Footballpage(),),
  GetPage(name: Approutes.editplayerpage,page: ()=> Editplayerpage(),),
  GetPage(name: Approutes.loginApi,page: ()=> LoginAPIPage(),binding: LoginAPIBinding()),
  GetPage(name: Approutes.homepage,page: ()=> HomePage(),),
  GetPage(name: Approutes.home_page_notif,page: ()=> HomePageNotif(),),
  GetPage(name: Approutes.Profile,page: ()=> ProfilePage(),),
  GetPage(name: Approutes.TablePremiere,page: ()=> Tablepremierepage(),),
   GetPage(name: Approutes.splashscreen,page: ()=> SplashscreenPage(),),

  ];
  
}