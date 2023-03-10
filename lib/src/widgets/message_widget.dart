import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/widgets/chat_avatar.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isSender;
  final ChatLevel level;
  final String message;

  const MessageWidget(this.isSender, this.level, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      _buildChatAvatar(),
      _buildMessageBody(context),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isSender ? body : body.reversed.toList(),
      ),
    );
  }

  String _truncateParentheses(String str) =>
      str.replaceAll(RegExp(r"\(.+?\)"), '');

  Container _buildMessageBody(BuildContext context) {
    final truncatedMessage = _truncateParentheses(message);
    final theme = Theme.of(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .7,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: isSender
            ? theme.buttonTheme.colorScheme?.primary
            : theme.buttonTheme.colorScheme?.secondary,
      ),
      child: Text(
        truncatedMessage,
        style: TextStyle(
            color: isSender
                ? theme.buttonTheme.colorScheme?.onPrimary
                : theme.buttonTheme.colorScheme?.onSecondary,
            fontSize: 16),
      ),
    );
  }

  ChatAvatar _buildChatAvatar() =>
      ChatAvatar(isSender ? level.botImg : level.userImg);
}
