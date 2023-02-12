import 'package:just_util/just_util.dart';
import 'package:test/test.dart';

void main() {
  group('JustMap', () {
    Map map = {};

    setUp(() {
      map.clear();
    });

    test('📌 Set key<String> & value<null>', () {
      String key = 'key';

      map.setIfPresent(key: key, val: null);

      expect(map.isEmpty, isTrue);
    });

    test('📌 Set key<String> & value<String>', () {
      String key = 'string_key';
      String val = 'string_value';

      map.setIfPresent(key: key, val: val);

      expect(map[key] == val, isTrue);
    });

    test('📌 Get value<null>', () {
      String key = 'key';

      map.setIfPresent(key: key, val: null);

      expect(map.isEmpty, isTrue);
    });

    test('📌 Get value<String>', () {
      String key = 'string_key';
      String val = 'string_value';

      map.setIfPresent(key: key, val: val);

      expect(map[key] == val, isTrue);
    });
  });

  group('JustLog', () {
    String msg = 'JustLog Testing Message';
    String logBlock = 'LogBlock';

    group('.write', () {
      test('📌FontColor Test', () {
        JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.red, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.green, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.yellow, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.blue, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.magenta, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.cyan, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.black, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.none, logBlock: logBlock);
      });

      test('📌BackgroundColor Test', () {
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.black, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.red, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.green, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.yellow, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.blue, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.magenta, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.white, backgroundColor: LogBackgroundColor.cyan, logBlock: logBlock);
        JustLog.write(msg, fontColor: LogFontColor.black, backgroundColor: LogBackgroundColor.white, logBlock: logBlock);
      });
    });

    group('.writeCallStack', () {
      test('📌Simple Test', () {
        JustLog.writeCallStack(
          msg,
          fontColor: LogFontColor.black,
          backgroundColor: LogBackgroundColor.white,
          logBlock: logBlock,
        );
      });

      test('📌Filter Test', () {
        JustLog.writeCallStack(
          msg,
          fontColor: LogFontColor.black,
          backgroundColor: LogBackgroundColor.white,
          logBlock: logBlock,
          filterKeyword: 'test',
        );
      });

      test('📌MaxStack(0) Test', () {
        JustLog.writeCallStack(
          msg,
          fontColor: LogFontColor.black,
          backgroundColor: LogBackgroundColor.white,
          logBlock: logBlock,
          filterKeyword: 'test',
          maxStack: 0,
        );
      });

      test('📌MaxStack(2) Test', () {
        JustLog.writeCallStack(
          msg,
          fontColor: LogFontColor.black,
          backgroundColor: LogBackgroundColor.white,
          logBlock: logBlock,
          filterKeyword: 'test',
          maxStack: 2,
        );
      });
    });
  });
}
