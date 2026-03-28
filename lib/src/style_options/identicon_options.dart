part of '../../dice_bear.dart';

class DiceBearIdenticonOptions implements DiceBearStyleOptions {
  final List<String>? row1;
  final List<String>? row2;
  final List<String>? row3;
  final List<String>? row4;
  final List<String>? row5;
  final List<String>? rowColor;

  const DiceBearIdenticonOptions({
    this.row1,
    this.row2,
    this.row3,
    this.row4,
    this.row5,
    this.rowColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    const rowAllowed = {
      'ooxoo',
      'oxoxo',
      'oxxxo',
      'xooox',
      'xoxox',
      'xxoxx',
      'xxxxx',
    };

    _validateStringArray(name: 'row1', values: row1);
    _validateAllowedValues(name: 'row1', values: row1, allowed: rowAllowed);
    _validateStringArray(name: 'row2', values: row2);
    _validateAllowedValues(name: 'row2', values: row2, allowed: rowAllowed);
    _validateStringArray(name: 'row3', values: row3);
    _validateAllowedValues(name: 'row3', values: row3, allowed: rowAllowed);
    _validateStringArray(name: 'row4', values: row4);
    _validateAllowedValues(name: 'row4', values: row4, allowed: rowAllowed);
    _validateStringArray(name: 'row5', values: row5);
    _validateAllowedValues(name: 'row5', values: row5, allowed: rowAllowed);
    _validateAllowedValues(
      name: 'rowColor',
      values: rowColor,
      allowed: const {
        '00897b',
        '00acc1',
        '039be5',
        '1e88e5',
        '3949ab',
        '43a047',
        '546e7a',
        '5e35b1',
        '6d4c41',
        '757575',
        '7cb342',
        '8e24aa',
        'c0ca33',
        'd81b60',
        'e53935',
        'f4511e',
        'fb8c00',
        'fdd835',
        'ffb300',
      },
    );

    return _serializeMap({
      'row1': row1,
      'row2': row2,
      'row3': row3,
      'row4': row4,
      'row5': row5,
      'rowColor': rowColor,
    });
  }
}
