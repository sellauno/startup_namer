import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(const MyApp());
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18);
    final wordPair = WordPair.random();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              LikeButton(
                size: 80,
                animationDuration: const Duration(milliseconds: 0),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
                    color: isLiked ? Colors.pink : Colors.grey,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator', style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromARGB(255, 252, 250, 250),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
