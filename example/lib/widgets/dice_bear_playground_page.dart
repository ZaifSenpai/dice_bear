import 'dart:convert';
import 'dart:math';

import 'package:dice_bear/dice_bear.dart';
import 'package:flutter/material.dart';

import 'code_box.dart';
import 'control_card.dart';
import 'slider_input.dart';

class DiceBearPlaygroundPage extends StatefulWidget {
  const DiceBearPlaygroundPage({super.key});

  @override
  State<DiceBearPlaygroundPage> createState() => _DiceBearPlaygroundPageState();
}

class _DiceBearPlaygroundPageState extends State<DiceBearPlaygroundPage> {
  final TextEditingController _seedController = TextEditingController(
    text: 'flutter_user',
  );
  final TextEditingController _backgroundPrimaryController =
      TextEditingController(text: '3ecaf5');
  final TextEditingController _backgroundSecondaryController =
      TextEditingController(text: 'f9f1d1');
  final TextEditingController _initialsTextColorController =
      TextEditingController(text: '2a2a2a');
  final TextEditingController _pixelClothingColorController =
      TextEditingController(text: 'fbf5e6');

  final List<DiceBearStyle> _styles = DiceBearStyle.values
      .where((style) => style != DiceBearStyle.thumb)
      .toList(growable: false);

  final Random _random = Random();

  DiceBearStyle _style = DiceBearStyle.adventurer;
  DiceBearFormat _format = DiceBearFormat.svg;
  DiceBearBackgroundType _backgroundType = DiceBearBackgroundType.solid;

  bool _flip = false;
  bool _clip = true;
  bool _randomizeIds = false;
  bool _useSecondaryBackgroundColor = false;

  int _rotate = 0;
  int _scale = 100;
  int _radius = 8;
  int _size = 256;
  int _translateX = 0;
  int _translateY = 0;

  String _adventurerEyes = 'variant01';
  String _adventurerMouth = 'variant10';
  bool _adventurerGlasses = true;
  int _adventurerGlassesProbability = 60;

  bool _pixelAccessory = true;
  bool _pixelBeard = false;
  bool _pixelHat = false;
  int _pixelAccessoryProbability = 80;

  int _initialsChars = 2;
  int _initialsFontWeight = 600;

  bool _loadingRawResponse = false;
  String? _rawResponse;
  String? _rawResponseError;

  @override
  void dispose() {
    _seedController.dispose();
    _backgroundPrimaryController.dispose();
    _backgroundSecondaryController.dispose();
    _initialsTextColorController.dispose();
    _pixelClothingColorController.dispose();
    super.dispose();
  }

  DiceBearRequest<DiceBearStyleOptions> _buildRequest() {
    final styleOptions = _buildStyleOptions();
    final backgroundColors = <String>[
      _cleanColor(_backgroundPrimaryController.text),
    ];

    if (_useSecondaryBackgroundColor) {
      backgroundColors.add(_cleanColor(_backgroundSecondaryController.text));
    }

    return DiceBearRequest<DiceBearStyleOptions>(
      style: _style,
      format: _format,
      coreOptions: DiceBearCoreOptions(
        seed: _seedController.text.trim(),
        flip: _flip,
        rotate: _rotate,
        scale: _scale,
        radius: _radius,
        size: _size,
        backgroundColor: backgroundColors,
        backgroundType: <DiceBearBackgroundType>[_backgroundType],
        translateX: _translateX,
        translateY: _translateY,
        clip: _clip,
        randomizeIds: _randomizeIds,
      ),
      styleOptions: styleOptions,
    );
  }

  DiceBearStyleOptions? _buildStyleOptions() {
    switch (_style) {
      case DiceBearStyle.adventurer:
        return DiceBearAdventurerOptions(
          eyes: <String>[_adventurerEyes],
          mouth: <String>[_adventurerMouth],
          glasses: _adventurerGlasses ? const <String>['variant02'] : null,
          glassesProbability: _adventurerGlasses
              ? _adventurerGlassesProbability
              : null,
        );
      case DiceBearStyle.pixelArt:
        return DiceBearPixelArtOptions(
          accessories: _pixelAccessory ? const <String>['variant01'] : null,
          accessoriesProbability: _pixelAccessory
              ? _pixelAccessoryProbability
              : null,
          beard: _pixelBeard ? const <String>['variant03'] : null,
          hat: _pixelHat ? const <String>['variant04'] : null,
          eyes: const <String>['variant10'],
          mouth: const <String>['variant03'],
          clothingColor: <String>[
            _cleanColor(_pixelClothingColorController.text),
          ],
        );
      case DiceBearStyle.initials:
        return DiceBearInitialsOptions(
          chars: _initialsChars,
          fontWeight: _initialsFontWeight,
          textColor: <String>[_cleanColor(_initialsTextColorController.text)],
          fontFamily: const <String>['Arial'],
        );
      default:
        return null;
    }
  }

  Future<void> _fetchRawResponse() async {
    final request = _buildRequest();

    setState(() {
      _loadingRawResponse = true;
      _rawResponseError = null;
    });

    try {
      if (_format == DiceBearFormat.json) {
        final json = await request.fetchJson();
        final pretty = const JsonEncoder.withIndent('  ').convert(json);
        if (!mounted) {
          return;
        }
        setState(() {
          _rawResponse = pretty;
        });
      } else {
        final bytes = await request.fetchBytes();
        final text = _format == DiceBearFormat.svg
            ? utf8.decode(bytes, allowMalformed: true)
            : 'Binary image bytes (${bytes.length} bytes)\n\n'
                  '${base64Encode(bytes).substring(0, min(bytes.length, 200))}...';
        if (!mounted) {
          return;
        }
        setState(() {
          _rawResponse = text;
        });
      }
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _rawResponseError = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _loadingRawResponse = false;
        });
      }
    }
  }

  void _randomizeSeed() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final generated = List.generate(
      12,
      (_) => chars[_random.nextInt(chars.length)],
    ).join();

    setState(() {
      _seedController.text = generated;
    });
  }

  String _cleanColor(String value) {
    final cleaned = value.trim().replaceAll('#', '').toLowerCase();
    return cleaned.isEmpty ? 'ffffff' : cleaned;
  }

  String _buildRequestSummary(DiceBearRequest<DiceBearStyleOptions> request) {
    final buffer = StringBuffer()
      ..writeln('style: ${request.style.name}')
      ..writeln('format: ${request.format.name}')
      ..writeln('uri: ${request.uri}')
      ..writeln('')
      ..writeln('queryParameters:');

    request.queryParameters.forEach((key, value) {
      buffer.writeln('  $key: $value');
    });

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final request = _buildRequest();
    final requestSummary = _buildRequestSummary(request);

    final controlPanel = ControlCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Avatar Playground',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _seedController,
                  decoration: const InputDecoration(
                    labelText: 'Seed',
                    hintText: 'Enter deterministic seed',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.tonal(
                onPressed: _randomizeSeed,
                child: const Text('Random Seed'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<DiceBearStyle>(
            key: ValueKey<DiceBearStyle>(_style),
            initialValue: _style,
            decoration: const InputDecoration(
              labelText: 'Style',
              border: OutlineInputBorder(),
            ),
            items: _styles
                .map(
                  (style) => DropdownMenuItem<DiceBearStyle>(
                    value: style,
                    child: Text(style.name),
                  ),
                )
                .toList(growable: false),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _style = value;
              });
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Format (radio)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: DiceBearFormat.values
                .map(
                  (format) => ChoiceChip(
                    label: Text(format.name),
                    selected: _format == format,
                    onSelected: (_) {
                      setState(() {
                        _format = format;
                      });
                    },
                  ),
                )
                .toList(growable: false),
          ),
          const SizedBox(height: 12),
          Text('Core options', style: Theme.of(context).textTheme.titleMedium),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Flip horizontally'),
            value: _flip,
            onChanged: (value) => setState(() => _flip = value ?? false),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Clip to bounds'),
            value: _clip,
            onChanged: (value) => setState(() => _clip = value ?? true),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Randomize SVG ids'),
            value: _randomizeIds,
            onChanged: (value) =>
                setState(() => _randomizeIds = value ?? false),
          ),
          SliderInput(
            label: 'Rotate',
            value: _rotate.toDouble(),
            min: 0,
            max: 360,
            divisions: 36,
            onChanged: (value) => setState(() => _rotate = value.round()),
          ),
          SliderInput(
            label: 'Scale',
            value: _scale.toDouble(),
            min: 0,
            max: 200,
            divisions: 20,
            onChanged: (value) => setState(() => _scale = value.round()),
          ),
          SliderInput(
            label: 'Radius',
            value: _radius.toDouble(),
            min: 0,
            max: 50,
            divisions: 25,
            onChanged: (value) => setState(() => _radius = value.round()),
          ),
          SliderInput(
            label: 'Translate X',
            value: _translateX.toDouble(),
            min: -100,
            max: 100,
            divisions: 40,
            onChanged: (value) => setState(() => _translateX = value.round()),
          ),
          SliderInput(
            label: 'Translate Y',
            value: _translateY.toDouble(),
            min: -100,
            max: 100,
            divisions: 40,
            onChanged: (value) => setState(() => _translateY = value.round()),
          ),
          SliderInput(
            label: 'Size',
            value: _size.toDouble(),
            min: 64,
            max: 512,
            divisions: 14,
            onChanged: (value) => setState(() => _size = value.round()),
          ),
          const SizedBox(height: 12),
          Text('Background', style: Theme.of(context).textTheme.titleMedium),
          RadioGroup<DiceBearBackgroundType>(
            groupValue: _backgroundType,
            onChanged: (value) {
              setState(() {
                _backgroundType = value ?? _backgroundType;
              });
            },
            child: Column(
              children: const <Widget>[
                RadioListTile<DiceBearBackgroundType>(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Solid'),
                  value: DiceBearBackgroundType.solid,
                ),
                RadioListTile<DiceBearBackgroundType>(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Linear Gradient'),
                  value: DiceBearBackgroundType.gradientLinear,
                ),
              ],
            ),
          ),
          TextField(
            controller: _backgroundPrimaryController,
            decoration: const InputDecoration(
              labelText: 'Primary background color (hex)',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Use secondary background color'),
            value: _useSecondaryBackgroundColor,
            onChanged: (value) =>
                setState(() => _useSecondaryBackgroundColor = value ?? false),
          ),
          if (_useSecondaryBackgroundColor)
            TextField(
              controller: _backgroundSecondaryController,
              decoration: const InputDecoration(
                labelText: 'Secondary background color (hex)',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
          const SizedBox(height: 16),
          Text(
            'Style-specific controls',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _buildStyleControls(),
        ],
      ),
    );

    final outputPanel = ControlCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Preview & Output',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: 260,
              height: 260,
              child: Center(
                child: _format == DiceBearFormat.json
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'JSON format selected. Image preview is only available for SVG and raster formats.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : request.toImage(
                        width: 240,
                        height: 240,
                        semanticsLabel: 'Generated avatar',
                        placeholderBuilder: (_) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _loadingRawResponse ? null : _fetchRawResponse,
            icon: _loadingRawResponse
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.download),
            label: const Text('Fetch raw output'),
          ),
          const SizedBox(height: 12),
          CodeBox(text: requestSummary),
          const SizedBox(height: 12),
          if (_rawResponseError != null)
            Text(
              _rawResponseError!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          if (_rawResponse != null)
            CodeBox(text: _rawResponse!, maxHeight: 260),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('dice_bear example playground')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1100) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: controlPanel,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: outputPanel,
                  ),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                controlPanel,
                const SizedBox(height: 16),
                outputPanel,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStyleControls() {
    switch (_style) {
      case DiceBearStyle.adventurer:
        return Column(
          children: <Widget>[
            DropdownButtonFormField<String>(
              key: ValueKey<String>('adventurer-eyes-$_adventurerEyes'),
              initialValue: _adventurerEyes,
              decoration: const InputDecoration(
                labelText: 'Eyes variant',
                border: OutlineInputBorder(),
              ),
              items: List.generate(26, (index) {
                final value =
                    'variant${(index + 1).toString().padLeft(2, '0')}';
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _adventurerEyes = value;
                });
              },
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: ValueKey<String>('adventurer-mouth-$_adventurerMouth'),
              initialValue: _adventurerMouth,
              decoration: const InputDecoration(
                labelText: 'Mouth variant',
                border: OutlineInputBorder(),
              ),
              items: List.generate(30, (index) {
                final value =
                    'variant${(index + 1).toString().padLeft(2, '0')}';
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _adventurerMouth = value;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Include glasses'),
              value: _adventurerGlasses,
              onChanged: (value) =>
                  setState(() => _adventurerGlasses = value ?? false),
            ),
            if (_adventurerGlasses)
              SliderInput(
                label: 'Glasses probability',
                value: _adventurerGlassesProbability.toDouble(),
                min: 0,
                max: 100,
                divisions: 20,
                onChanged: (value) => setState(
                  () => _adventurerGlassesProbability = value.round(),
                ),
              ),
          ],
        );
      case DiceBearStyle.pixelArt:
        return Column(
          children: <Widget>[
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Add accessory'),
              value: _pixelAccessory,
              onChanged: (value) =>
                  setState(() => _pixelAccessory = value ?? false),
            ),
            if (_pixelAccessory)
              SliderInput(
                label: 'Accessory probability',
                value: _pixelAccessoryProbability.toDouble(),
                min: 0,
                max: 100,
                divisions: 20,
                onChanged: (value) =>
                    setState(() => _pixelAccessoryProbability = value.round()),
              ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Add beard'),
              value: _pixelBeard,
              onChanged: (value) =>
                  setState(() => _pixelBeard = value ?? false),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Add hat'),
              value: _pixelHat,
              onChanged: (value) => setState(() => _pixelHat = value ?? false),
            ),
            TextField(
              controller: _pixelClothingColorController,
              decoration: const InputDecoration(
                labelText: 'Clothing color (hex)',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ],
        );
      case DiceBearStyle.initials:
        return Column(
          children: <Widget>[
            DropdownButtonFormField<int>(
              key: ValueKey<int>(_initialsChars),
              initialValue: _initialsChars,
              decoration: const InputDecoration(
                labelText: 'Character count',
                border: OutlineInputBorder(),
              ),
              items: const <DropdownMenuItem<int>>[
                DropdownMenuItem<int>(value: 1, child: Text('1')),
                DropdownMenuItem<int>(value: 2, child: Text('2')),
                DropdownMenuItem<int>(value: 3, child: Text('3')),
              ],
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _initialsChars = value;
                });
              },
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              key: ValueKey<int>(_initialsFontWeight),
              initialValue: _initialsFontWeight,
              decoration: const InputDecoration(
                labelText: 'Font weight',
                border: OutlineInputBorder(),
              ),
              items: const <DropdownMenuItem<int>>[
                DropdownMenuItem<int>(value: 400, child: Text('400')),
                DropdownMenuItem<int>(value: 500, child: Text('500')),
                DropdownMenuItem<int>(value: 600, child: Text('600')),
                DropdownMenuItem<int>(value: 700, child: Text('700')),
                DropdownMenuItem<int>(value: 800, child: Text('800')),
              ],
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _initialsFontWeight = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _initialsTextColorController,
              decoration: const InputDecoration(
                labelText: 'Text color (hex)',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ],
        );
      default:
        return const Text(
          'This style uses shared core options only. Switch to Adventurer, PixelArt, or Initials to see typed style options in action.',
        );
    }
  }
}
