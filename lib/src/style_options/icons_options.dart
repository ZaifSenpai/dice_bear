part of '../../dice_bear.dart';

class DiceBearIconsOptions implements DiceBearStyleOptions {
  final List<String>? icon;

  const DiceBearIconsOptions({this.icon});

  @override
  Map<String, String> toQueryParameters() => _serializeMap({'icon': icon});
}
