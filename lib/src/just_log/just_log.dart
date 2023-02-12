library just_util.just_log;

import 'package:just_util/src/just_int/just_int.dart';

part 'just_log_enums.dart';

class JustLog {
  /// JustLog의 로그 형식
  static String _justLogFormatter({
    required String msg,
    LogFontColor? fontColor,
    LogBackgroundColor? backgroundColor,
    String? logBlock,
  }) {
    String finalLogBlock = logBlock != null && logBlock != '' ? '[$logBlock] ' : '';
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
    // Start of Call Stack
    write('Call Stack ${"-" * 60}', fontColor: fontColor, backgroundColor: backgroundColor, logBlock: logBlock);

    // User's input message
    write('message: $msg', fontColor: fontColor, backgroundColor: backgroundColor, logBlock: logBlock);

    // 0번째는 JustLog.writeCallStack()이므로 제거
    final currentStackStrList = StackTrace.current.toString().split('\n').sublist(1);

    int stackCounter = 1;

    // 1. filterKeywords를 포함하고 있는 CallStack을 걸러냄
    // 2. 기존 호출 번호 제거
    // 3. 새로운 호출 번호 제거
    for (String currentStackString in currentStackStrList) {
      if (maxStack != null && stackCounter > maxStack) break;

      if (currentStackString != '' && currentStackString.contains(filterKeyword)) {
        List<String> sharpSplitted = currentStackString.split('#');

        // <asynchronous suspension> 과 같이 인덱싱이 되지 않은 CallStack들은 그냥 출력하도록 처리
        if (sharpSplitted.length < 2) {
          write(currentStackString, fontColor: fontColor, backgroundColor: backgroundColor, logBlock: logBlock);
          continue;
        }

        String removeSharp = sharpSplitted[1];
        int firstSpaceIdx = removeSharp.indexOf(' ');
        String removeNum = removeSharp.substring(firstSpaceIdx).trim();

        String stackMsg = '#${stackCounter.toStringAtLeat2Digits()}  $removeNum';

        write(stackMsg, fontColor: fontColor, backgroundColor: backgroundColor, logBlock: logBlock);
        stackCounter += 1;
      }
    }

    // End of Call Stack
    write("-" * 71, fontColor: fontColor, backgroundColor: backgroundColor, logBlock: logBlock);
  }

  /// JustLog의 로그 형식
  static String _justLogEFormatter({
    required String msg,
    LogEmojiColor? logEmojiColor,
    String? logBlock,
  }) {
    String finalLogBlock = logBlock != null && logBlock != '' ? '[$logBlock] ' : '';
    String finalEmoji = logEmojiColor == null ? '' : '${logEmojiColor.toColorString()} ';

    return '$finalLogBlock$finalEmoji$msg';
  }

  /// Write Message
  ///
  /// On Flutter development, iOS debugger doesn't print with color font or background on console.
  /// So we need to add print with emoji.
  ///
  /// - @param [String] msg: 출력하고 싶은 내용
  /// - @param [logBlock] logBlock: 해당 함수를 통해 출력되는 모든 문장 앞에 쓰일 문자열
  /// - @param [LogEmojiColor] logEmojiColor: 이모지의 색상
  static void eWrite(
    String msg, {
    String? logBlock,
    LogEmojiColor? logEmojiColor,
  }) {
    String finalMsg = _justLogEFormatter(
      msg: msg,
      logBlock: logBlock,
      logEmojiColor: logEmojiColor,
    );

    print(finalMsg);
  }

  /// Write Message with CallStack([StackTrace])
  ///
  /// - @param [String] msg: Call Stack 출력 전, 출력하고 싶은 메세지
  /// - @param [logBlock] logBlock: 해당 함수를 통해 출력되는 모든 문장 앞에 쓰일 문자열
  /// - @param [LogEmojiColor] logEmojiColor: 이모지의 색상
  /// - @param [String] filterKeywords: 전체 호출 스택 중, filterKeywords가 포함된 호출 스택만 출력
  /// - @param [int] maxStack: 최대로 추적할 StackTrace의 수, 지정하지 않을 시 호출 스택 전부 출력
  static void eWriteCallStack(
    String msg, {
    String? logBlock,
    LogEmojiColor? logEmojiColor,
    String filterKeyword = '',
    int? maxStack,
  }) {
    // Start of Call Stack
    eWrite('Call Stack ${"-" * 60}', logEmojiColor: logEmojiColor, logBlock: logBlock);

    // User's input message
    eWrite('message: $msg', logEmojiColor: logEmojiColor, logBlock: logBlock);

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

        eWrite(stackMsg, logEmojiColor: logEmojiColor, logBlock: logBlock);
        stackCounter += 1;
      }

      if (maxStack != null && stackCounter > maxStack) break;
    }

    // End of Call Stack
    eWrite("-" * 71, logEmojiColor: logEmojiColor, logBlock: logBlock);
  }
}
