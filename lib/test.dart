import 'package:ecomerce1/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  initalData() async {
    //res = await checkInterent();
    print(res);
  }

  @override
  void initState() {
    initalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            //LottieBuilder.asset(AppImageAsset.loading ,width: 250 , height: 250),
            //LottieBuilder.asset(AppImageAsset.notFond),
            LottieBuilder.asset(AppImageAsset.loading, width: 250, height: 250)
          ],
        ),
      ),
    );
  }
}
