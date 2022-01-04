part of 'dice_bear.dart';

const String _diceBearHost = "avatars.dicebear.com";
final Random _random = Random();

extension _DiceBearSpritesExt on DiceBearSprites {
  String get value {
    switch (this) {
      case DiceBearSprites.adventurer:
        return "adventurer";
      case DiceBearSprites.adventurerNeutral:
        return "adventurer-neutral";
      case DiceBearSprites.avataaars:
        return "avataaars";
      case DiceBearSprites.bigEars:
        return "big-ears";
      case DiceBearSprites.bigEarsNeutral:
        return "big-ears-neutral";
      case DiceBearSprites.bigSmile:
        return "big-smile";
      case DiceBearSprites.bottts:
        return "bottts";
      case DiceBearSprites.croodles:
        return "croodles";
      case DiceBearSprites.croodlesNeutral:
        return "croodles-neutral";
      case DiceBearSprites.identicon:
        return "identicon";
      case DiceBearSprites.initials:
        return "initials";
      case DiceBearSprites.micah:
        return "micah";
      case DiceBearSprites.miniavs:
        return "miniavs";
      case DiceBearSprites.openPeeps:
        return "open-peeps";
      case DiceBearSprites.personas:
        return "personas";
      case DiceBearSprites.pixelArt:
        return "pixel-art";
      case DiceBearSprites.pixelArtNeutral:
        return "pixel-art-neutral";
      case DiceBearSprites.any:
      default:
        return DiceBearSprites
            .values[_random.nextInt(DiceBearSprites.values.length - 1) + 1]
            .value;
    }
  }
}

extension _DiceBearMoodsExt on DiceBearMoods {
  String get value {
    switch (this) {
      case DiceBearMoods.happy:
        return 'happy';
      case DiceBearMoods.sad:
        return 'sad';
      case DiceBearMoods.surprised:
        return 'surprised';
      case DiceBearMoods.any:
      default:
        return DiceBearMoods
            .values[_random.nextInt(DiceBearMoods.values.length - 1) + 1].value;
    }
  }
}

extension _ColorX on Color {
  String toHexTriplet() =>
      '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

String _randomString() {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  return String.fromCharCodes(
    Iterable.generate(
      _random.nextInt(200) + 2,
      (_) => _chars.codeUnitAt(
        _random.nextInt(_chars.length),
      ),
    ),
  );
}
