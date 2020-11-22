final _romanLettersToNumbers = {
  'N': 0,
  'I': 1,
  'V': 5,
  'X': 10,
  'L': 50,
  'C': 100,
  'D': 500,
  'M': 1000
};

extension RomanNumeralsString on String {
  bool isValidRomanNumeral() {
    /*
       Match expression reads as:
       - ^                # From the beginnging of the line.
       - (M{0,65})        # There are 65 maximum 'M' matches under our support using uint16_t as the primitive container.
       - (CM|CD|D?C{0,3}) # Then, match for 900/CM, 400/CD, or 0 to 3 100/C's following 0 or some 500/D's.
       - (XC|XL|L?X{0,3}) # Then, match for 90/XC,  40/XL,  or 0 to 3 10/X's  following 0 or some 50/L's.
       - (IX|IV|V?I{0,3}) # Then, match for 9/IX,   4/IV,   or 0 to 3 1/X's   following 0 or some 5/V's.
       - $                # To the end of the line.
     
       The options provide for case-insensitive matching.
       */
    final exp = RegExp(
        r'^(M{0,65})(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$',
        caseSensitive: false);
    final matches = exp.allMatches(this);
    return matches.length == 1;
  }

  int? toRomanNumeralValue() {
    // Guard against malformed string sequences, and return early if the string itself is invalid
    if (!isValidRomanNumeral()) {
      return null;
    }

    /*
     Since we used the internal validator, we can now naively (i.e. simply and readably) parse the
     Roman numeral string, since we know that it is in a valid form.
     */
    final str =
        toUpperCase(); // we don't care about case, so normalize to upper-case
    var accum = 0;
    var curMax = 0;
    var curVal = 0;
    var failed = false;
    str.split('').reversed.forEach((c) {
      var got = _romanLettersToNumbers[c];
      if (got == null) {
        failed = true;
      } else {
        curVal = got;
        if (curVal >= curMax) {
          accum += curVal;
          curMax = curVal;
        } else {
          accum -= curVal;
        }
      }
    });
    if (failed) {
      return null;
    }
    return accum;
  }
}
