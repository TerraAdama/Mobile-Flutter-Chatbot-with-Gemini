import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de connexion", style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 22)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 450,
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image(image: AssetImage("assets/images/logo.png"), width: 200,),
                  SizedBox(height: 1),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Votre nom d'utilisateur",
                      suffixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor
                        )
                      )
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Votre mot de passe",
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                color: Theme.of(context).primaryColor
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      String username = usernameController.text;
                      String password = passwordController.text;
                      if(username == "admin" && password == "12345"){
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, "/bot");
                      }
                    },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor
                        ),
                        child: Text("Se connecter", style: TextStyle(fontSize: 25, color: Theme.of(context).indicatorColor),)
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
