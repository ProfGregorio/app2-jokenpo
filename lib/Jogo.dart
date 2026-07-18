import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}
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
        }else{
          resultado = "Você ganhou do app :)";
        }
      }
      else if(escolhaUsuario.toLowerCase()=="papel"){
        if(_imgAleatoria[numeroSorteado].toLowerCase()=="pedra"){
          resultado = "Você perdeu para o app:(";
        }else{
          resultado = "Você ganhou do app :)";
        }

      }
      //escolhaUsuario.toLowerCase()==tesoura
      else{
        if(_imgAleatoria[numeroSorteado].toLowerCase()=="pedra"){
          resultado = "Você perdeu para o app:(";
        }else{
          resultado = "Você ganhou do app :)";
        }
      }
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
          children: [
            //text
            Text("Escolha do App:"),
            //imagem
            Image.asset(pathImg, height: 120),
            //text resultado
            Text(escolhaJogador),
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
            Text(resultado),
          ],
        ),
      );
  }
}

