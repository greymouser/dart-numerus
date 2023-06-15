import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals - Vinculum config tests', () {
    setUpAll(() {
      RomanNumerals.romanNumeralsConfig = VinculumRomanNumeralsConfig();
    });

    group('string validator', () {
      test('one million', () {
        var str = 'M\u{0305}';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('one million string literal', () {
        var str = 'M̅';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('bad millions', () {
        var str = 'M̅M̅M̅M̅';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('a mix', () {
        var str = 'M̅M̅D̅C\u{0305}L̅X̅X̅X̅V̅';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('string of max number', () {
        var str = 'M̅M̅M̅C̅M̅X̅C̅MX̅CMXCIX';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('longest roman numeral of max number', () {
        var str = 'M̅M̅M̅D̅C̅C̅C̅L̅X̅X̅X̅V̅MMMDCCCLXXXVIII';
        expect(str.isValidRomanNumeralValue(), true);
      });
    });

    group('int to String', () {
      test('number to zero; zero, no nulla', () {
        var n = 0;
        expect(n.toRomanNumeralString(), null);
      });

      test('number to zero; specify nulla', () {
        var n = 0;
        expect(
            n.toRomanNumeralString(
                config: VinculumRomanNumeralsConfig(nulla: 'B')),
            'B');
      });

      test('number to unit', () {
        var n = 90000;
        expect(n.toRomanNumeralString(), 'X̅C̅');
      });

      test('number to max', () {
        var n = 3999999;
        var got = n.toRomanNumeralString(config: VinculumRomanNumeralsConfig());
        expect(got, 'M̅M̅M̅C̅M̅X̅C̅MX̅CMXCIX');
      });

      test('number to greater than max', () {
        var n = 4000000;
        var got = n.toRomanNumeralString(config: VinculumRomanNumeralsConfig());
        expect(got, null);
      });

      test('number mix/various', () {
        var n = 1255416;
        expect(n.toRomanNumeralString(), 'M̅C̅C̅L̅V̅CDXVI');
      });

      test('all', () {
        for (var n = 1; n < 4000000; n += 1) {
          expect(n.toRomanNumeralString() != null, true);
        }
      }, tags: 'prerelease');
    });

    group('String to int', () {
      test('1000000', () {
        var str = 'M\u{0305}';
        expect(str.toRomanNumeralValue(), 1000000);
      });
      test('2684416', () {
        var str = 'M̅D̅C̅C̅L̅X̅X̅X̅MV̅CDXVI';
        expect(str.toRomanNumeralValue(), 1784416);
      });
      test('max 3999999', () {
        var str = 'M̅M̅M̅C̅M̅X̅C̅MX̅CMXCIX';
        expect(str.toRomanNumeralValue(), 3999999);
      });
    });
  });
}
