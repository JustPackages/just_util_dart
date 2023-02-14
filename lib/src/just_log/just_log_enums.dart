part of just_util.just_log;

enum LogFontColor {
  // normal
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,

  // bright
  brightBlack,
  brightRed,
  brightGreen,
  brightYellow,
  brightBlue,
  brightMagenta,
  brightCyan,
  brightWhite,

  none,
}

extension LogFontColorExtension on LogFontColor {
  /// [LogFontColor] to ansi code
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
      case LogFontColor.brightBlack:
        result += '90m';
        break;
      case LogFontColor.brightRed:
        result += '91m';
        break;
      case LogFontColor.brightGreen:
        result += '92m';
        break;
      case LogFontColor.brightYellow:
        result += '93m';
        break;
      case LogFontColor.brightBlue:
        result += '94m';
        break;
      case LogFontColor.brightMagenta:
        result += '95m';
        break;
      case LogFontColor.brightCyan:
        result += '96m';
        break;
      case LogFontColor.brightWhite:
        result += '97m';
        break;
      case LogFontColor.none:
        result += '39m';
        break;
    }

    return result;
  }
}

enum LogBackgroundColor {
  // normal
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,

  // bright
  brightBlack,
  brightRed,
  brightGreen,
  brightYellow,
  brightBlue,
  brightMagenta,
  brightCyan,
  brightWhite,

  none,
}

extension LogBackgroundColorExtension on LogBackgroundColor {
  /// [LogBackgroundColor] to ansi code
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
      case LogBackgroundColor.brightBlack:
        result += '100m';
        break;
      case LogBackgroundColor.brightRed:
        result += '101m';
        break;
      case LogBackgroundColor.brightGreen:
        result += '102m';
        break;
      case LogBackgroundColor.brightYellow:
        result += '103m';
        break;
      case LogBackgroundColor.brightBlue:
        result += '104m';
        break;
      case LogBackgroundColor.brightMagenta:
        result += '105m';
        break;
      case LogBackgroundColor.brightCyan:
        result += '106m';
        break;
      case LogBackgroundColor.brightWhite:
        result += '107m';
        break;
      case LogBackgroundColor.none:
        result += '49m';
        break;
    }

    return result;
  }
}

enum LogEmojiColor {
  // Circle
  blackCircle,
  redCircle,
  greenCircle,
  yellowCircle,
  blueCircle,
  magentaCircle,
  whiteCircle,

  // Square
  blackSquare,
  redSquare,
  greenSquare,
  yellowSquare,
  blueSquare,
  magentaSquare,
  whiteSquare,

  // None
  none,
}

extension LogEmojiColorExtension on LogEmojiColor {
  /// [LogEmojiColor] to emoji
  String toColorString() {
    String result = '';

    switch (this) {
      case LogEmojiColor.blackCircle:
        result = '⚫️';
        break;
      case LogEmojiColor.redCircle:
        result = '🔴';
        break;
      case LogEmojiColor.greenCircle:
        result = '🟢';
        break;
      case LogEmojiColor.yellowCircle:
        result = '🟡';
        break;
      case LogEmojiColor.blueCircle:
        result = '🔵';
        break;
      case LogEmojiColor.magentaCircle:
        result = '🟣';
        break;
      case LogEmojiColor.whiteCircle:
        result = '⚪️';
        break;
      case LogEmojiColor.blackSquare:
        result = '⬛️';
        break;
      case LogEmojiColor.redSquare:
        result = '🟥';
        break;
      case LogEmojiColor.greenSquare:
        result = '🟩';
        break;
      case LogEmojiColor.yellowSquare:
        result = '🟨';
        break;
      case LogEmojiColor.blueSquare:
        result = '🟦';
        break;
      case LogEmojiColor.magentaSquare:
        result = '🟪';
        break;
      case LogEmojiColor.whiteSquare:
        result = '⬜️';
        break;
      case LogEmojiColor.none:
        result = '';
        break;
    }

    return result;
  }
}
