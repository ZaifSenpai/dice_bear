<h1 align="center"><img src="https://api.dicebear.com/5.x/big-smile/svg?seed=flutter&backgroundColor=%233ECAF5&radius=6&scale=90" width="124" /> <br />dice_bear<br />Flutter Package</h1>

DiceBear API wrapper. DiceBear is an avatar library for designers and developers. Generate random
avatar profile pictures!

[![GitHub stars](https://img.shields.io/github/stars/ZaifSenpai/dice_bear)](https://github.com/ZaifSenpai/dice_bear) [![pub package](https://img.shields.io/pub/v/dice_bear)](https://pub.dev/packages/dice_bear)

* Checkout [DiceBear](https://github.com/dicebear/dicebear)
* Checkout all avatar styles and licenses [here](https://avatars.dicebear.com/styles).

## Usage

* [Import dice_bear](#import-dicebear)
* [Create Avatar object](#create-avatar-object)
* [Get Uri of generated avatar SVG](#get-uri-of-generated-avatar-svg)
* [Get a Widget using Avatar](#get-a-widget-using-avatar)
* [Get raw SVG bytes data](#get-raw-svg-bytes-data)
* [DiceBearBuilder() Parameters](#dicebearbuilder-parameters)
* [DiceBearSprite enum](#dicebearsprite-enum)
* [avatar.toImage() Parameters](#avatartoimage-parameters)

### Import dice_bear

```dart
import 'package:dice_bear/dice_bear.dart';
```

### Create Avatar object

```dart
Avatar _avatar = DiceBearBuilder(
  seed: 'your-seed',               // Default seed is an empty string if you don't set it
).build();
```

Or generate random ```Avatar``` everytime:

```dart
Avatar _avatar = DiceBearBuilder.withRandomSeed().build();
```

See below for available [DiceBearBuilder() Parameters](#dicebearbuilder-parameters)

### Get Uri of generated avatar SVG

```dart
Uri uri = _avatar.svgUri;
```
This Uri is a URL of _api.dicebear.com_ which returns raw SVG data.

### Get a Widget using Avatar
```dart
Widget image = _avatar.toImage();
```

See below for available toImage() parameters.

### Get raw SVG bytes data

```dart
Uint8List? raw = await _avatar.asRawSvgBytes();
```

### DiceBearBuilder() Parameters
These options effect the SVG. They does not effect the widget created by ```avatar.toImage()```. See [avatar.toImage() Parameters](#avatartoimage-parameters) below.

| Parameter | Details | Default Value | Range | Comment |
| --------- | ------- | ------------- | ----- | ------- |
| ```DiceBearSprite? sprite``` | Design of avatar to show | ```DiceBearSprite.any``` | | [See all styles](https://avatars.dicebear.com/styles) |
| ```String? seed``` | Seed for the avatar | ```''``` | | You can use UID of user to generate a personal avatar of that user. |
| ```Color? backgroundColor``` | Background color | No Color (May or may not be transparent, depending on selected sprite) | | Opacity/Alpha does not effect the background color. |
| ```int radius``` | Radius | ```0``` | min: 0<br />max: 20 | |
| ```int size``` | Size of SVG | | min: 1 | This does not define the size of widget. |
| ```int scale``` | Scale avatar inside SVG container | ```100``` | min: 0<br />max: 200 | |
| ```bool flip``` | Flip avatar horizontally | ```false``` | | |
| ```int rotate``` | Number if degrees to rotate image clockwise | ```0``` | min: 0<br />max: 360 | |
| ```int translateX``` | Translate avatar SVG along X-axis | ```0``` | min: -100<br />max: 100 | |
| ```int translateY``` | Translate avatar SVG along Y-axis | ```0``` | min: -100<br />max: 100 | |

### DiceBearSprite enum

| Sprite | Example | Comment |
| ------ | ------- | ------- |
| ```DiceBearSprite.any``` | | Sets a random sprite |
| ```DiceBearSprite.adventurer``` | <a href="https://api.dicebear.com/5.x/adventurer/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/adventurer/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.adventurerNeutral``` | <a href="https://api.dicebear.com/5.x/adventurer-neutral/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/adventurer-neutral/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.avataaars``` | <a href="https://api.dicebear.com/5.x/avataaars/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/avataaars/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.bigEars``` | <a href="https://api.dicebear.com/5.x/big-ears/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/big-ears/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.bigEarsNeutral``` | <a href="https://api.dicebear.com/5.x/big-ears-neutral/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/big-ears-neutral/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.bigSmile``` | <a href="https://api.dicebear.com/5.x/big-smile/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/big-smile/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.bottts``` | <a href="https://api.dicebear.com/5.x/bottts/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/bottts/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.croodles``` | <a href="https://api.dicebear.com/5.x/croodles/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/croodles/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.croodlesNeutral``` | <a href="https://api.dicebear.com/5.x/croodles-neutral/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/croodles-neutral/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.identicon``` | <a href="https://api.dicebear.com/5.x/identicon/svg?seed=aa&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/identicon/svg?seed=aa&scale=90" width="124"/></a> | |
| ```DiceBearSprite.initials``` | <a href="https://api.dicebear.com/5.x/initials/svg?seed=ab&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/initials/svg?seed=ab&scale=90" width="124"/></a> | Deprecated because ```avatar.toImage()```<br />throws an exception on this sprite |
| ```DiceBearSprite.micah``` | <a href="https://api.dicebear.com/5.x/micah/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/micah/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.miniavs``` | <a href="https://api.dicebear.com/5.x/miniavs/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/miniavs/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.openPeeps``` | <a href="https://api.dicebear.com/5.x/open-peeps/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/open-peeps/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.personas``` | <a href="https://api.dicebear.com/5.x/personas/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/personas/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.pixelArt``` | <a href="https://api.dicebear.com/5.x/pixel-art/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/pixel-art/svg?seed=a&scale=90" width="124"/></a> | |
| ```DiceBearSprite.pixelArtNeutral``` | <a href="https://api.dicebear.com/5.x/pixel-art-neutral/svg?seed=a&scale=90" target="_blank"><img src="https://api.dicebear.com/5.x/pixel-art-neutral/svg?seed=a&scale=90" width="124"/></a> | |
### avatar.toImage() Parameters
| Parameter | Default Value |
| --------- | ------------- |
| ```Key? key``` | |
| ```double? width``` | |
| ```double? height``` | |
| ```BoxFit fit``` | ```BoxFit.contain``` |
| ```Alignment alignment``` | ```Alignment.center``` |
| ```bool matchTextDirection``` | ```false``` |
| ```bool allowDrawingOutsideViewBox``` | ```false``` |
| ```WidgetBuilder? placeholderBuilder``` | |
| ```Color? color``` | |
| ```BlendMode colorBlendMode``` | ```BlendMode.srcIn``` |
| ```String? semanticsLabel``` | |
| ```bool excludeFromSemantics``` | ```false``` |
| ```Clip clipBehavior``` | ```Clip.hardEdge``` |
| ```bool cacheColorFilter``` | ```false``` |
| ```SvgTheme? theme``` | |
