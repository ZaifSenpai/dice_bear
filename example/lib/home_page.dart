import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Avatar? _avatar;

  DiceBearSprites sprite = DiceBearSprites.any;
  String? seed;
  DiceBearMoods mood = DiceBearMoods.any;
  Color? background;
  int radius = 0;
  int? size;
  int scale = 100;
  bool flip = false;
  int rotate = 0;
  int translateX = 0;
  int translateY = 0;

  @override
  void initState() {
    super.initState();

    _buildAvatar();
  }

  void _buildAvatar() {
    setState(() {
      _avatar = DiceBearBuilder(
        sprite: sprite,
      ).build();
    });
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      color: Colors.transparent,
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Divider(height: 50),
              _AvatarView(_avatar),
              divider,
              SelectableText(
                _avatar?.svgUri.toString() ?? "",
                minLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shuffle),
        onPressed: _buildAvatar,
      ),
    );
  }
}

class _AvatarView extends StatelessWidget {
  final Avatar? avatar;

  const _AvatarView(this.avatar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        color: Colors.white,
      ),
      child: avatar?.toImage(
            width: 150,
            height: 150,
            clipBehavior: Clip.none,
          ) ??
          Container(),
    );
  }
}
