import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifPlayer extends StatefulWidget {
  const GifPlayer({super.key, required this.gifPath});
  final String gifPath;

  @override
  State<GifPlayer> createState() => _GifPlayerState();
}

class _GifPlayerState extends State<GifPlayer> with TickerProviderStateMixin {
  late final GifController controller;
  int _fps = 30;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: AssetImage(widget.gifPath),
      controller: controller,
      //fps: 30,
      //duration: const Duration(seconds: 3),
      autostart: Autostart.loop,
      placeholder: (context) => const SizedBox(),
      onFetchCompleted: () {
        controller.reset();
        controller.forward();
      },
    );
  }
}
