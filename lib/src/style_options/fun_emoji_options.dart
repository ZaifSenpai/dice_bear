part of '../../dice_bear.dart';

class DiceBearFunEmojiOptions extends DiceBearCharacterStyleOptions {
  const DiceBearFunEmojiOptions({
    super.eyes,
    super.mouth,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {
        'closed',
        'closed2',
        'crying',
        'cute',
        'glasses',
        'love',
        'pissed',
        'plain',
        'sad',
        'shades',
        'sleepClose',
        'stars',
        'tearDrop',
        'wink',
        'wink2',
      },
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'cute',
        'drip',
        'faceMask',
        'kissHeart',
        'lilSmile',
        'pissed',
        'plain',
        'sad',
        'shout',
        'shy',
        'sick',
        'smileLol',
        'smileTeeth',
        'tongueOut',
        'wideSmile',
      },
    );
    return _serializeMap({
      'eyes': eyes,
      'mouth': mouth,
    });
  }
}
