part of '../../dice_bear.dart';

class DiceBearBotttsNeutralOptions extends DiceBearCharacterStyleOptions {
  const DiceBearBotttsNeutralOptions({
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
        'bulging',
        'dizzy',
        'eva',
        'frame1',
        'frame2',
        'glow',
        'happy',
        'hearts',
        'robocop',
        'round',
        'roundFrame01',
        'roundFrame02',
        'sensor',
        'shade01',
      },
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'bite',
        'diagram',
        'grill01',
        'grill02',
        'grill03',
        'smile01',
        'smile02',
        'square01',
        'square02',
      },
    );
    return _serializeMap({
      'eyes': eyes,
      'mouth': mouth,
    });
  }
}
