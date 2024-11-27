import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardVideoDev extends StatelessWidget {
  final int missingId;
  const CardVideoDev({
    super.key,
    required this.missingId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/video/detail');
      },
      child: Card(
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
      ),
    );
  }
}
