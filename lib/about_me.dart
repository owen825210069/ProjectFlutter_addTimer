import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'About Me',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              child: Image.asset('assets/astro.png'),
            ),
            SizedBox(height: 20.0),
            ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: Text(
                  'Owen Maytrio Phratama',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                titleAlignment: ListTileTitleAlignment.center),
            ListTile(
              leading: Icon(Icons.numbers),
              title: Text(
                '825210069',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Image.asset('assets/FTI.png'),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Card(
                    child: Image.asset('assets/SI.png'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}