import 'package:flutter/material.dart';

void main() {
  runApp(MangaApp());
}

class MangaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MangaHomePage(),
    );
  }
}

class MangaHomePage extends StatefulWidget {
  @override
  _MangaHomePageState createState() => _MangaHomePageState();
}

class _MangaHomePageState extends State<MangaHomePage> {
  int _selectedIndex = 0;

  // Menentukan page sesuai indeks BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LihatSemuaPage()),
      );
    } else if (index == 1) {
      _showPopup(context, 'Genre');
    } else if (index == 2) {
      _showPopup(context, 'Jadwal Rilis');
    }
  }

  void _showPopup(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('Fitur $title sedang dalam pengembangan!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Homepage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rekomendasi Manga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  MangaCard(title: 'One Piece', genre: 'Adventure, Action'),
                  MangaCard(title: 'Naruto', genre: 'Action, Fantasy'),
                  MangaCard(title: 'Attack on Titan', genre: 'Drama, Action'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lihat Semua',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Genre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal Rilis',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Page baru untuk "Lihat Semua"
class LihatSemuaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lihat Semua Manga'),
      ),
      body: Center(
        child: Text(
          'Semua Manga akan ditampilkan di sini',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class MangaCard extends StatelessWidget {
  final String title;
  final String genre;

  MangaCard({required this.title, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(genre),
        leading: Icon(Icons.book, color: Colors.purple),
      ),
    );
  }
}
