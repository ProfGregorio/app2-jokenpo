import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}
int vitApp = 0;
int vitJog = 0;
int qtdJogos = 0;
List _imgAleatoria = [
  "pedra",
  "papel",
  "tesoura"
];
String pathImg="imagens/padrao.png";

class _JogoState extends State<Jogo> {
  //String resultado = "Você perdeu :(";
  String escolhaJogador = "Escolha uma opção abaixo!";
  String resultado = "....";

  // 1. Função que será executada quando o jogador clicar em uma imagem
  void _opcaoSelecionada(String escolhaUsuario) {
    qtdJogos+=1;
    var numeroSorteado = Random().nextInt(_imgAleatoria.length);
    print(numeroSorteado);

    print("Clicado!");

    print("O usuário escolheu: " + escolhaUsuario);

    // Aqui vai entrar a lógica do Jokenpô mais para frente!
    setState(() {
      pathImg = "imagens/"+_imgAleatoria[numeroSorteado]+".png";
      escolhaJogador = "Você escolheu: ${escolhaUsuario.toUpperCase()}";
      if(escolhaUsuario.toLowerCase() == _imgAleatoria[numeroSorteado].toLowerCase()){
        resultado="EMPATOU!!!";
      }else if(escolhaUsuario.toLowerCase()=="pedra"){
        if(_imgAleatoria[numeroSorteado].toLowerCase()=="tesoura"){
          resultado = "Você perdeu para o app:(";
          vitApp+=1;
        }else{
          resultado = "Você ganhou do app :)";
          vitJog+=1;
        }
      }
      else if(escolhaUsuario.toLowerCase()=="papel"){
        if(_imgAleatoria[numeroSorteado].toLowerCase()=="pedra"){
          resultado = "Você perdeu para o app:(";
          vitApp+=1;
        }else{
          resultado = "Você ganhou do app :)";
          vitJog+=1;
        }

      }
      //escolhaUsuario.toLowerCase()==tesoura
      else{
        if(_imgAleatoria[numeroSorteado].toLowerCase()=="pedra"){
          resultado = "Você perdeu para o app:(";
          vitApp+=1;
        }else{
          resultado = "Você ganhou do app :)";
          vitJog+=1;
        }
      }
    });
  }

  void _recomecarJogo(){
    setState(() {
      escolhaJogador = "Escolha uma opção abaixo!";
      resultado = "....";
      pathImg = "imagens/padrao.png";
      vitApp = 0;
      vitJog = 0;
      qtdJogos = 0;
    });

  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Jokenpo', textAlign: TextAlign.center)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //text
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
            ),
            //imagem
            Image.asset(pathImg, height: 120),
            //text resultado
            //Text(escolhaJogador),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                escolhaJogador,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            //Linha 3 Imagens na horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 🪨 Botão Pedra
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("imagens/pedra.png", width: 80),
                ),

                // 📄 Botão Papel
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("imagens/papel.png", width: 80),
                ),

                // ✂️ Botão Tesoura
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("imagens/tesoura.png", width: 80),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200, bottom: 16),
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.greenAccent,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: (){
                  _recomecarJogo();

                  print("Clicado");
                },

                child: Text("RECOMEÇAR O JOGO"),
              ),
            ),

          ],
        ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("APP -> ${vitApp}"),
                  Text("VOCÊ -> ${vitApp}"),
                  Text("TOTAL -> ${qtdJogos}")
                ],
              )
          )

      ),
    );
  }
}

