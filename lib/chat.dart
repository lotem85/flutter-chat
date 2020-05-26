import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp/DataBinding.dart';
import 'package:whatsapp/models/Message.dart';
import 'const.dart';

class ChatPage extends StatefulWidget {
  final key1;
  ChatPage({this.key1});

  @override
  _ChatPageState createState() => _ChatPageState(this.key1);
}

class _ChatPageState extends State<ChatPage> {
  final _binding = DataBindingBase.getInstance();
  final inputController = TextEditingController();

  int key;

  _ChatPageState(this.key);
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
          leading: Row(
            children: <Widget>[
              IconButton(
          icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },),
              Icon(Icons.album)
            ],
          ),
        title: Text(_binding.currentContact.name ?? ''),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
            },
          )
        ],

      ),
      body: Scaffold(body: new Column (
        children: <Widget>[
          buildMessagesList(),
          buildInput()],
      ),)

    );
  }

Widget buildMessagesList(){
    return Observer(
      builder:(_) => Flexible(
        child: Center(
          child: ListView.builder(
            itemCount: _binding.currentContact.messages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),

                decoration: BoxDecoration(
                  color: greyColor,
                  border: Border(bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )
                    ,),
                ),
                child: Text('${_binding.currentContact.messages[index].content}'),
              );
            },
          ),
        ),
      ),
    );
}

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: ()=>{},
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.face),
                onPressed: ()=>{},
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
    controller: inputController,
                style: TextStyle(color: primaryColor, fontSize: 15.0),
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: greyColor),
                ),
              ),
            ),
          ),

          // Button send message
          Material(
            child: Observer(
    builder: (_) => Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: ()  {
                    _binding.addMessage(Message(inputController.text, true));
                  inputController.text = "";

                  },
                  color: primaryColor,
                ),
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(border: Border(top: BorderSide(color: greyColor2, width: 0.5)), color: Colors.white),
    );
  }

}
