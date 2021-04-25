import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:mysample/Chat/PlaneApi.dart';
import 'package:mysample/Chat/Commands.dart';
import 'package:mysample/main.dart';
import 'package:qrscan/qrscan.dart' as scanner;

// TODO: сделать опрос информации о номере рейса и запихать в информацию на 3 вкладки( время поставить статическое, я не нашёл бесплатное апи)
// TODO: Добавить базу данных?
class Chat extends StatefulWidget {
  @override
  _Chat createState() => new _Chat();
}

class _Chat extends State<Chat> {
  int numberOfScanMessage = 0;
  bool _checkWay = true;
  String cityNow = '';
  int tryNumber = 0;
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  AirRoad askInfo = new AirRoad();
  _Chat() {
    startChat();
  }
  void startChat() async {
    response("Приветствие");
    await Future.delayed(const Duration(seconds: 2), () {});
    waitAnswer("Сменить номер рейса");
    numberOfScanMessage = 1;
  }

  void waitAnswer(query) async {
    response(query);
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0),
                child: new IconButton(
                  icon: new Icon(Icons.camera_alt),
                  color: Colors.orange[700],
                  onPressed: () => scanQr(),
                )),
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
          ],
        ),
      ),
    );
  }

  void scanQr() async {
    String cameraScanResult = await scanner.scan();
    sendPcrt(cameraScanResult);
    // _handleSubmitted(cameraScanResult);
  }

  void checkWay(String messageText) async {
    AirRoad airRoad = await PlaneApi(messageText, tryNumber);
    writeMessage("Это ваш рейс?");
    airPoadShow(airRoad);
    dataShare.value = airRoad;
    numberOfScanMessage = 1;
  }

  void airPoadShow(AirRoad awWrite) {
    print(awWrite.title);
    print(awWrite.departure);
    print(awWrite.terminal);
    print(awWrite.vehicle);
    writeMessage("Название " +
        awWrite.title +
        "\nОтправление: " +
        awWrite.departure +
        "\nТерминал: " +
        awWrite.terminal +
        "\nСамолёт: " +
        awWrite.vehicle +
        "\n\nЕсли хотите поменять город, \n то наберите команду 'другой город'");
  }

  void sendPcrt(String qrNumber) {
    String impgPath = 'assets/images/';
    Map img = new Map();
    img["000001"] = ["1.png", "Паркинга"];
    img["000002"] = ["2.png", "Стойки негабаритного багажа"];
    img["000003"] = ["3.png", "Выхода 107-108"];
    print(img[qrNumber][0]);
    dataShare.value.where = img[qrNumber][1];
    writeMessage("Вы находитесь около " + img[qrNumber][1]);
    final ChatMessage messageSend = new ChatMessage(
        text: "1",
        name: "Айрис",
        type: false,
        isImg: true,
        path: impgPath + img[qrNumber][0]);
    setState(() {
      _messages.insert(0, messageSend);
    });
  }

  void writeMessage(String message) {
    final ChatMessage messageSend = new ChatMessage(
      text: message,
      name: "Айрис",
      type: false,
      isImg: false,
      path: '',
    );
    setState(() {
      _messages.insert(0, messageSend);
    });
  }

  void response(query) async {
    String qr = query;
    qr = qr.toLowerCase();
    if (numberOfScanMessage > 0) {
      --numberOfScanMessage;
      if (qr == "да") {
        writeMessage("Я запомнил информацию.");
        writeMessage("Заходите в аэропорт.");
        response("пройти первый уровень проверки");
        await Future.delayed(const Duration(seconds: 12), () {});
        writeMessage(
            "чтобы получить информацию дальше, вы можете набрать команду 'дальше' или отсканировать код на стене.");
      } else if (qr == "нет") {
        ++numberOfScanMessage;
        ++tryNumber;
        ++tryNumber;
        checkWay(cityNow);
      } else if (qr == "другой город") {
        tryNumber = 0;
        ++numberOfScanMessage;
        writeMessage("Наберите город, куда вы вылетаете");
      } else if (tryNumber == 0) {
        cityNow = query;
        checkWay(query);
      }
    } else if (qr == "другой город") {
      tryNumber = 0;
      ++numberOfScanMessage;
      writeMessage("Наберите город, куда вы вылетаете");
    } else {
      _textController.clear();
      AuthGoogle authGoogle =
          await AuthGoogle(fileJson: "assets/jsons/api.json").build();
      Dialogflow dialogflow =
          Dialogflow(authGoogle: authGoogle, language: Language.russian);
      AIResponse response = await dialogflow.detectIntent(query);
      writeMessage(response.getMessage() ??
          new TypeMessage(response.getListMessage()[0]).platform);
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Вы",
      type: true,
      isImg: false,
      path: '',
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
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
  ChatMessage({
    required this.text,
    required this.name,
    required this.type,
    required this.isImg,
    required this.path,
  });
  final String text;
  final String name;
  final bool type;
  final bool isImg;
  final String path;

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
              child: !this.isImg
                  ? new Text(text)
                  : Image(
                      image: AssetImage(path),
                      height: 300,
                    ),
            )
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
