import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Connexion".toUpperCase(), style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 22)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 200,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Votre nom d'utilisateur",
                          suffixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Votre mot de passe",
                          suffixIcon: Icon(Icons.visibility),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor, // couleur du bouton
                            padding: EdgeInsets.symmetric(vertical: 10),      // hauteur du bouton
                            textStyle: TextStyle(fontSize: 25),              // taille du texte
                          ),
                          onPressed: () {
                            if (usernameController.text == "admin" &&
                                passwordController.text == "12345") {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, "/bot");
                            }
                          },
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                              color: Theme.of(context).indicatorColor, // couleur du texte
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        )


    );
  }
}
