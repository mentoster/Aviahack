import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:mysample/Chat/PlaneApi.dart';
import 'package:mysample/Chat/StartMessage.dart';

// TODO: сделать опрос информации о номере рейса и запихать в информацию на 3 вкладки( время поставить статическое, я не нашёл бесплатное апи)
// TODO: Добавить базу данных?
class Chat extends StatefulWidget {
  @override
  _Chat createState() => new _Chat();
}

class _Chat extends State<Chat> {
  int numberOfScanMessage = 0;
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  AskNumberOffFlight askInfo = new AskNumberOffFlight();
  _Chat() {
    startChat();
  }
  void startChat() async {
    Response("Приветствие");
    await Future.delayed(const Duration(seconds: 2), () {});
    waitAnswer("Сменить номер рейса");
  }

  void waitAnswer(query) async {
    Response(query);
    numberOfScanMessage = 1;
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Напиши сообщение"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  color: Colors.orange[700],
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: new IconButton(
                  icon: new Icon(Icons.camera_alt),
                  color: Colors.orange[700],
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void ReadMessage(String message) async {
    AirRoad airRoad = await PlaneApi("Москва", 0);
    WriteMessage("Это ваш рейс?");
    print(airRoad.title);
    AirPoadShow(airRoad);
  }

  void AirPoadShow(AirRoad awWrite) {
    WriteMessage("Название " +
        awWrite.title +
        "\nОтправление: " +
        awWrite.departure +
        "\nТерминал: " +
        awWrite.terminal +
        "\nМодель самолёта: " +
        awWrite.vehicle);
  }

  void WriteMessage(String message) {
    final ChatMessage messageSend = new ChatMessage(
      text: message,
      name: "Айрис",
      type: false,
    );
    setState(() {
      _messages.insert(0, messageSend);
    });
  }

  void Response(query) async {
    if (numberOfScanMessage > 0) {
      --numberOfScanMessage;
      ReadMessage(query);
    } else {
      _textController.clear();
      AuthGoogle authGoogle =
          await AuthGoogle(fileJson: "assets/jsons/api.json").build();
      Dialogflow dialogflow =
          Dialogflow(authGoogle: authGoogle, language: Language.russian);
      AIResponse response = await dialogflow.detectIntent(query);
      WriteMessage(response.getMessage() ??
          new TypeMessage(response.getListMessage()[0]).platform);
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Вы",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child:
            new CircleAvatar(child: new Image.asset("assets/images/icon.png")),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Image.network(
                "https://yt3.ggpht.com/a/AATXAJyI6-JI9qHzW3CX3PbTnj2U2zbbWu_V90qcybiEUg=s900-c-k-c0xffffffff-no-rj-mo")),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
