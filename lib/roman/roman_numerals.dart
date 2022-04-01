import 'roman_config.dart';

/// The [RomanNumerals] class is used solely to store the default
/// Roman numerals configuration, [RomansNumeralsConfig.common]. You
/// can change this early in runtime so that you don't have to keep
/// passing the config to every method call. See [RomansNumeralsConfig].
class RomanNumerals {
  static RomanNumeralsConfig romanNumeralsConfig = CommonRomanNumeralsConfig();
}
