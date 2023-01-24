import 'package:just_util/just_util.dart';

void main(List<String> args) {
  // testJustLogWrite();
  testJustLogWriteCallStack();
}

void testJustLogWrite() {
  JustLog.write('\n<TEST JUST LOG Write>');

  String msg = 'JUST LOG Write';

  JustLog.write('\nFont Color Test');
  JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white);
  JustLog.write(msg, fontColor: LogFontColor.red);
  JustLog.write(msg, fontColor: LogFontColor.green);
  JustLog.write(msg, fontColor: LogFontColor.yellow);
  JustLog.write(msg, fontColor: LogFontColor.blue);
  JustLog.write(msg, fontColor: LogFontColor.magenta);
  JustLog.write(msg, fontColor: LogFontColor.cyan);
  JustLog.write(msg, fontColor: LogFontColor.none);

  JustLog.write('');

  JustLog.write('Background Color Test');
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.black);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.red);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.green);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.yellow);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.blue);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.magenta);
  JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.cyan);
  JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white);
  JustLog.write(msg, backgroundColor: LogBackgroundColor.none);
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
