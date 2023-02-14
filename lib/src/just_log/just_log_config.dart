part of just_util.just_log;

class JustLogConfig {
  /// 출력되는 모든 문장 앞에 쓰일 문자열
  ///
  /// ex)
  /// ``` shell
  ///   [LogBlock] Hello!
  ///   [LogBlock] World!
  /// ```
  String? block;

  /// logBlock의 글씨 색상
  LogFontColor? blockFontColor;

  /// logBlock의 글씨 배경 색상
  LogBackgroundColor? blockBackgroundColor;

  /// 출력문들의 글씨 색상
  LogFontColor? fontColor;

  /// 출력문들의 배경 색상
  LogBackgroundColor? backgroundColor;

  JustLogConfig({
    this.block,
    this.blockFontColor = LogFontColor.brightBlue,
    this.blockBackgroundColor,
    this.fontColor = LogFontColor.blue,
    this.backgroundColor,
  });
}

class JustLogEmojiConfig {
  /// 출력되는 모든 문장 앞에 쓰일 문자열
  ///
  /// ex)
  /// ``` shell
  ///   [LogBlock] Hello!
  ///   [LogBlock] World!
  /// ```
  String? block;

  /// 출력문들의 앞에 출력될 색상 이모지
  LogEmojiColor? emojiColor;

  JustLogEmojiConfig({
    this.block,
    this.emojiColor,
  });
}
