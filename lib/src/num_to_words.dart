import 'dart:math';

final List<String> _units = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen'
];

final List<String> _tens = [
  '',
  'ten',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety'
];

final List<String> _thousandPowers = [
  '',
  'thousand',
  'million',
  'billion',
  'trillion',
  'quadrillion',
  'quintillion',
  'sextillion',
  'septillion'
];

final Map<num, String> _ordinalExceptions = {
  1: 'first',
  2: 'second',
  3: 'third',
  5: 'fifth',
  8: 'eighth',
  9: 'ninth',
  12: 'twelfth'
};

num _collectParts(num n, int d, String s, List<String> parts) {
  if (n < d) return n;

  _collectPartsUnderAThousand(n ~/ d, parts);
  parts.add(s);

  return n % d;
}

void _collectPartsUnderAThousand(num n, List<String> parts, [bool addAnd = false, bool isOrdinal = false]) {
  if (n >= 100) {
    parts.add(_units[n ~/ 100]);
    parts.add('hundred');
    n %= 100;
    addAnd |= n > 0;
  }
  if (addAnd && n > 0) parts.add('and');
  if (n >= 20) {
    parts.add(_tens[n ~/ 10]);
    n %= 10;
  }

  if (n > 0) {
    if (isOrdinal) {
      parts.add(_ordinalExceptions[n] ?? ('${_units[n as int]}th'));
    } else {
      parts.add(_units[n as int]);
    }
  } else if (isOrdinal) {
    parts.add('${parts.removeLast().replaceAll(RegExp(r'y$'), 'ie')}th');
  }
}

extension IntToWords on int {
  String toWords() => _toWords(false);

  String toWordsOrdinal() => _toWords(true);

  String _toWords(bool isOrdinal) {
    if (this == 0) return isOrdinal ? 'zeroth' : 'zero';

    var n = isNegative ? -this : this;
    final parts = <String>[];
    for (var i = 7; i > 0; i--) {
      n = _collectParts(n, pow(1000, i) as int, _thousandPowers[i], parts) as int;
    }
    _collectPartsUnderAThousand(n, parts, parts.isNotEmpty, isOrdinal);
    if (isNegative) {
      parts.insert(0, 'minus');
    }
    return parts.join(' ');
  }
}
