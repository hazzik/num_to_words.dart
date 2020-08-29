import 'dart:ffi';
import 'dart:math';

final List<String> _units = [
  '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
];

final List<String> _tens = [
  '', 'ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
];

final List<String> _thousandPowers = [
  '', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion'
];

num _collectParts(num n,int d, String s, List<String> parts) {
  if (n < d) return n;

  _collectPartsUnderAThousand(n ~/ d, parts);
  parts.add(s);

  return n % d;
}

void _collectPartsUnderAThousand(num n,List<String> parts, [bool addAnd = false]) {
  if (n >= 100) {
    parts.add(_units[n ~/ 100]);
    parts.add('hundred');
    n %= 100;
    addAnd |= n > 0;
  }
  if (addAnd) parts.add('and');
  
  if (n >= 20) {
    parts.add(_tens[n ~/ 10]);
    n %= 10;
  }
  
  if (n > 0) {
    parts.add(_units[n]);
  }
}

extension NumberToWords on num {
  String toWords() {
    if (this == 0) return 'zero';

    var n = isNegative ? -this : this;
    final parts = <String>[];
    for (var i = 7; i > 0; i--) {
      n = _collectParts(n, pow(1000, i), _thousandPowers[i], parts);
    }
    _collectPartsUnderAThousand(n, parts, parts.isNotEmpty);
    if (isNegative) {
      parts.insert(0, 'minus');
    }
    return parts.join(' ');
  }
}