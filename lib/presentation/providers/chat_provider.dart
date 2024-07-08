import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //para el scroll
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    // Message(text: 'hi there', fromWho: FromWho.me),
    // Message(text: 'regresaste ?', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    // print(herMessage); 
    messageList.add(herMessage); 
    notifyListeners();// avisa de la notificacion a todos los listeners 
    moveScrollToottom(); 
  }

  Future<void> moveScrollToottom() async {
    // esta funcion la usamos para mover el scroll hasta el final

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInExpo);
  }
}
