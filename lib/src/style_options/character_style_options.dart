part of '../../dice_bear.dart';

/// Abstract base class for avatar styles that expose [eyes] and [mouth] options.
abstract class DiceBearCharacterStyleOptions implements DiceBearStyleOptions {
  final List<String>? eyes;
  final List<String>? mouth;

  const DiceBearCharacterStyleOptions({this.eyes, this.mouth});
}
