import 'package:ecomerce1/binding/initalbinding.dart';
import 'package:ecomerce1/core/localization/changelocale.dart';
import 'package:ecomerce1/core/localization/translation.dart';
import 'package:ecomerce1/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleControllere controller = Get.put(LocaleControllere());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      theme: controller.appTheme,
      locale: controller.language,
      initialBinding: InitalBindings(),
      getPages: routes,
      //home: const Language(),
      //const Test(),
    );
  }
}
