import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBotPage extends StatefulWidget {
  ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
TextEditingController messageController = TextEditingController();
ScrollController scrollController = ScrollController();

  var messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Chat Bot".toUpperCase() , style: TextStyle(color: Theme.of(context).indicatorColor)),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "/");
          }, icon: Icon(Icons.logout,color: Theme.of(context).indicatorColor,))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Row(
                      children: [
                        messages[index]['role']=='user' ? SizedBox(width: 80,):SizedBox(width: 0,),
                        Expanded(
                          child: Card.outlined(
                            margin: EdgeInsets.all(7),
                            color: messages[index]['role']=='user' ? Color(0xFFD84315) : Color(0xFF37474F),
                            child: ListTile(
                              title: Text("${messages[index]['parts'][0]['text']}", style: TextStyle(color: Theme.of(context).indicatorColor)),
                            ),
                          ),
                        ),
                        messages[index]['role']=='model' ? SizedBox(width: 80,):SizedBox(width: 0,),
                      ],
                    ),
                  ],
                );
              })
          ),
          Padding(
              padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: "Votre message",
                      suffixIcon: Icon(Icons.message),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor
                          )
                      )
                  ),
                ),
                ),
                IconButton(onPressed: (){
                  String question = messageController.text;
                  final uri = Uri.parse(
                      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyAC__JuuFXzeSG36bnGDvrXlkJevje_GNg"
                  );
                  final headers = {"Content-Type": "application/json",};
                  messages.add({
                    "role": "user",
                    "parts": [
                      {"text": question}
                    ]
                  });
                  final body = {
                    "contents": messages
                  };

                  http.post(uri, headers: headers, body: json.encode(body)).then((resp) {
                    print(resp.body);
                    var data = json.decode(resp.body);
                    if (data["error"] != null) {
                      setState(() {
                        messages.add({
                          "role": "model",
                          "parts": [
                            {"text": "Erreur Gemini : ${data['error']['message']}"}
                          ]
                        });
                      });
                      return;
                    }

                    String response = data["candidates"][0]["content"]["parts"][0]["text"];
                    setState(() {
                      messages.add({
                        "role": "model",
                        "parts": [
                          {"text": response}
                        ]
                      });
                      Future.delayed(Duration(milliseconds: 100), () {
                        scrollController.jumpTo(
                            scrollController.position.maxScrollExtent + 200
                        );
                      });
                      messageController.text = "";
                    });
                  }).catchError((error) {
                    print(error);
                  });
                }, icon: Icon(Icons.send))
              ],
            )
          )
        ],
      ),
    );
  }
}
