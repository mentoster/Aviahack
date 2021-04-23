import 'package:flutter/material.dart';
// import 'package:flutter_dialogflow_v2/flutter_dialogflow.dart';
// import 'package:flutter_dialogflow/flutter_dialogflow.dart';
// import 'package:flutter_dialogflow/dialogflow_v2.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';
// import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

var TOKEN = "a1ab9877028f47a08ca6927ff5b34435";

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 0: карта',
    );
  }
}
// void resp(query) async {
//   print('in fun--------------------------------');
//   Dialogflow dialogflow = Dialogflow(token: TOKEN);
//   print(dialogflow);
//   AIResponse response = await dialogflow.sendQuery(query);
//   print(response);
//   print(response.getMessageResponse());
// }

// resp(query) async {
//   AuthGoogle authGoogle =
//       await AuthGoogle(fileJson: 'assets/your_file.json').build();
//   Dialogflow dialogflow =
//       Dialogflow(authGoogle: authGoogle, sessionId: '123456');
//   DetectIntentResponse response =
//       await dialogflow.detectIntentFromText('Hello!', 'wddw');
//   return response.queryResult.queryText;
// }
