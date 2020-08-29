
import 'package:num_to_words/num_to_words.dart';
import 'package:test/test.dart';

void main() {
  group('english', () {
    test('1', () {
      expect(1.toWords(), 'one');
    }); 
    test('0', () {
      expect(0.toWords(), 'zero');
    }); 
    test('10', () {
      expect(10.toWords(), 'ten');
    });
    test('12', () {
      expect(12.toWords(), 'twelve');
    });
    test('20', () {
      expect(20.toWords(), 'twenty');
    });
    test('21', () {
      expect(21.toWords(), 'twenty one');
    });
    test('100', () {
      expect(100.toWords(), 'one hundred');
    });
    test('123', () {
      expect(123.toWords(), 'one hundred and twenty three');
    });
    test('1000', () {
      expect(1000.toWords(), 'one thousand');
    });
    test('1001', () {
      expect(1001.toWords(), 'one thousand and one');
    });
    test('1234', () {
      expect(1234.toWords(), 'one thousand two hundred and thirty four');
    });
    test('12345', () {
      expect(12345.toWords(), 'twelve thousand three hundred and forty five');
    });
    test('1000001', () {
      expect(1000001.toWords(), 'one million and one');
    });
    test('1001001', () {
      expect(1001001.toWords(), 'one million one thousand and one');
    });
    test('-1000001', () {
      expect((-10000010).toWords(), 'minus ten million and ten');
    });
  });

  group('english ordinal', () {
    test('0', () {
      expect(0.toWordsOrdinal(), 'zeroth');
    }); 
    test('1', () {
      expect(1.toWordsOrdinal(), 'first');
    }); 
    test('2', () {
      expect(2.toWordsOrdinal(), 'second');
    }); 
    test('3', () {
      expect(3.toWordsOrdinal(), 'third');
    }); 
    test('10', () {
      expect(10.toWordsOrdinal(), 'tenth');
    });
    test('12', () {
      expect(12.toWordsOrdinal(), 'twelfth');
    });
    test('20', () {
      expect(20.toWordsOrdinal(), 'twentieth');
    });
    test('21', () {
      expect(21.toWordsOrdinal(), 'twenty first');
    });
    test('100', () {
      expect(100.toWordsOrdinal(), 'one hundredth');
    });
    test('123', () {
      expect(123.toWordsOrdinal(), 'one hundred and twenty third');
    });
    test('1000', () {
      expect(1000.toWordsOrdinal(), 'one thousandth');
    });
    test('1001', () {
      expect(1001.toWordsOrdinal(), 'one thousand and first');
    });
    test('1234', () {
      expect(1234.toWordsOrdinal(), 'one thousand two hundred and thirty fourth');
    });
    test('12345', () {
      expect(12345.toWordsOrdinal(), 'twelve thousand three hundred and forty fifth');
    });
    test('1000001', () {
      expect(1000001.toWordsOrdinal(), 'one million and first');
    });
    
    test('-1000001', () {
      expect((-10000010).toWordsOrdinal(), 'minus ten million and tenth');
    });
  });
}
