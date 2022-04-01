import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals - Common config tests', () {
    group('string validator', () {
      test('too big of a number string, invalid', () {
        var str = 'MMMMC';
        expect(str.isValidRomanNumeralValue(), false);
      });
    });

    group('int to String', () {
      test('number to zero; zero, no nulla', () {
        var n = 0;
        expect(
            n.toRomanNumeralString(config: CommonRomanNumeralsConfig()), null);
      });

      test('number to zero; specify nulla', () {
        var n = 0;
        expect(
            n.toRomanNumeralString(
                config: CommonRomanNumeralsConfig(nulla: '0')),
            '0');
      });

      test('number to unit', () {
        var n = 90;
        expect(n.toRomanNumeralString(), 'XC');
      });

      test('number to max', () {
        var n = 3999;
        var got = n.toRomanNumeralString();
        expect(got?.endsWith('MMMCMXCIX'), true);
      });

      test('number to greater than max', () {
        var n = 4000;
        var got = n.toRomanNumeralString();
        expect(got, null);
      });

      test('number mix/various', () {
        var n = 1416;
        expect(n.toRomanNumeralString(), 'MCDXVI');
      });

      test('number multiple thousands', () {
        var n = 3847;
        expect(n.toRomanNumeralString(), 'MMMDCCCXLVII');
      });

      test('all', () {
        for (var n = 1; n < 4000; n += 1) {
          print(n);
          expect(n.toRomanNumeralString() != null, true);
        }
      }, skip: 'Do not run every time.');
    });

    group('String to int', () {
      test('number to zero; zero, no nulla', () {
        // I mean, this is non-sensical, but validating it should fail makes sense.
        var str = '0';
        final config = CommonRomanNumeralsConfig(nulla: null);
        expect(str.toRomanNumeralValue(config: config), null);
      });

      test('number to zero; nulla set', () {
        var str = 'Q';
        var nulla = 'Q';
        final config = CommonRomanNumeralsConfig(nulla: nulla);
        expect(str.toRomanNumeralValue(config: config), 0);
      });

      test('number to zero; specify nulla', () {
        var n = 0;
        expect(
            n.toRomanNumeralString(
                config: CommonRomanNumeralsConfig(nulla: '0')),
            '0');
      });
      test('1948', () {
        var str = 'MCMXLVIII';
        expect(str.toRomanNumeralValue(), 1948);
      });
      test('max 3999', () {
        var str = 'MMMCMXCIX';
        expect(str.toRomanNumeralValue(), 3999);
      });
    });
  });
}
