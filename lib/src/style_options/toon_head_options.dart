part of '../../dice_bear.dart';

class DiceBearToonHeadOptions extends DiceBearCharacterStyleOptions {
  final String? seed;
  final bool? flip;
  final int? rotate;
  final int? scale;
  final int? radius;
  final int? size;
  final List<String>? backgroundColor;
  final List<DiceBearBackgroundType>? backgroundType;
  final List<int>? backgroundRotation;
  final int? translateX;
  final int? translateY;
  final bool? clip;
  final bool? randomizeIds;
  final List<String>? beard;
  final int? beardProbability;
  final List<String>? body;
  final List<String>? clothes;
  final List<String>? clothesColor;
  final List<String>? eyebrows;
  final int? eyebrowsProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final int? hairProbability;
  final List<String>? head;
  final List<String>? rearHair;
  final int? rearHairProbability;
  final List<String>? skinColor;

  const DiceBearToonHeadOptions({
    this.seed,
    this.flip,
    this.rotate,
    this.scale,
    this.radius,
    this.size,
    this.backgroundColor,
    this.backgroundType,
    this.backgroundRotation,
    this.translateX,
    this.translateY,
    this.clip,
    this.randomizeIds,
    this.beard,
    this.beardProbability,
    this.body,
    this.clothes,
    this.clothesColor,
    this.eyebrows,
    this.eyebrowsProbability,
    super.eyes,
    this.hair,
    this.hairColor,
    this.hairProbability,
    this.head,
    super.mouth,
    this.rearHair,
    this.rearHairProbability,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    // Core options validation
    _checkRange(name: 'rotate', value: rotate, min: 0, max: 360);
    _checkRange(name: 'scale', value: scale, min: 0, max: 200);
    _checkRange(name: 'radius', value: radius, min: 0, max: 50);
    _checkRange(name: 'size', value: size, min: 1);
    _validateHexArray(
        name: 'backgroundColor',
        values: backgroundColor,
        allowTransparent: true);
    if (backgroundType != null) {
      _validateStringArray(
          name: 'backgroundType',
          values: backgroundType?.map((e) => e.value).toList(growable: false));
    }
    _validateRangeArray(name: 'backgroundRotation', values: backgroundRotation);
    _checkRange(name: 'translateX', value: translateX, min: -100, max: 100);
    _checkRange(name: 'translateY', value: translateY, min: -100, max: 100);

    // Style-specific options validation
    _validateStringArray(name: 'beard', values: beard);
    _validateAllowedValues(
      name: 'beard',
      values: beard,
      allowed: const {
        'chin',
        'chinMoustache',
        'fullBeard',
        'longBeard',
        'moustacheTwirl'
      },
    );
    _checkProbability(name: 'beardProbability', value: beardProbability);
    _validateStringArray(name: 'body', values: body);
    _validateAllowedValues(name: 'body', values: body, allowed: const {'body'});
    _validateStringArray(name: 'clothes', values: clothes);
    _validateAllowedValues(
      name: 'clothes',
      values: clothes,
      allowed: const {'dress', 'openJacket', 'shirt', 'tShirt', 'turtleNeck'},
    );
    _validateHexArray(
        name: 'clothesColor', values: clothesColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'clothesColor',
      values: clothesColor,
      allowed: const {
        '0b3286',
        '147f3c',
        '731ac3',
        '151613',
        '545454',
        'b11f1f',
        'e8e9e6',
        'eab308',
        'ec4899',
        'f97316'
      },
    );
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validateAllowedValues(
      name: 'eyebrows',
      values: eyebrows,
      allowed: const {'angry', 'happy', 'neutral', 'raised', 'sad'},
    );
    _checkProbability(name: 'eyebrowsProbability', value: eyebrowsProbability);
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {'bow', 'happy', 'humble', 'wide', 'wink'},
    );
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {'bun', 'sideComed', 'spiky', 'undercut'},
    );
    _validateHexArray(
        name: 'hairColor', values: hairColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'hairColor',
      values: hairColor,
      allowed: const {'2c1b18', '724133', 'a55728', 'b58143', 'd6b370'},
    );
    _checkProbability(name: 'hairProbability', value: hairProbability);
    _validateStringArray(name: 'head', values: head);
    _validateAllowedValues(name: 'head', values: head, allowed: const {'head'});
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {'agape', 'angry', 'laugh', 'sad', 'smile'},
    );
    _validateStringArray(name: 'rearHair', values: rearHair);
    _validateAllowedValues(
      name: 'rearHair',
      values: rearHair,
      allowed: const {'longStraight', 'longWavy', 'neckHigh', 'shoulderHigh'},
    );
    _checkProbability(name: 'rearHairProbability', value: rearHairProbability);
    _validateHexArray(
        name: 'skinColor', values: skinColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'skinColor',
      values: skinColor,
      allowed: const {'5c3829', 'a36b4f', 'b98e6a', 'c68e7a', 'f1c3a5'},
    );

    return _serializeMap({
      'seed': seed,
      'flip': flip,
      'rotate': rotate,
      'scale': scale,
      'radius': radius,
      'size': size,
      'backgroundColor': backgroundColor,
      'backgroundType':
          backgroundType?.map((e) => e.value).toList(growable: false),
      'backgroundRotation': backgroundRotation,
      'translateX': translateX,
      'translateY': translateY,
      'clip': clip,
      'randomizeIds': randomizeIds,
      'beard': beard,
      'beardProbability': beardProbability,
      'body': body,
      'clothes': clothes,
      'clothesColor': clothesColor,
      'eyebrows': eyebrows,
      'eyebrowsProbability': eyebrowsProbability,
      'eyes': eyes,
      'hair': hair,
      'hairColor': hairColor,
      'hairProbability': hairProbability,
      'head': head,
      'mouth': mouth,
      'rearHair': rearHair,
      'rearHairProbability': rearHairProbability,
      'skinColor': skinColor,
    });
  }
}
