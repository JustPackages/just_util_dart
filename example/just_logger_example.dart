import 'package:just_util/just_util.dart';

void main(List<String> args) {
  String msg = 'JUST LOG';

  justLog('Font Color Test');
  justLog(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white);
  justLog(msg, fontColor: LogFontColor.red);
  justLog(msg, fontColor: LogFontColor.green);
  justLog(msg, fontColor: LogFontColor.yellow);
  justLog(msg, fontColor: LogFontColor.blue);
  justLog(msg, fontColor: LogFontColor.magenta);
  justLog(msg, fontColor: LogFontColor.cyan);
  justLog(msg, fontColor: LogFontColor.none);

  justLog('');

  justLog('Background Color Test');
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.black);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.red);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.green);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.yellow);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.blue);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.magenta);
  justLog(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.cyan);
  justLog(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white);
  justLog(msg, backgroundColor: LogBackgroundColor.none);
}
