// import 'package:ecommercecourse/controller/test_controller.dart';
// import 'package:ecommercecourse/core/class/handlingdataview.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TestView extends StatelessWidget {
//   const TestView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("title"),
//       ),
//       body: GetBuilder<TestController>(
//         builder: (controller) {
//           return HandlingDataView(
//               statusRequest: controller.statusRequest,
//               widget: ListView.builder(
//                   itemCount: controller.data.length,
//                   itemBuilder: ((context, index) {
//                     return Center(
//                       child: Text("${controller.data}"),
//                     );
//                   })));
//         },
//       ),
//     );
//   }
// }
