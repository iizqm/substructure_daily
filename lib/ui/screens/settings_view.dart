import 'package:flutter/material.dart';
import 'package:substructure_daily/ui/widgets/app_drawer.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 37, 37, 37),
            Color.fromARGB(255, 37, 37, 37),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 37, 37, 37),
          title: Text('SETTINGS', style: TextStyle(color: Colors.white)),
          actions: [
            Builder(
              builder: (context) => AspectRatio(
                aspectRatio: 1,
                child: GestureDetector(
                  child: const Icon(Icons.menu, color: Colors.white),
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ),
          ],
        ),
        endDrawer: AppDrawer('/settings'),
        body: SafeArea(child: Text('Settings')),
      ),
    );
  }
}
