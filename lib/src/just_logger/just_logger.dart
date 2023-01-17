enum LogFontColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  none,
}

extension LogFontColorExtension on LogFontColor {
  String toColorString() {
    String result = '\x1B[';

    switch (this) {
      case LogFontColor.black:
        result += '30m';
        break;
      case LogFontColor.red:
        result += '31m';
        break;
      case LogFontColor.green:
        result += '32m';
        break;
      case LogFontColor.yellow:
        result += '33m';
        break;
      case LogFontColor.blue:
        result += '34m';
        break;
      case LogFontColor.magenta:
        result += '35m';
        break;
      case LogFontColor.cyan:
        result += '36m';
        break;
      case LogFontColor.white:
        result += '37m';
        break;
      case LogFontColor.none:
        result += '39m';
        break;
    }

    return result;
  }
}

enum LogBackgroundColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  none,
}

extension LogBackgroundColorExtension on LogBackgroundColor {
  String toColorString() {
    String result = '\x1B[';

    switch (this) {
      case LogBackgroundColor.black:
        result += '40m';
        break;
      case LogBackgroundColor.red:
        result += '41m';
        break;
      case LogBackgroundColor.green:
        result += '42m';
        break;
      case LogBackgroundColor.yellow:
        result += '43m';
        break;
      case LogBackgroundColor.blue:
        result += '44m';
        break;
      case LogBackgroundColor.magenta:
        result += '45m';
        break;
      case LogBackgroundColor.cyan:
        result += '46m';
        break;
      case LogBackgroundColor.white:
        result += '47m';
        break;
      case LogBackgroundColor.none:
        result += '49m';
        break;
    }

    return result;
  }
}

void justLog(String msg, {LogFontColor? fontColor, LogBackgroundColor? backgroundColor}) {
  String finalFontColor = fontColor == null ? '' : fontColor.toColorString();
  String finalBackground = backgroundColor == null ? '' : backgroundColor.toColorString();

  print('$finalFontColor$finalBackground$msg\x1B[0m');
}

class Logger {}
