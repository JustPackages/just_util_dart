part of just_util.just_log;

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
