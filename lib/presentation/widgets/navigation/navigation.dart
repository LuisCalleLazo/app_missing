import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;
  const Navigation(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.blueAccent,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Publicaciones',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.video_collection_sharp),
          label: 'Video',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.notifications),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 15,
                    minWidth: 15,
                  ),
                  child: const Text(
                    "7",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'Notificaciones',
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded),
          label: 'Desaparecidos',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      ],
      onTap: onItemTapped,
      currentIndex: selectedIndex,
    );
  }
}
