import 'package:flutter/material.dart';

class CardVideoDev extends StatelessWidget {
  const CardVideoDev({super.key});


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
            color: Colors.amber[600],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       const DialogCalification(),
                    // );
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.comment),
                  onPressed: () => {/* showSnackbarMessages(context) */},
                ),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.share_rounded),
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
