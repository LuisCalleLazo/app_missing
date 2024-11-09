import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardNotificationDev extends StatelessWidget {
  const CardNotificationDev({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/notification");
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Container(
          height: 100,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Titulo de notificacion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.remove_red_eye_rounded),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: const Text(
                  "Detalles de la notificacion en cuestion",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
