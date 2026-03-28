<h1 align="center"><img src="https://api.dicebear.com/9.x/big-smile/svg?seed=flutter&backgroundColor=3ECAF5&radius=6&scale=90" width="124" /> <br />dice_bear<br />Flutter Package</h1>

A fully-typed Dart/Flutter wrapper for the [DiceBear API (v9.x)](https://www.dicebear.com/) that generates unique avatar profile pictures with extensive customization options.

DiceBear is an avatar library for designers and developers. Generate random, deterministic avatar profile pictures from seeds, supporting 30+ unique art styles with fine-grained style-specific customization.

[![GitHub stars](https://img.shields.io/github/stars/ZaifSenpai/dice_bear)](https://github.com/ZaifSenpai/dice_bear) [![pub package](https://img.shields.io/pub/v/dice_bear)](https://pub.dev/packages/dice_bear)

- 📚 Explore [DiceBear on GitHub](https://github.com/dicebear/dicebear)
- 🎨 See all [avatar styles and licenses](https://www.dicebear.com/styles)
- 💻 Check out the [DiceBear API docs](https://www.dicebear.com/http-api)

## Features

✨ **Full Type Safety** — Every style option is a dedicated Dart class with compile-time validation

🎯 **30+ Avatar Styles** — Support for all DiceBear styles including Adventurer, Avataaars, PixelArt, and more

🔧 **Style-Specific Customization** — Each style has its own set of customization options (eyes, mouth, accessories, etc.)

📦 **Flexible Output** — Get SVG URLs, rendered Flutter widgets, or raw SVG bytes

🎲 **Deterministic & Random** — Generate consistent avatars from a seed or random ones each time

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  dice_bear: ^1.0.0
```

Then run `flutter pub get`.

## Quick Start

### Basic Usage

```dart
import 'package:dice_bear/dice_bear.dart';

// Create a simple avatar
final avatar = DiceBearBuilder(
  seed: 'john_doe',  // Deterministic: same seed = same avatar
  sprite: DiceBearSprite.adventurer,
).build();

// Render as Flutter widget
Widget widget = avatar.toImage(width: 200, height: 200);

// Get the SVG URL
Uri svgUrl = avatar.svgUri;

// Get raw SVG bytes
Uint8List? svgBytes = await avatar.asRawSvgBytes();
```

### Random Avatar

```dart
// Generate a new random avatar each time
final avatar = DiceBearBuilder.withRandomSeed().build();
```

## Advanced Usage

### Style-Specific Customization

Each DiceBear style has its own options class for fine-grained control:

```dart
// Adventurer style with custom eye and mouth options
final avatar = DiceBearBuilder(
  seed: 'user123',
  sprite: DiceBearSprite.adventurer,
  styleOptions: DiceBearAdventurerOptions(
    eyes: ['variant01', 'variant05'],
    mouth: ['variant10'],
    glasses: ['variant02'],
    glassesProbability: 50,  // 50% chance of glasses
  ),
).build();
```

### PixelArt with Customization

```dart
final avatar = DiceBearBuilder(
  seed: 'pixel_user',
  sprite: DiceBearSprite.pixelArt,
  styleOptions: DiceBearPixelArtOptions(
    accessories: ['variant01', 'variant02'],
    beard: ['variant03'],
    clothingColor: ['ff5733', 'fbf5e6'],
    eyesColor: ['647b90'],
  ),
).build();
```

### Common Customization Parameters

| Parameter | Type | Example | Notes |
|-----------|------|---------|-------|
| `backgroundColor` | `Color?` | `Color(0xFF3ECAF5)` | Applied to SVG background |
| `radius` | `int` | `10` | Border radius (0-20) |
| `scale` | `int` | `100` | Scale factor (0-200) |
| `rotate` | `int` | `45` | Rotation in degrees (0-360) |
| `flip` | `bool` | `true` | Flip horizontally |
| `translateX`, `translateY` | `int` | `10`, `-5` | Translation offsets (-100 to 100) |
| `size` | `int` | `256` | SVG size in pixels |

## Available Styles

### Character-Based Styles (with eyes & mouth customization)
- **Adventurer** / **Adventurer Neutral** — D&D-inspired characters
- **Avataaars** / **Avataaars Neutral** — Cartoonish avatars
- **Big Ears** / **Big Ears Neutral** — Quirky big-eared characters
- **Big Smile** — Always happy expressions
- **Bottts** / **Bottts Neutral** — Robot-like avatars
- **Croodles** / **Croodles Neutral** — Minimalist faces
- **Fun Emoji** — Expressive emoji style
- **Lorelei** / **Lorelei Neutral** — Artistic character design
- **Micah** — Stylized character portraits
- **Miniavs** — Tiny avatar style
- **Personas** — Professional-looking character avatars
- **Pixel Art** / **Pixel Art Neutral** — 8-bit style avatars
- **Thumbs** — Thumbs-up styled avatars
- **Toon Head** — Cartoon character avatars

### Geometric & Abstract Styles
- **Dylan** — Gradient-based geometric design
- **Glass** — Glassy geometric patterns
- **Icons** — Icon-based avatars
- **Identicon** — Hash-based geometric avatars
- **Initials** — Two-letter initials display
- **Notionists** / **Notionists Neutral** — Notion-inspired design
- **Open Peeps** — Open-source character art
- **Rings** — Concentric ring patterns
- **Shapes** — Geometric shape arrangements

## Widget Parameters

When calling `.toImage()`, you can pass additional Flutter parameters:

```dart
widget = avatar.toImage(
  width: 200,
  height: 200,
  fit: BoxFit.contain,
  alignment: Alignment.center,
  placeholderBuilder: (context) => CircularProgressIndicator(),
  semanticsLabel: 'User avatar for John Doe',
);
```

| Parameter | Type | Default |
|-----------|------|---------|
| `width` | `double?` | — |
| `height` | `double?` | — |
| `fit` | `BoxFit` | `BoxFit.contain` |
| `alignment` | `Alignment` | `Alignment.center` |
| `placeholderBuilder` | `WidgetBuilder?` | — |
| `color` | `Color?` | — |
| `semanticsLabel` | `String?` | — |
| `clipBehavior` | `Clip` | `Clip.hardEdge` |
| `theme` | `SvgTheme?` | — |

## Architecture

The library maintains a clean, semantically organized structure:

```
lib/
├── dice_bear.dart (main entry point)
└── src/
    └── style_options/
        ├── character_style_options.dart (abstract base)
        ├── adventurer_options.dart
        ├── avataaars_options.dart
        ├── big_ears_options.dart
        ├── big_smile_options.dart
        ├── bottts_options.dart
        ├── pixel_art_options.dart
        ├── persons_options.dart
        ├── rings_options.dart
        ├── shapes_options.dart
        └── ... (30 style option classes total)
```

### Design Pattern

- **Abstract Base Class**: `DiceBearCharacterStyleOptions` for humanoid styles with `eyes` and `mouth` fields
- **Standalone Implementations**: Geometric and abstract styles directly implement `DiceBearStyleOptions`
- **Validation**: Each style class validates its options before sending to the API
- **Composability**: Mix and match styles with global and style-specific options

## Minimum SDK

Requires Dart SDK **>= 2.17.0** (supports super parameters syntax for cleaner inheritance)

## Examples

### Profile Picture Builder

```dart
class UserAvatar extends StatelessWidget {
  final String userId;
  final double size;
  
  const UserAvatar({
    required this.userId,
    this.size = 100,
  });
  
  @override
  Widget build(BuildContext context) {
    final avatar = DiceBearBuilder(
      seed: userId,
      sprite: DiceBearSprite.avataaars,
      backgroundColor: Colors.blue.shade100,
    ).build();
    
    return avatar.toImage(width: size, height: size);
  }
}
```

### Random Avatar Gallery

```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    final avatar = DiceBearBuilder.withRandomSeed().build();
    return avatar.toImage(width: 100, height: 100);
  },
)
```

## Testing

The package includes comprehensive unit tests covering all style options and API interactions.

```bash
flutter test
```

## License

This package is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please feel free to submit a pull request to [the repository](https://github.com/ZaifSenpai/dice_bear).

## Support

Found an issue? Have a feature request? Open an issue on [GitHub](https://github.com/ZaifSenpai/dice_bear/issues).
