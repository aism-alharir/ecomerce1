import 'package:flutter/material.dart';

class CustomTopAppBarCart extends StatelessWidget {
  final String title;
  final void Function()? iconBack;
  const CustomTopAppBarCart(
      {super.key, required this.title, required this.iconBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: iconBack, icon: const Icon(Icons.arrow_back)))),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              )),
        ),
        const Spacer(),
      ],
    );
  }
}
