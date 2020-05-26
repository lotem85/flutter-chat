import 'package:mobx/mobx.dart';
import 'package:whatsapp/models/Message.dart';

class Contact {
  String name;
  ObservableList<Message> messages;

  Contact(this.name){
    messages = ObservableList<Message>();
  }
}