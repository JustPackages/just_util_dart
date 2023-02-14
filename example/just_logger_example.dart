import 'package:just_util/just_util.dart';

void main(List<String> args) {
  justLogSample();
  justLogSampleDevLog();
  justLogEmojisample();
}

void justLogSample() {
  String thisBlock = 'JustLogSample';

  JustLogConfig msgLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.brightBlue,
  );

  JustLogConfig infoLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.green,
  );

  JustLogConfig warningLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.yellow,
  );

  JustLogConfig errorLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.brightRed,
  );

  JustLogConfig customConfig = JustLogConfig(
    block: '👻|Surprise',
    blockFontColor: LogFontColor.brightYellow,
    fontColor: LogFontColor.brightMagenta,
  );

  JustLogConfig customCallStackConfig = JustLogConfig(
    block: '⛔️|Check!',
    blockFontColor: LogFontColor.brightRed,
    fontColor: LogFontColor.brightBlue,
  );

  JustLogConfig customlogCallStackConfig = JustLogConfig(
    block: '⛔️|Check!',
    blockFontColor: LogFontColor.brightRed,
    fontColor: LogFontColor.brightGreen,
  );

  JustLog.write('hello, this is msg', config: msgLogConfig);
  JustLog.write('hello, this is info', config: infoLogConfig);
  JustLog.write('hello, this is warning', config: warningLogConfig);
  JustLog.write('hello, this is error', config: errorLogConfig);

  JustLog.write('boo ~~', config: customConfig);

  callStackTester(() {
    JustLog.writeCallStack(
      'hello, this is Call Stack',
      config: customCallStackConfig,
      maxStack: 10,
    );
  });
}

void justLogSampleDevLog() {
  String thisBlock = 'JustLogSample';

  JustLogConfig msgLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.brightBlue,
  );

  JustLogConfig infoLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.green,
  );

  JustLogConfig warningLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.yellow,
  );

  JustLogConfig errorLogConfig = JustLogConfig(
    block: thisBlock,
    fontColor: LogFontColor.brightRed,
  );

  JustLogConfig customConfig = JustLogConfig(
    block: '👻|Surprise',
    blockFontColor: LogFontColor.brightYellow,
    fontColor: LogFontColor.brightMagenta,
  );

  JustLogConfig customCallStackConfig = JustLogConfig(
    block: '⛔️|Check!',
    blockFontColor: LogFontColor.brightRed,
    fontColor: LogFontColor.brightGreen,
  );

  JustLog.log('hello, this is msg', config: msgLogConfig);
  JustLog.log('hello, this is info', config: infoLogConfig);
  JustLog.log('hello, this is warning', config: warningLogConfig);
  JustLog.log('hello, this is error', config: errorLogConfig);

  JustLog.log('boo ~~', config: customConfig);

  callStackTester(() {
    JustLog.logCallStack(
      'hello, this is Call Stack',
      config: customCallStackConfig,
      maxStack: 10,
    );
  });

  Future.delayed(Duration(seconds: 2));
}

void justLogEmojisample() {
  String thisBlock = 'JustLogEmojiSample';

  JustLogEmojiConfig msgLogConfig = JustLogEmojiConfig(
    block: thisBlock,
    emojiColor: LogEmojiColor.blueSquare,
  );

  JustLogEmojiConfig infoLogConfig = JustLogEmojiConfig(
    block: thisBlock,
    emojiColor: LogEmojiColor.greenSquare,
  );

  JustLogEmojiConfig warningLogConfig = JustLogEmojiConfig(
    block: thisBlock,
    emojiColor: LogEmojiColor.yellowSquare,
  );

  JustLogEmojiConfig errorLogConfig = JustLogEmojiConfig(
    block: thisBlock,
    emojiColor: LogEmojiColor.redSquare,
  );

  JustLogEmojiConfig customConfig = JustLogEmojiConfig(
    block: '👻|Surprise',
    emojiColor: LogEmojiColor.yellowCircle,
  );

  JustLogEmoji.write('hello, this is msg', config: msgLogConfig);
  JustLogEmoji.write('hello, this is info', config: infoLogConfig);
  JustLogEmoji.write('hello, this is warning', config: warningLogConfig);
  JustLogEmoji.write('hello, this is error', config: errorLogConfig);

  JustLogEmoji.write('boo ~~~', config: customConfig);

  callStackTester(() {
    JustLogEmoji.writeCallStack(
      'hello, this is Call Stack',
      config: msgLogConfig,
      filterKeyword: 'callStackTester',
    );
  });
}

void callStackTester(Function bodyFunc) {
  void innerCaller6() {
    bodyFunc();
  }

  void innerCaller5() {
    innerCaller6();
  }

  void innerCaller4() {
    innerCaller5();
  }

  void innerCaller3() {
    innerCaller4();
  }

  void innerCaller2() {
    innerCaller3();
  }

  void innerCaller1() {
    innerCaller2();
  }

  innerCaller1();
}
