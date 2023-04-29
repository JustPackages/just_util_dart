# Change Logs

## 1.0.0

- Initial version.

## 1.0.1

- JustLog.write() can take a parameter 'logBlock' which will print front of your message.
- Add new Functions
  - JustLog.eWrite() : Write message with Color Emoji.
  - JustLog.eWriteCallStack() : Write CallStack with Color Emoji.

## 1.0.2

- Separate EmojiLogger as JustLogEmoji
- There is new Config Class for JustLog & JustLogEmoji.
- Provide two output functions. One uses 'print()', and the other uses 'log()' which is embedded in "dart:devloper"

## 1.0.3

- Added function to truncate double type numbers' decimal places.
- Json.getIfPresent function retreive default value when, json doesn't have key or the value is null.
- Add toPrettyJsonString which makes pretty json string.
