import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativo Multifunção',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, // Cor principal
      ),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100, // Cor de fundo suave
      appBar: AppBar(
        title: Text('Tela Principal'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange, // Cor personalizada do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // O Center vai garantir que o conteúdo da tela fique centralizado
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alinha os botões no centro vertical
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EscolhaCombustivel()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Escolha de Combustível'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FrasesDoDia()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Frases do Dia'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaJogos()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Tela de Jogos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tela Escolha de Combustível
class EscolhaCombustivel extends StatefulWidget {
  @override
  _EscolhaCombustivelState createState() => _EscolhaCombustivelState();
}

class _EscolhaCombustivelState extends State<EscolhaCombustivel> {
  final TextEditingController alcoolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  final TextEditingController alcoolKmController = TextEditingController();
  final TextEditingController gasolinaKmController = TextEditingController();
  String resultado = '';
  bool isValidInput = true;

  void calcular() {
    double? alcool = double.tryParse(alcoolController.text);
    double? gasolina = double.tryParse(gasolinaController.text);
    double? alcoolKm = double.tryParse(alcoolKmController.text);
    double? gasolinaKm = double.tryParse(gasolinaKmController.text);

    setState(() {
      if (alcool == null ||
          gasolina == null ||
          alcool <= 0 ||
          gasolina <= 0 ||
          alcoolKm == null ||
          gasolinaKm == null ||
          alcoolKm <= 0 ||
          gasolinaKm <= 0) {
        isValidInput = false;
        resultado = 'Por favor, insira valores válidos!';
      } else {
        isValidInput = true;
        // Cálculo do custo por quilômetro para cada combustível
        double custoAlcoolPorKm = alcool / alcoolKm;
        double custoGasolinaPorKm = gasolina / gasolinaKm;

        if (custoAlcoolPorKm < custoGasolinaPorKm) {
          resultado =
              'Álcool é mais vantajoso! Custo por km: R\$${custoAlcoolPorKm.toStringAsFixed(2)}';
        } else {
          resultado =
              'Gasolina é mais vantajosa! Custo por km: R\$${custoGasolinaPorKm.toStringAsFixed(2)}';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha de Combustível'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Digite os preços e a quilometragem do Álcool e da Gasolina:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: alcoolController,
              decoration: InputDecoration(
                labelText: 'Preço do Álcool (R\$)',
                labelStyle: TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                errorText: isValidInput ? null : 'Insira um número válido',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina (R\$)',
                labelStyle: TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                errorText: isValidInput ? null : 'Insira um número válido',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: alcoolKmController,
              decoration: InputDecoration(
                labelText: 'Km por litro (Álcool)',
                labelStyle: TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                errorText: isValidInput ? null : 'Insira um número válido',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: gasolinaKmController,
              decoration: InputDecoration(
                labelText: 'Km por litro (Gasolina)',
                labelStyle: TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                errorText: isValidInput ? null : 'Insira um número válido',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Calcular'),
            ),
            SizedBox(height: 30),
            Text(
              resultado,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isValidInput ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent.shade100,
    );
  }
}

// Tela Frases do Dia
class FrasesDoDia extends StatelessWidget {
  final List<String> frases = [
    'Acredite em si mesmo!',
    'Todo dia é uma nova oportunidade.',
    'Você é capaz de superar qualquer desafio!',
    'A persistência é o caminho do êxito.',
    'Sonhe grande e trabalhe duro!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do Dia'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final random = Random();
                final frase = frases[random.nextInt(frases.length)];
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Frase do Dia'),
                    content: Text(frase),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Gerar Frase'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Jogos
class TelaJogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // O Center vai garantir que o conteúdo da tela fique centralizado
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alinha os botões no centro vertical
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JokenpoGame()),
                  );
                },
                style: customButtonStyle(Colors.red),
                child: Text('Jokenpô'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaraOuCoroa()),
                  );
                },
                style: customButtonStyle(Colors.green),
                child: Text('Cara ou Coroa'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdivinheONumero()),
                  );
                },
                style: customButtonStyle(Colors.blue),
                child: Text('Adivinhe o Número'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ButtonStyle customButtonStyle(Color backgroundColor) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(backgroundColor),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 16, horizontal: 60)),
    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
  );
}

class JokenpoGame extends StatefulWidget {
  @override
  _JokenpoGameState createState() => _JokenpoGameState();
}

class _JokenpoGameState extends State<JokenpoGame> {
  String _playerChoice = '';
  String _computerChoice = '';
  String _result = '';

  final List<String> _choices = ['Pedra', 'Papel', 'Tesoura'];

  void _playGame(String playerChoice) {
    final random = Random();
    _playerChoice = playerChoice;
    _computerChoice = _choices[random.nextInt(3)];
    _result = _getResult();
    setState(() {});
  }

  String _getResult() {
    if (_playerChoice == _computerChoice) {
      return 'Empate!';
    } else if (_playerChoice == 'Pedra' && _computerChoice == 'Tesoura' ||
        _playerChoice == 'Papel' && _computerChoice == 'Pedra' ||
        _playerChoice == 'Tesoura' && _computerChoice == 'Papel') {
      return 'Você venceu!';
    } else {
      return 'Você perdeu!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpô'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha sua jogada:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _playGame('Pedra'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/pedra.png',
                          width: 25, height: 35),
                      Text('Pedra'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _playGame('Papel'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/papel.png',
                          width: 25, height: 35),
                      Text('Papel'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _playGame('Tesoura'),
                  child: Column(
                    children: [
                      Image.asset('assets/images/tesoura.png',
                          width: 25, height: 35),
                      Text('Tesoura'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (_playerChoice.isNotEmpty) ...[
              Text('Sua escolha: $_playerChoice',
                  style: TextStyle(fontSize: 18)),
              Image.asset('assets/images/${_playerChoice.toLowerCase()}.png',
                  width: 50, height: 50),
              Text('Escolha do computador: $_computerChoice',
                  style: TextStyle(fontSize: 18)),
              Image.asset('assets/images/${_computerChoice.toLowerCase()}.png',
                  width: 50, height: 50),
              SizedBox(height: 20),
              Text(_result,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
    );
  }
}

class CaraOuCoroa extends StatefulWidget {
  @override
  _CaraOuCoroaState createState() => _CaraOuCoroaState();
}

class _CaraOuCoroaState extends State<CaraOuCoroa> {
  String _playerChoice = '';
  String _result = '';
  String _coinImage = '';

  void _flipCoin(String playerChoice) {
    final random = Random();
    _playerChoice = playerChoice;
    final coinFlip = random.nextBool() ? 'Cara' : 'Coroa';
    _result = _playerChoice == coinFlip ? 'Você acertou!' : 'Você errou!';
    _coinImage = coinFlip == 'Cara'
        ? 'cara.png'
        : 'coroa.png'; // Definir a imagem com base no resultado
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha: Cara ou Coroa?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _flipCoin('Cara'),
                  child: Text('Cara'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _flipCoin('Coroa'),
                  child: Text('Coroa'),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (_playerChoice.isNotEmpty) ...[
              Text('Sua escolha: $_playerChoice',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              // Exibir a imagem da escolha do resultado
              Image.asset(
                'assets/images/$_coinImage',
                width: 100, // Ajuste o tamanho conforme necessário
                height: 100, // Ajuste o tamanho conforme necessário
              ),
              SizedBox(height: 20),
              Text('Resultado: $_result',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
    );
  }
}

class AdivinheONumero extends StatefulWidget {
  @override
  _AdivinheONumeroState createState() => _AdivinheONumeroState();
}

class _AdivinheONumeroState extends State<AdivinheONumero> {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();
  int _randomNumber = 0;
  String _feedback = '';
  int _attempts = 0;

  @override
  void initState() {
    super.initState();
    _generateNewNumber();
  }

  void _generateNewNumber() {
    _randomNumber = _random.nextInt(100) + 1;
  }

  void _checkGuess() {
    setState(() {
      _attempts++;
      final guess = int.tryParse(_controller.text);

      if (guess == null) {
        _feedback = 'Por favor, insira um número válido.';
      } else if (guess < 1 || guess > 100) {
        _feedback = 'Por favor, insira um número entre 1 e 100.';
      } else if (guess < _randomNumber) {
        _feedback = 'Tente um número maior!';
      } else if (guess > _randomNumber) {
        _feedback = 'Tente um número menor!';
      } else {
        _feedback = 'Parabéns! Você acertou em $_attempts tentativas!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o Número'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Adivinhe o número entre 1 e 100:',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Seu Palpite',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('Verificar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16, horizontal: 60)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _feedback,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
