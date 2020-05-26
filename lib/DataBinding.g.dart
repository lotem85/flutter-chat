// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBinding.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataBinding on DataBindingBase, Store {
  final _$contactsAtom = Atom(name: 'DataBindingBase.contacts');

  @override
  ObservableList<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$_currentContactAtom = Atom(name: 'DataBindingBase._currentContact');

  @override
  Contact get _currentContact {
    _$_currentContactAtom.reportRead();
    return super._currentContact;
  }

  @override
  set _currentContact(Contact value) {
    _$_currentContactAtom.reportWrite(value, super._currentContact, () {
      super._currentContact = value;
    });
  }

  final _$messagesAtom = Atom(name: 'DataBindingBase.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$messageAtom = Atom(name: 'DataBindingBase.message');

  @override
  Message get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(Message value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$DataBindingBaseActionController =
      ActionController(name: 'DataBindingBase');

  @override
  dynamic addContact() {
    final _$actionInfo = _$DataBindingBaseActionController.startAction(
        name: 'DataBindingBase.addContact');
    try {
      return super.addContact();
    } finally {
      _$DataBindingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMessage(Message msg) {
    final _$actionInfo = _$DataBindingBaseActionController.startAction(
        name: 'DataBindingBase.addMessage');
    try {
      return super.addMessage(msg);
    } finally {
      _$DataBindingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts},
messages: ${messages},
message: ${message}
    ''';
  }
}
