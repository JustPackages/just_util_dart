import 'package:just_util/just_util.dart';

void main(List<String> args) {
  testJustLogWrite();
  testJustLogWriteCallStack();
  testJustLogEWrite();
  testJustLogEWriteCallStack();
}

void testJustLogWrite() {
  JustLog.write('\n<TEST JUST LOG Write>');

  String msg = 'JUST LOG Write';

  JustLog.write('\nFont Color Test');
  JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.red, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.green, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.yellow, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.blue, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.magenta, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.cyan, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.none, logBlock: 'TestLog');

  JustLog.write('');

  JustLog.write('Background Color Test');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.black, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.red, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.green, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.yellow, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.blue, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.magenta, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.cyan, logBlock: 'TestLog');
  JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white, logBlock: 'TestLog');
  JustLog.write(msg, backgroundColor: LogBackgroundColor.none, logBlock: 'TestLog');
}

void testJustLogWriteCallStack() {
  JustLog.write('\n<TEST JUST LOG Write CallStack>\n');

  void innerCallStack10() {
    JustLog.writeCallStack(
      'Check Call Stack without filterKeyword',
      fontColor: LogFontColor.green,
      filterKeyword: '',
      logBlock: 'TestLog',
    );

    JustLog.write('');

    JustLog.writeCallStack(
      'Check Call Stack with filterKeyword',
      fontColor: LogFontColor.yellow,
      filterKeyword: 'testJustLogWriteCallStack',
      logBlock: 'TestLog',
    );

    JustLog.write('');

    JustLog.writeCallStack(
      'Check Call Stack with maxStack',
      fontColor: LogFontColor.green,
      filterKeyword: '',
      logBlock: 'TestLog',
      maxStack: 5,
    );
  }

  void innerCallStack9() {
    innerCallStack10();
  }

  void innerCallStack8() {
    innerCallStack9();
  }

  void innerCallStack7() {
    innerCallStack8();
  }

  void innerCallStack6() {
    innerCallStack7();
  }

  void innerCallStack5() {
    innerCallStack6();
  }

  void innerCallStack4() {
    innerCallStack5();
  }

  void innerCallStack3() {
    innerCallStack4();
  }

  void innerCallStack2() {
    innerCallStack3();
  }

  void innerCallStack1() {
    innerCallStack2();
  }

  innerCallStack1();
}

void testJustLogEWrite() {
  JustLog.write('\n<TEST JUST LOG Write>');

  String msg = 'JUST LOG eWrite';

  JustLog.eWrite('\nEmoji Test');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.blackCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.redCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.greenCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.yellowCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.blueCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.magentaCircle, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.whiteCircle, logBlock: 'TestLog');

  JustLog.eWrite('');

  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.blackSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.redSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.greenSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.yellowSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.blueSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.magentaSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.whiteSquare, logBlock: 'TestLog');
  JustLog.eWrite(msg, logEmojiColor: LogEmojiColor.none, logBlock: 'TestLog');
}

void testJustLogEWriteCallStack() {
  JustLog.write('\n<TEST JUST LOG Write CallStack>\n');

  void innerCallStack10() {
    JustLog.eWriteCallStack(
      'Check Call Stack without filterKeyword',
      logEmojiColor: LogEmojiColor.greenSquare,
      filterKeyword: '',
      logBlock: 'TestLog',
    );

    JustLog.eWrite('');

    JustLog.eWriteCallStack(
      'Check Call Stack with filterKeyword',
      logEmojiColor: LogEmojiColor.yellowCircle,
      filterKeyword: 'testJustLogEWriteCallStack',
      logBlock: 'TestLog',
    );

    JustLog.eWrite('');

    JustLog.eWriteCallStack(
      'Check Call Stack with maxStack',
      logEmojiColor: LogEmojiColor.greenCircle,
      filterKeyword: '',
      logBlock: 'TestLog',
      maxStack: 5,
    );
  }

  void innerCallStack9() {
    innerCallStack10();
  }

  void innerCallStack8() {
    innerCallStack9();
  }

  void innerCallStack7() {
    innerCallStack8();
  }

  void innerCallStack6() {
    innerCallStack7();
  }

  void innerCallStack5() {
    innerCallStack6();
  }

  void innerCallStack4() {
    innerCallStack5();
  }

  void innerCallStack3() {
    innerCallStack4();
  }

  void innerCallStack2() {
    innerCallStack3();
  }

  void innerCallStack1() {
    innerCallStack2();
  }

  innerCallStack1();
}
