import 'package:flutter/material.dart';

class CardPublicationDev extends StatelessWidget {
  const CardPublicationDev({super.key});

  // void showSnackbarMessages(BuildContext context) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   const snackbar = SnackBar(
  //     backgroundColor: Color.fromARGB(60, 255, 255, 255),
  //     content: SnackbarMessages(),
  //     duration: Duration(hours: 1),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  // }

  // void showSnackbarShared(BuildContext context) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   const snackbar = SnackBar(
  //     padding: EdgeInsets.all(0),
  //     backgroundColor: Colors.white,
  //     content: SnackbarShared(),
  //     duration: Duration(hours: 1),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  // }
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/id/1/600/250',
            height: 250,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.comment),
                  onPressed: () => {/* showSnackbarMessages(context) */},
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.add_to_home_screen_rounded),
                  onPressed: () => {/* showSnackbarShared(context) */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
