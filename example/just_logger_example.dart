import 'package:just_util/just_util.dart';

void main(List<String> args) {
  testJustLogWrite();
  testJustLogWriteCallStack();
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
      'Check Call Stack Message~!',
      fontColor: LogFontColor.green,
      filterKeywords: '',
      logBlock: 'TestLog',
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
