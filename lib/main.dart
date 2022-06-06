import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_f/controller/them_controller.dart';
import 'package:shoping_f/routes/routes.dart';
import 'package:shoping_f/utils/theme.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeApp.light,
      darkTheme: themeApp.dark ,
        themeMode: ThemeDarkController().thememode,
      initialRoute: GetStorage().read('auth')==true?Namepages.MainScreen: AppRoutes.Welcome,
      getPages: AppRoutes.routes
    );
  }
}
