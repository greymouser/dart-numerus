import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('int to Roman Numeral', () {
    test('number to zero', () {
      var n = 0;
      expect(n.toRomanNumeralString(), 'N');
    });

    test('number to zero; specify nulla', () {
      var n = 0;
      expect(n.toRomanNumeralString(nulla: '0'), '0');
    });

    test('number to zero; specify nulla - long string', () {
      var n = 0;
      expect(n.toRomanNumeralString(nulla: 'cat'), 'C');
    });

    test('number to unit', () {
      var n = 90;
      expect(n.toRomanNumeralString(), 'XC');
    });

    test('number to max unsigned long', () {
      var n = 65535;
      var got = n.toRomanNumeralString();
      expect(got?.length, 70); // the length of the insanely long string
      expect(got?[0], 'M');
      expect(got?.endsWith('MDXXXV'), true);
    });

    test('number to greater than max unsigned long', () {
      var n = 65536;
      var got = n.toRomanNumeralString();
      expect(got, null);
    });

    test('negative number not supported', () {
      var n = -1;
      var got = n.toRomanNumeralString();
      expect(got, null);
    });

    test('number mix/various', () {
      var n = 1416;
      expect(n.toRomanNumeralString(), 'MCDXVI');
    });

    test('number multiple thousands', () {
      var n = 4016;
      expect(n.toRomanNumeralString(), 'MMMMXVI');
    });
  });

  group('Roman Numeral validator', () {
    test('unit valid', () {
      var str = 'V';
      expect(str.isValidRomanNumeral(), true);
    });

    test('big string valid', () {
      var str = 'MMMMMMMMMMMMMMCMXLVIII';
      expect(str.isValidRomanNumeral(), true);
    });

    test('valid roman numeral, different letter cases', () {
      var str = 'LvIiI';
      expect(str.isValidRomanNumeral(), true);
    });

    test('invalid, too many C\'s', () {
      var str = 'MCCCC';
      expect(str.isValidRomanNumeral(), false);
    });

    test('invalid, bad order', () {
      var str = 'DCXXL';
      expect(str.isValidRomanNumeral(), false);
    });
  });

  group('Roman Numeral string to int', () {
    test('zero', () {
      var str = 'N';
      expect(str.toRomanNumeralValue(), null);
    });

    test('five', () {
      var str = 'V';
      expect(str.toRomanNumeralValue(), 5);
    });

    test('1948', () {
      var str = 'MCMXLVIII';
      expect(str.toRomanNumeralValue(), 1948);
    });

    test('max 65535', () {
      var str = 'M' * 65;
      str += 'DXXXV';
      expect(str.toRomanNumeralValue(), 65535);
    });

    test('case insensitive', () {
      var str = 'lvIiI';
      expect(str.toRomanNumeralValue(), 58);
    });

    test('invaid, not a number', () {
      var str = 'HELLO';
      expect(str.toRomanNumeralValue(), null);
    });

    test('invaid, format', () {
      var str = 'DCCCCIIIII';
      expect(str.toRomanNumeralValue(), null);
    });
  });
}
