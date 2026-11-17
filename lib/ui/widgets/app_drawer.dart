import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String currentScreen;

  const AppDrawer(this.currentScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "SUB-STRUCTURE DAILY",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
              _ScreenButton(
                title: 'Today',
                screen: '/',
                isActive: currentScreen == '/',
              ),
              _ScreenButton(
                title: 'Settings',
                screen: '/settings',
                isActive: currentScreen == '/settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenButton extends StatelessWidget {
  final String title;
  final String screen;
  final bool isActive;

  const _ScreenButton({
    required this.title,
    required this.screen,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.yellow : Colors.white,
          fontSize: 24,
        ),
      ),
      onTap: () {
        if (!isActive) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, screen);
        }
      },
    );
  }
}
