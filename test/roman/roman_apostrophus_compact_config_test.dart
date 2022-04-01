import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals - apostrophus compact config tests', () {
    setUpAll(() {
      RomanNumerals.romanNumeralsConfig =
          CompactApostrophusRomanNumeralsConfig();
    });

    group('string validator', () {
      test('one hundred thousand', () {
        var str = 'ↈ';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('bad hundred thousands', () {
        var str = 'ↈↈↈↈ';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('string of max number', () {
        var str = 'ↈↈↈ'
            'ↂↈ'
            'ↀↂ'
            'Cↀ'
            'XC'
            'IX';
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
                config: CompactApostrophusRomanNumeralsConfig(nulla: 'B')),
            'B');
      });

      test('number to unit', () {
        var n = 90000;
        expect(n.toRomanNumeralString(), 'ↂↈ');
      });

      test('number to max', () {
        var n = 399999;
        var got = n.toRomanNumeralString();
        expect(
            got,
            'ↈↈↈ'
            'ↂↈ'
            'ↀↂ'
            'Cↀ'
            'XC'
            'IX');
      });

      test('number to greater than max', () {
        var n = 400000;
        var got = n.toRomanNumeralString();
        expect(got, null);
      });

      test('number mix/various', () {
        var n = 125416;
        expect(
            n.toRomanNumeralString(),
            'ↈ'
            'ↂↂ'
            'ↁ'
            'CCCC'
            'XVI');
      });

      test('347449', () {
        var n = 347449;
        expect(
            n.toRomanNumeralString(),
            'ↈↈↈ'
            'ↂↇ'
            'ↁↀↀ'
            'CCCC'
            'XLIX');
      });

      test('all', () {
        for (var n = 1; n < 400000; n += 1) {
          expect(n.toRomanNumeralString() != null, true);
        }
      }, skip: 'Do not run every time.');
    });

    group('String to int', () {
      test('100000', () {
        var str = 'ↈ';
        expect(str.toRomanNumeralValue(), 100000);
      });

      test('268 416', () {
        var str = 'ↈↈ'
            'ↇↂ'
            'ↁↀↀↀ'
            'CCCC'
            'XVI';
        expect(str.toRomanNumeralValue(), 268416);
      });

      test('max 399999', () {
        var str = 'ↈↈↈ'
            'ↂↈ'
            'ↀↂ'
            'Cↀ'
            'XC'
            'IX';
        expect(str.toRomanNumeralValue(), 399999);
      });
    });
  });
}
