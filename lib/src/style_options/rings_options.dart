part of '../../dice_bear.dart';

class DiceBearRingsOptions implements DiceBearStyleOptions {
  final List<String>? ring;
  final List<String>? ringColor;
  final List<String>? ringFive;
  final List<int>? ringFiveRotation;
  final List<String>? ringFour;
  final List<int>? ringFourRotation;
  final List<String>? ringOne;
  final List<int>? ringOneRotation;
  final List<int>? ringRotation;
  final List<String>? ringThree;
  final List<int>? ringThreeRotation;
  final List<String>? ringTwo;
  final List<int>? ringTwoRotation;

  const DiceBearRingsOptions({
    this.ring,
    this.ringColor,
    this.ringFive,
    this.ringFiveRotation,
    this.ringFour,
    this.ringFourRotation,
    this.ringOne,
    this.ringOneRotation,
    this.ringRotation,
    this.ringThree,
    this.ringThreeRotation,
    this.ringTwo,
    this.ringTwoRotation,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'ring', values: ring);
    _validateAllowedValues(
      name: 'ring',
      values: ring,
      allowed: const {'container'},
    );
    _validateHexArray(name: 'ringColor', values: ringColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'ringColor',
      values: ringColor,
      allowed: const {
        '4db6ac',
        '4dd0e1',
        '4fc3f7',
        '64b5f6',
        '7986cb',
        '81c784',
        '9575cd',
        'aed581',
        'ba68c8',
        'dce775',
        'e57373',
        'f06292',
        'ff8a65',
        'ffb74d',
        'ffd54f',
        'fff176',
      },
    );
    _validateStringArray(name: 'ringFive', values: ringFive);
    _validateAllowedValues(
      name: 'ringFive',
      values: ringFive,
      allowed: const {'eighth', 'full', 'half', 'quarter'},
    );
    _validateRangeArray(name: 'ringFiveRotation', values: ringFiveRotation);
    _validateStringArray(name: 'ringFour', values: ringFour);
    _validateAllowedValues(
      name: 'ringFour',
      values: ringFour,
      allowed: const {'eighth', 'full', 'half', 'quarter'},
    );
    _validateRangeArray(name: 'ringFourRotation', values: ringFourRotation);
    _validateStringArray(name: 'ringOne', values: ringOne);
    _validateAllowedValues(
      name: 'ringOne',
      values: ringOne,
      allowed: const {'eighth', 'full', 'half', 'quarter'},
    );
    _validateRangeArray(name: 'ringOneRotation', values: ringOneRotation);
    _validateRangeArray(name: 'ringRotation', values: ringRotation);
    _validateStringArray(name: 'ringThree', values: ringThree);
    _validateAllowedValues(
      name: 'ringThree',
      values: ringThree,
      allowed: const {'eighth', 'full', 'half', 'quarter'},
    );
    _validateRangeArray(name: 'ringThreeRotation', values: ringThreeRotation);
    _validateStringArray(name: 'ringTwo', values: ringTwo);
    _validateAllowedValues(
      name: 'ringTwo',
      values: ringTwo,
      allowed: const {'eighth', 'full', 'half', 'quarter'},
    );
    _validateRangeArray(name: 'ringTwoRotation', values: ringTwoRotation);
    return _serializeMap({
      'ring': ring,
      'ringColor': ringColor,
      'ringFive': ringFive,
      'ringFiveRotation': ringFiveRotation,
      'ringFour': ringFour,
      'ringFourRotation': ringFourRotation,
      'ringOne': ringOne,
      'ringOneRotation': ringOneRotation,
      'ringRotation': ringRotation,
      'ringThree': ringThree,
      'ringThreeRotation': ringThreeRotation,
      'ringTwo': ringTwo,
      'ringTwoRotation': ringTwoRotation,
    });
  }
}
