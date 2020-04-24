# Numerus

Dart extensions for translating decimal numbers to Roman numerals and vice versa.

Negative numbers and numbers greater than 65535 are not supported. Functions will return null in place of generating nonsense,

## Examples

```dart
import 'package:numerus/numerus.dart';

main() {
  var n = 418;
  print(n.toRomanNumeralString());
  // 'CDXVIII'

  var str = 'CDXVIII';
  print(str.isValidRomanNumeral());
  // true
  print(str.toRomanNumeralValue());
  // 418  
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme