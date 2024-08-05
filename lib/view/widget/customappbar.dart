import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController? myController;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      required this.onPressedSearch,
      required this.onPressedIconFavorite,
      required this.onChanged,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                controller: myController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: onPressedSearch,
                        icon: const Icon(Icons.search)),
                    hintText: "49".tr,
                    hintStyle: const TextStyle(fontSize: 18),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: onPressedIconFavorite,
                  icon: const Icon(Icons.favorite_border_outlined, size: 30)),
            )
          ],
        ));
  }
}
