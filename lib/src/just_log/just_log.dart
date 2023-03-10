library just_util.just_log;

import 'dart:developer' as dev;

import 'package:just_util/src/just_int/just_int.dart';

part 'just_log_config.dart';
part 'just_log_enums.dart';

class JustLog {
  static String _formatter(String msg, {JustLogConfig? config}) {
    if (config != null) {
      String logBlockFront = '';
      String logBlockRear = '';

      if (config.blockFontColor != null) {
        logBlockFront += config.blockFontColor!.toColorString();
        logBlockRear += LogFontColor.none.toColorString();
      }

      if (config.blockBackgroundColor != null) {
        logBlockFront += config.blockBackgroundColor!.toColorString();
        logBlockRear += LogBackgroundColor.none.toColorString();
      }

      String finalLogBlock = config.block != null && config.block != ''
          ? '$logBlockFront[${config.block}]$logBlockRear '
          : '';

      String finalFontColor = config.fontColor?.toColorString() ?? '';
      String finalBackgroundColor =
          config.backgroundColor?.toColorString() ?? '';
      String finalDefaultColor = '\x1B[0m';

      return '$finalLogBlock$finalFontColor$finalBackgroundColor$msg$finalDefaultColor';
    }

    return msg;
  }

  static String _callStack({
    JustLogConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> stackStrList = [];

    // 0번째는 _callStack이므로 제거
    // 1번째는 _callStack을 호출한 함수이므로 제거
    final currentStackStrList =
        StackTrace.current.toString().split('\n').sublist(2);

    int stackCounter = 1;

    // 1. filterKeywords를 포함하고 있는 CallStack을 걸러냄
    // 2. 기존 호출 번호 제거
    // 3. 새로운 호출 번호 제거
    for (String currentStackString in currentStackStrList) {
      if (maxStack != null && stackCounter > maxStack) break;

      if (currentStackString != '' &&
          currentStackString.contains(filterKeyword)) {
        List<String> sharpSplitted = currentStackString.split('#');

        // <asynchronous suspension> 과 같이 인덱싱이 되지 않은 CallStack들은 그냥 출력하도록 처리
        if (sharpSplitted.length < 2) {
          stackStrList.add(_formatter(currentStackString, config: config));
          continue;
        }

        String removeSharp = sharpSplitted[1];
        int firstSpaceIdx = removeSharp.indexOf(' ');
        String removeNum = removeSharp.substring(firstSpaceIdx).trim();

        String stackMsg =
            '#${stackCounter.toStringAtLeat2Digits()}  $removeNum';

        stackStrList.add(_formatter(stackMsg, config: config));
        stackCounter += 1;
      }
    }

    String result = stackStrList.join('\n');

    return result;
  }

  /// Log 함수 이용 출력
  /// - 폰트 색상 사용 [LogFontColor]
  /// - 배경 색상 사용 [LogBackgroundColor]
  static void log(String msg, {JustLogConfig? config}) {
    String finalMsg = _formatter(msg, config: config);

    Future.delayed(Duration.zero).whenComplete(() {
      dev.log(finalMsg);
    });
  }

  /// print 함수 이용 출력
  /// - 폰트 색상 사용 [LogFontColor]
  /// - 배경 색상 사용 [LogBackgroundColor]
  static void write(String msg, {JustLogConfig? config}) {
    String finalMsg = _formatter(msg, config: config);

    print(finalMsg);
  }

  static void logCallStack(
    String msg, {
    JustLogConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> logMsg = [];

    // Start of Call Stack
    logMsg.add(_formatter('Call Stack ${"-" * 60}', config: config));

    // User's input message
    logMsg.add(_formatter('message: $msg', config: config));

    String callStackStr = _callStack(
      config: config,
      filterKeyword: filterKeyword,
      maxStack: maxStack,
    );

    logMsg.add(callStackStr);

    // End of Call Stack
    logMsg.add(_formatter("-" * 71, config: config));

    String finalMsg = logMsg.join('\n');

    log(finalMsg);
  }

  static void writeCallStack(
    String msg, {
    JustLogConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> logMsg = [];

    // Start of Call Stack
    logMsg.add(_formatter('Call Stack ${"-" * 60}', config: config));

    // User's input message
    logMsg.add(_formatter('message: $msg', config: config));

    String callStackStr = _callStack(
      config: config,
      filterKeyword: filterKeyword,
      maxStack: maxStack,
    );

    logMsg.add(callStackStr);

    // End of Call Stack
    logMsg.add(_formatter("-" * 71, config: config));

    String finalMsg = logMsg.join('\n');

    write(finalMsg);
  }
}

class JustLogEmoji {
  static String _formatter(String msg, {JustLogEmojiConfig? config}) {
    if (config != null) {
      String finalLogBlock = config.block != null && config.block != ''
          ? '[${config.block}] '
          : '';
      String finalEmoji = config.emojiColor != null
          ? '${config.emojiColor!.toColorString()} '
          : '';

      return '$finalLogBlock$finalEmoji$msg';
    }

    return msg;
  }

  static String _callStack({
    JustLogEmojiConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> stackStrList = [];

    // 0번째는 _callStack이므로 제거
    // 1번째는 _callStack을 호출한 함수이므로 제거
    final currentStackStrList =
        StackTrace.current.toString().split('\n').sublist(2);

    int stackCounter = 1;

    // 1. filterKeywords를 포함하고 있는 CallStack을 걸러냄
    // 2. 기존 호출 번호 제거
    // 3. 새로운 호출 번호 제거
    for (String currentStackString in currentStackStrList) {
      if (maxStack != null && stackCounter > maxStack) break;

      if (currentStackString != '' &&
          currentStackString.contains(filterKeyword)) {
        List<String> sharpSplitted = currentStackString.split('#');

        // <asynchronous suspension> 과 같이 인덱싱이 되지 않은 CallStack들은 그냥 출력하도록 처리
        if (sharpSplitted.length < 2) {
          stackStrList.add(_formatter(currentStackString, config: config));
          continue;
        }

        String removeSharp = sharpSplitted[1];
        int firstSpaceIdx = removeSharp.indexOf(' ');
        String removeNum = removeSharp.substring(firstSpaceIdx).trim();

        String stackMsg =
            '#${stackCounter.toStringAtLeat2Digits()}  $removeNum';

        stackStrList.add(_formatter(stackMsg, config: config));
        stackCounter += 1;
      }
    }

    String result = stackStrList.join('\n');

    return result;
  }

  /// Log 함수 이용 출력
  /// - 색상 이모지 사용 [LogEmojiColor]
  static void log(String msg, {JustLogEmojiConfig? config}) {
    String finalMsg = _formatter(msg, config: config);

    dev.log(finalMsg);
  }

  /// print 함수 이용 출력
  /// - 색상 이모지 사용 [LogEmojiColor]
  static void write(String msg, {JustLogEmojiConfig? config}) {
    String finalMsg = _formatter(msg, config: config);

    print(finalMsg);
  }

  static void logCallStack(
    String msg, {
    JustLogEmojiConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> logMsg = [];

    // Start of Call Stack
    logMsg.add(_formatter('Call Stack ${"-" * 60}', config: config));

    // User's input message
    logMsg.add(_formatter('message: $msg', config: config));

    String callStackStr = _callStack(
      config: config,
      filterKeyword: filterKeyword,
      maxStack: maxStack,
    );

    logMsg.add(callStackStr);

    // End of Call Stack
    logMsg.add(_formatter("-" * 71, config: config));

    String finalMsg = logMsg.join('\n');

    log(finalMsg);
  }

  static void writeCallStack(
    String msg, {
    JustLogEmojiConfig? config,
    String filterKeyword = '',
    int? maxStack,
  }) {
    List<String> logMsg = [];

    // Start of Call Stack
    logMsg.add(_formatter('Call Stack ${"-" * 60}', config: config));

    // User's input message
    logMsg.add(_formatter('message: $msg', config: config));

    String callStackStr = _callStack(
      config: config,
      filterKeyword: filterKeyword,
      maxStack: maxStack,
    );

    logMsg.add(callStackStr);

    // End of Call Stack
    logMsg.add(_formatter("-" * 71, config: config));

    String finalMsg = logMsg.join('\n');

    write(finalMsg);
  }
}
