part of just_util.just_log;

class JustLogConfig {
  /// 출력되는 모든 문장 앞에 쓰일 문자열
  ///
  /// ex)
  /// ``` shell
  ///   [LogBlock] Hello!
  ///   [LogBlock] World!
  /// ```
  String? logBlock;

  /// logBlock의 글씨 색상
  LogFontColor? logBlockFontColor;

  /// logBlock의 글씨 배경 색상
  LogBackgroundColor? logBlockBackgroundColor;

  /// 출력문들의 글씨 색상
  LogFontColor? fontColor;

  /// 출력문들의 배경 색상
  LogBackgroundColor? backgroundColor;

  /// 출력문들의 앞에 출력될 색상 이모지
  LogEmojiColor? logEmojiColor;

  JustLogConfig({
    this.logBlock,
    this.logBlockFontColor = LogFontColor.white,
    this.logBlockBackgroundColor = LogBackgroundColor.black,
    this.fontColor = LogFontColor.blue,
    this.backgroundColor,
    this.logEmojiColor,
  });
}
