import 'package:numerus/numerus.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals - apostrophus config tests', () {
    setUpAll(() {
      RomanNumerals.romanNumeralsConfig = ApostrophusRomanNumeralsConfig();
    });

    group('string validator', () {
      test('one million', () {
        var str = 'CCCCIↃↃↃↃ';
        expect(str.isValidRomanNumeralValue(), true);
      });

      test('bad millions', () {
        var str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃCCCCIↃↃↃↃCCCCIↃↃↃↃ';
        expect(str.isValidRomanNumeralValue(), false);
      });

      test('string of max number', () {
        var str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃCCCCIↃↃↃↃ'
            'CCCIↃↃↃCCCCIↃↃↃↃ'
            'CCIↃↃCCCIↃↃↃ'
            'CIↃCCIↃↃ'
            'CCIↃ'
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
                config: ApostrophusRomanNumeralsConfig(nulla: 'B')),
            'B');
      });

      test('number to unit', () {
        var n = 90000;
        expect(n.toRomanNumeralString(), 'CCIↃↃCCCIↃↃↃ');
      });

      test('number to max', () {
        var n = 3999999;
        var got = n.toRomanNumeralString();
        expect(
            got,
            'CCCCIↃↃↃↃCCCCIↃↃↃↃCCCCIↃↃↃↃ'
            'CCCIↃↃↃCCCCIↃↃↃↃ'
            'CCIↃↃCCCIↃↃↃ'
            'CIↃCCIↃↃ'
            'CCIↃ'
            'XC'
            'IX');
      });

      test('number to greater than max', () {
        var n = 4000000;
        var got = n.toRomanNumeralString();
        expect(got, null);
      });

      test('number mix/various', () {
        var n = 1255416;
        expect(
            n.toRomanNumeralString(),
            'CCCCIↃↃↃↃ'
            'CCCIↃↃↃCCCIↃↃↃ'
            'IↃↃↃ'
            'IↃↃ'
            'CCCC'
            'XVI');
      });

      test('2449671', () {
        var n = 2449671;
        expect(
            n.toRomanNumeralString(),
            'CCCCIↃↃↃↃCCCCIↃↃↃↃ' // 2m
            'CCCIↃↃↃIↃↃↃↃ' // 400k
            'CCIↃↃIↃↃↃ' // 40k
            'CIↃCCIↃↃ' // 9k
            'IↃ' // 500
            'C' // 100
            'L' // 50
            'XXI'); // 21
      });

      test('all', () {
        for (var n = 1; n < 4000000; n += 1) {
          expect(n.toRomanNumeralString() != null, true);
        }
      }, tags: 'prerelease');
    });

    group('String to int', () {
      test('1000000', () {
        var str = 'CCCCIↃↃↃↃ';
        expect(str.toRomanNumeralValue(), 1000000);
      });

      test('2 684 414', () {
        var str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃ'
            'IↃↃↃↃCCCIↃↃↃ'
            'IↃↃↃCCIↃↃCCIↃↃCCIↃↃ'
            'CIↃIↃↃ'
            'CCCC'
            'XIV';
        expect(str.toRomanNumeralValue(), 2684414);
      });

      test('max 3999999', () {
        var str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃCCCCIↃↃↃↃ'
            'CCCIↃↃↃCCCCIↃↃↃↃ'
            'CCIↃↃCCCIↃↃↃ'
            'CIↃCCIↃↃ'
            'CCIↃ'
            'XC'
            'IX';
        expect(str.toRomanNumeralValue(), 3999999);
      });

      test('2449671', () {
        var str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃ'
            'CCCIↃↃↃIↃↃↃↃ'
            'CCIↃↃIↃↃↃ'
            'CIↃCCIↃↃ'
            'IↃ'
            'CLXXI';
        expect(str.toRomanNumeralValue(), 2449671);
      });
    });
  });
}
