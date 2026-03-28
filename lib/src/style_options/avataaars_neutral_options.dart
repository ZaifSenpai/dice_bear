part of '../../dice_bear.dart';

class DiceBearAvataaarsNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? eyebrows;
  final List<String>? nose;

  const DiceBearAvataaarsNeutralOptions({
    this.eyebrows,
    super.eyes,
    super.mouth,
    this.nose,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validateAllowedValues(
      name: 'eyebrows',
      values: eyebrows,
      allowed: const {
        'angry',
        'angryNatural',
        'default',
        'defaultNatural',
        'flatNatural',
        'frownNatural',
        'raisedExcited',
        'raisedExcitedNatural',
        'sadConcerned',
        'sadConcernedNatural',
        'unibrowNatural',
        'upDown',
        'upDownNatural',
      },
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {
        'closed',
        'cry',
        'default',
        'eyeRoll',
        'happy',
        'hearts',
        'side',
        'squint',
        'surprised',
        'wink',
        'winkWacky',
        'xDizzy',
      },
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'concerned',
        'default',
        'disbelief',
        'eating',
        'grimace',
        'sad',
        'screamOpen',
        'serious',
        'smile',
        'tongue',
        'twinkle',
        'vomit',
      },
    );
    _validateStringArray(name: 'nose', values: nose);
    _validateAllowedValues(name: 'nose', values: nose, allowed: const {'default'});
    return _serializeMap({
      'eyebrows': eyebrows,
      'eyes': eyes,
      'mouth': mouth,
      'nose': nose,
    });
  }
}
