import 'package:flutter/material.dart';

class CardVideoDev extends StatelessWidget {
  const CardVideoDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Container(
        height: 70,
        color: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () => {/* showSnackbarMessages(context) */},
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  color: Colors.transparent,
                  width: 50,
                  height: 50,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://indiehoy.com/wp-content/uploads/2018/04/aurora.jpg"),
                  ),
                ),
              ],
            ),
            const Text(
              "2023 / 12/ 09",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
