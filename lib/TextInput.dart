import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  TextEditingController _alcoolPrice = TextEditingController();
  TextEditingController _gasPrice = TextEditingController();
  String _textResult = "";

  void _finalPrice(){
    double priceA = double.tryParse(_alcoolPrice.text);
    double priceG = double.tryParse(_gasPrice.text);

    if (priceA == null || priceG == null){
      setState(() {
        this._textResult="Número inválido, digite um número maior que zero, separado por .";
      });
    } else {
      /** se o (preço-do-alcool)/(preço-da-gasolina) >= 0.7, melhor abastecer
       * com gasolina, senão, melhor abastecer com álcool
       */
      (priceA/priceG) >= 0.7 ? (
        setState(() {
          this._textResult="Melhor abastecer com GASOLINA";
        })        
      ) : (
        setState(() {
          this._textResult="Melhor abastecer com ÁLCOOL";
        })
      );
      // cleanUp();
    }
  }

  // void cleanUp(){
  //   _alcoolPrice.text = "";
  //   _gasPrice.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Álcool ou gasolina?')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top:8, bottom: 16, left: 32, right: 32),
              child: Text(
                "Qual a melhor opção para o abastecimento do seu veículo?",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 23,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top:16, bottom: 5, left: 32, right: 32),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do álcool, ex: 1.59"
                ),
                enabled: true,
                maxLength: 5,
                maxLengthEnforced: true,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
                ),
                onSubmitted: (String alcool){
                  print('valor digitado: ' + alcool );
                },
                controller: _alcoolPrice,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:5, bottom: 10, left: 32, right: 32),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da gasolina, ex: 3.56"
                ),
                enabled: true,
                maxLength: 5,
                maxLengthEnforced: true,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
                ),
                onSubmitted: (String gasolina){
                  print('valor digitado: ' + gasolina);
                },
                controller: _gasPrice,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10, bottom: 22, left: 32, right: 32),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize:22
                  )
                ),
                onPressed: _finalPrice,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10, bottom: 32, left: 32, right: 32),
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}