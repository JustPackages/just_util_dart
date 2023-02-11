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
  /// - @param [LogFontColor?] fontColor: 출력 글씨 색상
  /// - @param [LogBackgroundColor?] backgroundColor: 출력 글씨 배경 색상
  /// - @param [String] filterKeywords: 전체 호출 스택 중, filterKeywords가 포함된 호출 스택만 출력
  /// - @param [logBlock] logBlock: 해당 함수를 통해 출력되는 모든 문장 앞에 쓰일 문자열
  static void writeCallStack(
    String msg, {
    LogFontColor? fontColor,
    LogBackgroundColor? backgroundColor,
    String filterKeywords = '',
    String? logBlock,
  }) {
    String finalLogBlock = logBlock != null ? '[$logBlock] ' : '';
    String resultMsg = '${finalLogBlock}Call Stack ${"-" * 60}\n';
    resultMsg += '${finalLogBlock}message: $msg';

    // 0번째는 JustLog.writeCallStack()이므로 제거
    final currentStackStrList = StackTrace.current.toString().split('\n').sublist(1);

    List<String> filteredList = [];

    // filterKeywords를 포함하고 있는 CallStack을 걸러내고, 호출 번호 제거
    for (String currentStackString in currentStackStrList) {
      if (currentStackString != '' && currentStackString.contains(filterKeywords)) {
        String removeSharp = currentStackString.split('#')[1];
        int firstSpaceIdx = removeSharp.indexOf(' ');
        String removeNum = removeSharp.substring(firstSpaceIdx).trim();

        filteredList.add(removeNum);
      }
    }

    // 걸러낸 호출문들 새로 번호 부여
    for (int i = filteredList.length - 1; i >= 0; i--) {
      String currentString = filteredList[i];
      if (currentString != '' && currentString.contains(filterKeywords)) {
        resultMsg += '\n$finalLogBlock#${(i + 1).toStringAtLeat2Digits()}  $currentString';
      }
    }

    resultMsg += '\n$finalLogBlock${"-" * 71}\n';

    write(resultMsg, fontColor: fontColor, backgroundColor: backgroundColor);
  }
}
