//Perfil de Artista Musical
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SpotifyHomePage(),
    );
  }
}

// Tela Inicial com Álbuns
class SpotifyHomePage extends StatelessWidget {
  const SpotifyHomePage({super.key});

  static final List<Map<String, String>> albums = [
    {
      'image': 'https://picsum.photos/200?random=1',
      'title': 'Blinding Lights',
      'artist': 'The Weeknd',
    },
    {
      'image': 'https://picsum.photos/200?random=2',
      'title': 'Shape of You',
      'artist': 'Ed Sheeran',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'title': 'Levitating',
      'artist': 'Dua Lipa',
    },
    {
      'image': 'https://picsum.photos/200?random=4',
      'title': 'Stay',
      'artist': 'Justin Bieber',
    },
    {
      'image': 'https://picsum.photos/200?random=5',
      'title': 'As It Was',
      'artist': 'Harry Styles',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olá, Usuário 👋"),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Tocados recentemente",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: albums
                    .map((album) => AlbumCard(
                          album: album,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MusicPlayerScreen(
                                  imageUrl: album['image']!,
                                  title: album['title']!,
                                  artist: album['artist']!,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Feitos para você",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: albums.reversed
                    .map((album) => AlbumCard(
                          album: album,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MusicPlayerScreen(
                                  imageUrl: album['image']!,
                                  title: album['title']!,
                                  artist: album['artist']!,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Componente do Álbum
class AlbumCard extends StatelessWidget {
  final Map<String, String> album;
  final VoidCallback onTap;

  const AlbumCard({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                album['image']!,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              album['title']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              album['artist']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Tela do Player
class MusicPlayerScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;

  const MusicPlayerScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artist,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Slider(
                value: 120.0, // Corrigido para double
                min: 0.0,
                max: 240.0,
                activeColor: Colors.green,
                inactiveColor: Colors.white24,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('2:00', style: TextStyle(color: Colors.white70)),
                  Text('4:00', style: TextStyle(color: Colors.white70)),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous_rounded),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_circle_fill_rounded),
                    iconSize: 64,
                    color: Colors.greenAccent,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next_rounded),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.devices, color: Colors.white),
                  Icon(Icons.favorite_border, color: Colors.white),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
