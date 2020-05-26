import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsapp/DataBinding.dart';
import 'package:whatsapp/chat.dart';
import 'const.dart';
import 'models/Contact.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _binding = DataBindingBase.getInstance();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("whatapp"),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: _binding.contacts.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide( //                   <--- left side
                  color: Colors.grey,
                  width: 1,
                ),),
              ),
              child: ListTile(
                  leading: Icon(Icons.album),
                title: Text('${_binding.contacts[index].name}'),
                  subtitle: Text('הודעה אחרונה'),
                trailing: Text(index.toString()),
                  onTap: () => onContactPress(context, index)

              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _binding.addContact(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future onContactPress(BuildContext context, int index) {
    Contact currentContact = _binding.contacts[index];
    _binding.currentContact = currentContact;
    return Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(key1: index,)) );
  }
}
