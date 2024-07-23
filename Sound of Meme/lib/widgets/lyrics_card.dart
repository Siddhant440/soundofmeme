import 'package:flutter/material.dart';
import 'sliding_text.dart';
import '../utils/style.dart';

class LyricsCard extends StatelessWidget {
  final String text;

  const LyricsCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background.withOpacity(0.5),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.45,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/gifs/lyrics_card_bg.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 78),
                              child: SlidingText(text: text),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  color: background,
                  size: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Image.asset(
                "assets/gifs/pepe_guitar.gif",
                width: 80,
                height: 80,
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Image.asset(
                "assets/gifs/pepe_headphone.gif",
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}