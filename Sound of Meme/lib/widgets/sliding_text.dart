import 'package:flutter/material.dart';
import '../utils/style.dart';

class SlidingText extends StatefulWidget {
  final String text;
  const SlidingText({Key? key, required this.text}) : super(key: key);

  @override
  _SlidingTextState createState() => _SlidingTextState();
}

class _SlidingTextState extends State<SlidingText> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  bool _isScrollingAutomatically = false;
  bool _isAtEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isScrollingAutomatically = true;
        });
        _animationController.forward();
        _scrollLyrics();
      }
    });
  }

  void _scrollLyrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isScrollingAutomatically) {
        final scrollPosition = _scrollController.position.maxScrollExtent;
        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(seconds: 13),
          curve: Curves.linear,
        ).whenComplete(() {
          if (mounted) {
            setState(() {
              _isScrollingAutomatically = false;
              _isAtEnd = true;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          if (_isScrollingAutomatically) {
            setState(() {
              _isScrollingAutomatically = false;
            });
          }
        } else if (scrollNotification is ScrollEndNotification) {
          if (_scrollController.position.pixels == 0) {
            setState(() {
              _isAtEnd = false;
            });
          } else if (_scrollController.position.atEdge && _scrollController.position.pixels > 0) {
            setState(() {
              _isAtEnd = true;
            });
          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_scrollController.offset),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: aiChat,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
