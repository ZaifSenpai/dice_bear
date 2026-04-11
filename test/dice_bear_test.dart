import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiceBearCoreOptions', () {
    test('serializes booleans and arrays for v9 query format', () {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.pixelArt,
        format: DiceBearFormat.svg,
        coreOptions: const DiceBearCoreOptions(
          seed: 'John',
          flip: true,
          backgroundColor: ['b6e3f4', 'c0aede'],
          backgroundType: [DiceBearBackgroundType.gradientLinear],
          backgroundRotation: [0, 180],
          clip: false,
        ),
      );

      final uri = request.uri.toString();
      expect(uri, contains('/9.x/pixel-art/svg'));
      expect(uri, contains('seed=John'));
      expect(uri, contains('flip=true'));
      expect(uri, contains('backgroundColor=b6e3f4%2Cc0aede'));
      expect(uri, contains('backgroundType=gradientLinear'));
      expect(uri, contains('backgroundRotation=0%2C180'));
      expect(uri, contains('clip=false'));
    });

    test('rejects invalid core ranges', () {
      expect(
        () => const DiceBearCoreOptions(scale: 300).toQueryParameters(),
        throwsArgumentError,
      );
      expect(
        () => const DiceBearCoreOptions(backgroundRotation: [10]).toQueryParameters(),
        throwsArgumentError,
      );
      expect(
        () => const DiceBearCoreOptions(backgroundColor: ['#ffffff']).toQueryParameters(),
        throwsArgumentError,
      );
    });

    test('fromColor strips alpha and serializes as lower-case hex', () {
      final values = DiceBearCoreOptions.fromColor(const Color(0x80AABBCC));
      expect(values, ['aabbcc']);
    });
  });

  group('Style option typing', () {
    test('pixel-art options serialize supported fields', () {
      const options = DiceBearPixelArtOptions(
        accessories: ['variant01', 'variant02'],
        accessoriesProbability: 50,
        glassesProbability: 100,
        hatProbability: 0,
      );

      final query = options.toQueryParameters();
      expect(query['accessories'], 'variant01,variant02');
      expect(query['accessoriesProbability'], '50');
      expect(query['glassesProbability'], '100');
      expect(query['hatProbability'], '0');
    });

    test('toon-head options serialize probabilities', () {
      const options = DiceBearToonHeadOptions(
        beardProbability: 40,
        hairProbability: 90,
        rearHairProbability: 10,
      );

      final query = options.toQueryParameters();
      expect(query['beardProbability'], '40');
      expect(query['hairProbability'], '90');
      expect(query['rearHairProbability'], '10');
    });

    test('pixel-art validates accessories and beard allowed values', () {
      const valid = DiceBearPixelArtOptions(
        accessories: ['variant01', 'variant04'],
        beard: ['variant01', 'variant08'],
      );

      expect(valid.toQueryParameters()['accessories'], 'variant01,variant04');
      expect(valid.toQueryParameters()['beard'], 'variant01,variant08');

      const invalidAccessories = DiceBearPixelArtOptions(
        accessories: ['unknown'],
      );

      const invalidBeard = DiceBearPixelArtOptions(
        beard: ['variant99'],
      );

      expect(() => invalidAccessories.toQueryParameters(), throwsArgumentError);
      expect(() => invalidBeard.toQueryParameters(), throwsArgumentError);
    });

    test('avataaars validates accessories allowed values', () {
      const valid = DiceBearAvataaarsOptions(
        accessories: ['sunglasses', 'eyepatch'],
      );

      expect(valid.toQueryParameters()['accessories'], 'sunglasses,eyepatch');

      const invalid = DiceBearAvataaarsOptions(
        accessories: ['not-real'],
      );

      expect(() => invalid.toQueryParameters(), throwsArgumentError);
    });

    test('list and color validation rejects malformed values', () {
      const invalidColor = DiceBearPixelArtOptions(
        accessoriesColor: ['#fff000'],
      );

      const invalidCommaItem = DiceBearRawStyleOptions({
        'hair': ['long01,long02'],
      });

      expect(() => invalidColor.toQueryParameters(), throwsArgumentError);
      expect(() => invalidCommaItem.toQueryParameters(), throwsArgumentError);
    });

    test('central serializer validation applies to other style classes', () {
      const invalidPersonas = DiceBearPersonasOptions(
        clothingColor: ['#11aa22'],
      );

      const invalidRings = DiceBearRingsOptions(
        ring: [''],
      );

      const validShapes = DiceBearShapesOptions(
        shape1: ['ellipse'],
        shape1Color: ['0a5b83'],
      );

      expect(() => invalidPersonas.toQueryParameters(), throwsArgumentError);
      expect(() => invalidRings.toQueryParameters(), throwsArgumentError);
      expect(validShapes.toQueryParameters()['shape1Color'], '0a5b83');
    });

    test('additional style classes enforce strict list and color validation', () {
      const validBottts = DiceBearBotttsOptions(
        baseColor: ['00897b'],
        eyes: ['bulging'],
      );

      const invalidThumbs = DiceBearThumbsOptions(
        mouthColor: ['#123456'],
      );

      const invalidToonHead = DiceBearToonHeadOptions(
        hair: ['short,medium'],
      );

      expect(validBottts.toQueryParameters()['baseColor'], '00897b');
      expect(() => invalidThumbs.toQueryParameters(), throwsArgumentError);
      expect(() => invalidToonHead.toQueryParameters(), throwsArgumentError);
    });

    test('range-array options require exactly two values', () {
      const validShapes = DiceBearShapesOptions(
        shape1OffsetX: [-65, 65],
      );

      const invalidGlass = DiceBearGlassOptions(
        shape1Rotation: [45],
      );

      const invalidRings = DiceBearRingsOptions(
        ringRotation: [0, 120, 240],
      );

      expect(validShapes.toQueryParameters()['shape1OffsetX'], '-65,65');
      expect(() => invalidGlass.toQueryParameters(), throwsArgumentError);
      expect(() => invalidRings.toQueryParameters(), throwsArgumentError);
    });
  });

  group('Format and style routing', () {
    test('all format path mappings are correct', () {
      const expectedPathByFormat = <DiceBearFormat, String>{
        DiceBearFormat.svg: '/9.x/bottts/svg',
        DiceBearFormat.png: '/9.x/bottts/png',
        DiceBearFormat.jpg: '/9.x/bottts/jpg',
        DiceBearFormat.webp: '/9.x/bottts/webp',
        DiceBearFormat.avif: '/9.x/bottts/avif',
        DiceBearFormat.json: '/9.x/bottts/json',
      };

      for (final entry in expectedPathByFormat.entries) {
        final request = DiceBearRequest<DiceBearRawStyleOptions>(
          style: DiceBearStyle.bottts,
          format: entry.key,
          coreOptions: const DiceBearCoreOptions(seed: 'format-check'),
        );

        expect(request.uri.path, entry.value);
      }
    });

    test('all style path mappings are correct', () {
      const expectedPathByStyle = <DiceBearStyle, String>{
        DiceBearStyle.adventurer: '/9.x/adventurer/svg',
        DiceBearStyle.adventurerNeutral: '/9.x/adventurer-neutral/svg',
        DiceBearStyle.avataaars: '/9.x/avataaars/svg',
        DiceBearStyle.avataaarsNeutral: '/9.x/avataaars-neutral/svg',
        DiceBearStyle.bigEars: '/9.x/big-ears/svg',
        DiceBearStyle.bigEarsNeutral: '/9.x/big-ears-neutral/svg',
        DiceBearStyle.bigSmile: '/9.x/big-smile/svg',
        DiceBearStyle.bottts: '/9.x/bottts/svg',
        DiceBearStyle.botttsNeutral: '/9.x/bottts-neutral/svg',
        DiceBearStyle.croodles: '/9.x/croodles/svg',
        DiceBearStyle.croodlesNeutral: '/9.x/croodles-neutral/svg',
        DiceBearStyle.dylan: '/9.x/dylan/svg',
        DiceBearStyle.funEmoji: '/9.x/fun-emoji/svg',
        DiceBearStyle.glass: '/9.x/glass/svg',
        DiceBearStyle.icons: '/9.x/icons/svg',
        DiceBearStyle.identicon: '/9.x/identicon/svg',
        DiceBearStyle.initials: '/9.x/initials/svg',
        DiceBearStyle.lorelei: '/9.x/lorelei/svg',
        DiceBearStyle.loreleiNeutral: '/9.x/lorelei-neutral/svg',
        DiceBearStyle.micah: '/9.x/micah/svg',
        DiceBearStyle.miniavs: '/9.x/miniavs/svg',
        DiceBearStyle.notionists: '/9.x/notionists/svg',
        DiceBearStyle.notionistsNeutral: '/9.x/notionists-neutral/svg',
        DiceBearStyle.openPeeps: '/9.x/open-peeps/svg',
        DiceBearStyle.personas: '/9.x/personas/svg',
        DiceBearStyle.pixelArt: '/9.x/pixel-art/svg',
        DiceBearStyle.pixelArtNeutral: '/9.x/pixel-art-neutral/svg',
        DiceBearStyle.rings: '/9.x/rings/svg',
        DiceBearStyle.shapes: '/9.x/shapes/svg',
        DiceBearStyle.thumbs: '/9.x/thumbs/svg',
        DiceBearStyle.toonHead: '/9.x/toon-head/svg',
      };

      for (final entry in expectedPathByStyle.entries) {
        final request = DiceBearRequest<DiceBearRawStyleOptions>(
          style: entry.key,
          coreOptions: const DiceBearCoreOptions(seed: 'style-check'),
        );

        expect(request.uri.path, entry.value);
      }
    });

    test('builds json endpoint for metadata', () {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.toonHead,
        format: DiceBearFormat.json,
        coreOptions: const DiceBearCoreOptions(seed: 'meta-seed'),
      );

      expect(request.uri.path, '/9.x/toon-head/json');
    });

    test('query parameters are deterministic and sorted by key', () {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.pixelArt,
        coreOptions: const DiceBearCoreOptions(seed: 's', flip: true, scale: 120),
        styleOptions: const DiceBearRawStyleOptions({
          'zzz': 1,
          'aaa': 2,
        }),
      );

      expect(request.queryParameters.keys.toList(), ['aaa', 'flip', 'scale', 'seed', 'zzz']);
      expect(request.uri.query, 'aaa=2&flip=true&scale=120&seed=s&zzz=1');
    });

    test('uri includes merged core and typed style parameters', () {
      final request = DiceBearRequest<DiceBearPixelArtOptions>(
        style: DiceBearStyle.pixelArt,
        format: DiceBearFormat.svg,
        coreOptions: const DiceBearCoreOptions(
          seed: 'merge-check',
          size: 128,
          backgroundColor: ['b6e3f4'],
        ),
        styleOptions: const DiceBearPixelArtOptions(
          accessories: ['variant01', 'variant03'],
          accessoriesProbability: 70,
          beard: ['variant02'],
        ),
      );

      expect(request.uri.path, '/9.x/pixel-art/svg');
      expect(request.uri.queryParameters['seed'], 'merge-check');
      expect(request.uri.queryParameters['size'], '128');
      expect(request.uri.queryParameters['backgroundColor'], 'b6e3f4');
      expect(request.uri.queryParameters['accessories'], 'variant01,variant03');
      expect(request.uri.queryParameters['accessoriesProbability'], '70');
      expect(request.uri.queryParameters['beard'], 'variant02');
    });

    test('random style resolves to concrete style path', () {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.random,
        coreOptions: const DiceBearCoreOptions(seed: 'random-check'),
      );

      expect(request.uri.path, startsWith('/9.x/'));
      expect(request.uri.path, endsWith('/svg'));
      expect(request.uri.path.contains('/random/'), isFalse);
    });

    test('legacy DiceBearBuilder builds v9 style url', () {
      final avatar = DiceBearBuilder(
        sprite: DiceBearStyle.toonHead,
        seed: 'legacy-builder',
        size: 96,
        scale: 110,
        rotate: 20,
      ).build();

      expect(avatar.svgUri.path, '/9.x/toon-head/svg');
      expect(avatar.svgUri.queryParameters['seed'], 'legacy-builder');
      expect(avatar.svgUri.queryParameters['size'], '96');
      expect(avatar.svgUri.queryParameters['scale'], '110');
      expect(avatar.svgUri.queryParameters['rotate'], '20');
    });

    test('fetchBytes rejects json format before making network call', () async {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.bottts,
        format: DiceBearFormat.json,
      );

      await expectLater(request.fetchBytes(), throwsStateError);
    });

    test('fetchJson rejects non-json format before making network call', () async {
      final request = DiceBearRequest<DiceBearRawStyleOptions>(
        style: DiceBearStyle.bottts,
        format: DiceBearFormat.svg,
      );

      await expectLater(request.fetchJson(), throwsStateError);
    });

    test('raw style options reject unsupported query value types', () {
      const options = DiceBearRawStyleOptions({
        'invalid': {
          'nested': 'map',
        },
      });

      expect(() => options.toQueryParameters(), throwsArgumentError);
    });

    test('all typed style option classes serialize safely', () {
      const options = <DiceBearStyleOptions>[
        DiceBearRawStyleOptions({}),
        DiceBearAdventurerNeutralOptions(),
        DiceBearAdventurerOptions(),
        DiceBearAvataaarsNeutralOptions(),
        DiceBearAvataaarsOptions(),
        DiceBearBigEarsNeutralOptions(),
        DiceBearBigEarsOptions(),
        DiceBearBigSmileOptions(),
        DiceBearBotttsNeutralOptions(),
        DiceBearBotttsOptions(),
        DiceBearCroodlesNeutralOptions(),
        DiceBearCroodlesOptions(),
        DiceBearDylanOptions(),
        DiceBearFunEmojiOptions(),
        DiceBearGlassOptions(),
        DiceBearIconsOptions(),
        DiceBearIdenticonOptions(),
        DiceBearInitialsOptions(),
        DiceBearLoreleiNeutralOptions(),
        DiceBearLoreleiOptions(),
        DiceBearMicahOptions(),
        DiceBearMiniavsOptions(),
        DiceBearNotionistsNeutralOptions(),
        DiceBearNotionistsOptions(),
        DiceBearOpenPeepsOptions(),
        DiceBearPersonasOptions(),
        DiceBearPixelArtNeutralOptions(),
        DiceBearPixelArtOptions(),
        DiceBearRingsOptions(),
        DiceBearShapesOptions(),
        DiceBearThumbsOptions(),
        DiceBearToonHeadOptions(),
      ];

      for (final option in options) {
        expect(option.toQueryParameters(), isA<Map<String, String>>());
      }
    });
  });
}
