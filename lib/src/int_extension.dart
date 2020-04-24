final _romanNumbersToLetters = {
  1: 'I',
  4: 'IV',
  5: 'V',
  9: 'IX',
  10: 'X',
  40: 'XL',
  50: 'L',
  90: 'XC',
  100: 'C',
  400: 'CD',
  500: 'D',
  900: 'CM',
  1000: 'M'
};

extension RomanNumeralsInt on int {
  String toRomanNumeralString() {
    // self-imposed maxium value. We don't need >64k worth of M's.
    if (this < 0 || this > 65535) {
      return null;
    }

    // Handle zero with a special case
    if (this == 0) {
      return 'N';
    }

    final nRevMap = _romanNumbersToLetters.keys.toList();
    nRevMap.sort((a, b) => b.compareTo(a));
    var curString = '';
    var accum = this;
    var nIndex = 0;
    while (accum > 0) {
      var divisor = nRevMap[nIndex];
      var units = accum ~/ divisor;

      /**
       - When we have any amount of quotient > 0, add the current numeral to the return-string,
          subtract the amount from the accumulator, and continue.
       - When the quotient is zero, then increment the index of the number-value array to the next number.
       */
      if (units > 0) {
        var got = _romanNumbersToLetters[divisor];
        if (got != null) {
          curString += got;
          accum -= divisor;
        }
      } else {
        nIndex += 1;
      }
    }
    return curString;
  }
}
