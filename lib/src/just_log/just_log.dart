import 'package:just_util/src/just_int/just_int.dart';

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

class JustLog {
  /// JustLog의 로그 형식
  static String _justLogFormatter({
    required String msg,
    LogFontColor? fontColor,
    LogBackgroundColor? backgroundColor,
    String? logBlock,
  }) {
    String finalLogBlock = logBlock != null ? '[$logBlock] ' : '';
    String finalFontColor = fontColor == null ? '' : fontColor.toColorString();
    String finalBackgroundColor = backgroundColor == null ? '' : backgroundColor.toColorString();
    String finalDefaultColor = (fontColor != null || backgroundColor != null) ? '\x1B[0m' : '';

    return '$finalLogBlock$finalFontColor$finalBackgroundColor$msg$finalDefaultColor';
  }

  /// Write Message
  ///
  /// - @param [String] msg: 출력하고 싶은 내용
  /// - @param [LogFontColor]? fontColor: 출력 글씨 색상
  /// - @param [LogBackgroundColor]? backgroundColor: 출력 글씨 배경 색상
  /// - @param [String] logBlock: 해당 함수를 통해 출력되는 모든 문장 앞에 쓰일 문자열
  static void write(
    String msg, {
    LogFontColor? fontColor,
    LogBackgroundColor? backgroundColor,
    String? logBlock,
  }) {
    String finalMsg = _justLogFormatter(
      msg: msg,
      logBlock: logBlock,
      fontColor: fontColor,
      backgroundColor: backgroundColor,
    );

    print(finalMsg);
  }

  /// Write Message with CallStack([StackTrace])
  ///
  /// - @param [String] msg: Call Stack 출력 전, 출력하고 싶은 메세지
  /// - @param [LogFontColor]? fontColor: 출력 글씨 색상
  /// - @param [LogBackgroundColor]? backgroundColor: 출력 글씨 배경 색상
  /// - @param [String] filterKeywords: 전체 호출 스택 중, filterKeywords가 포함된 호출 스택만 출력
  /// - @param [logBlock] logBlock: 해당 함수를 통해 출력되는 모든 문장 앞에 쓰일 문자열
  /// - @param [int] maxStack: 최대로 추적할 StackTrace의 수, 지정하지 않을 시 호출 스택 전부 출력
  static void writeCallStack(
    String msg, {
    LogFontColor? fontColor,
    LogBackgroundColor? backgroundColor,
    String? logBlock,
    String filterKeyword = '',
    int? maxStack,
  }) {
    // 출력하고자하는 메세지 보관 리스트
    List<String> messageBucket = [];

    messageBucket.add('Call Stack ${"-" * 60}'); // Start of Call Stack
    messageBucket.add('message: $msg'); // User's input message

    // 0번째는 JustLog.writeCallStack()이므로 제거
    final currentStackStrList = StackTrace.current.toString().split('\n').sublist(1);

    int stackCounter = 1;

    // 1. filterKeywords를 포함하고 있는 CallStack을 걸러냄
    // 2. 기존 호출 번호 제거
    // 3. 새로운 호출 번호 제거
    for (String currentStackString in currentStackStrList) {
      if (currentStackString != '' && currentStackString.contains(filterKeyword)) {
        String removeSharp = currentStackString.split('#')[1];
        int firstSpaceIdx = removeSharp.indexOf(' ');
        String removeNum = removeSharp.substring(firstSpaceIdx).trim();

        String stackMsg = '#${stackCounter.toStringAtLeat2Digits()}  $removeNum';

        messageBucket.add(stackMsg);
        stackCounter += 1;
      }

      if (maxStack != null && stackCounter > maxStack) break;
    }

    messageBucket.add("-" * 71); // End of Call Stack

    for (String callStackMsg in messageBucket) {
      write(
        callStackMsg,
        fontColor: fontColor,
        backgroundColor: backgroundColor,
        logBlock: logBlock,
      );
    }
  }
}
