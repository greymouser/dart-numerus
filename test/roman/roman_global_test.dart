import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals - global tests', () {
    test('check default config', () {
      expect(
          RomanNumeralsConfig().configType == RomanNumeralsType.common, true);
    });

    group('string validator', () {
      test('unit valid', () {
        var str = 'V';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('One - with config', () {
        var n = 1;
        var got =
            n.isValidRomanNumeralValue(config: VinculumRomanNumeralsConfig());
        expect(got, true);
      });

      test('One - force no config to common style', () {
        var n = 1;
        var got = n.isValidRomanNumeralValue(config: null);
        expect(got, true);
      });

      test('invalid, too many C\'s', () {
        var str = 'MCCCC';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('invalid, bad order', () {
        var str = 'DCXXL';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('valid roman numeral, different letter cases', () {
        var str = 'LvIiI';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('invalid, too many C\'s', () {
        var str = 'MCCCC';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('invalid, bad order', () {
        var str = 'DCXXL';
        expect(str.isValidRomanNumeralValue(), false);
      });
    });

    group('int to String', () {
      test('negative number not supported', () {
        var n = -1;
        var got = n.toRomanNumeralString();
        expect(got, null);
      });

      test('One - with config', () {
        var n = 1;
        var got = n.toRomanNumeralString(config: VinculumRomanNumeralsConfig());
        expect(got, 'I');
      });
    });

    group('String to int', () {
      test('negative number not supported', () {
        var n = -1;
        var got = n.toRomanNumeralString();
        expect(got, null);
      });

      test('zero', () {
        var str = 'N';
        expect(str.toRomanNumeralValue(), null);
      });

      test('five', () {
        var str = 'V';
        expect(str.toRomanNumeralValue(), 5);
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
  });
}
