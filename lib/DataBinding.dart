import 'package:mobx/mobx.dart';
import 'package:whatsapp/models/Contact.dart';
import 'package:whatsapp/models/Message.dart';
part 'DataBinding.g.dart';

class DataBinding = DataBindingBase with _$DataBinding;

abstract class DataBindingBase with Store {

  DataBindingBase()
  {
    currentContact = Contact("");
  }
  static DataBinding _instance;

  static DataBinding getInstance() {
    if (_instance == null) {
      _instance = DataBinding();
    }
    return _instance;
  }
  @observable
  ObservableList<Contact> contacts = ObservableList();
  @observable
  Contact _currentContact;


  Contact get currentContact => _currentContact;

  set currentContact(Contact currentContact) {
    _currentContact = currentContact;
  }

  @observable
  ObservableList<Message> messages = ObservableList();
  @observable
  Message message;


  @action
  addContact() => contacts.add(Contact("Contact Number " + contacts.length.toString()));

  @action
  addMessage(Message msg) {
    if (!currentContact.messages.contains(msg)) {
      currentContact.messages.add(msg);
    //currentContact.messages.add(msg);
  }
}}