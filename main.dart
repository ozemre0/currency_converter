import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _moneyIn = TextEditingController();
  double _convertedValue = 32.89;
  double _won = 1452.89;
  double _canadaDollar = 1.46;
  void _convertCurrency(String newValue) {
   
    final inputValue = double.tryParse(newValue);
    if (inputValue != null && newValue.isNotEmpty) {
      setState(() {
        _convertedValue = inputValue * 32.89;
        _won = inputValue * 1452.89;
        _canadaDollar = inputValue * 1.46;
        
      });
    } else {
      setState(() {
        _convertedValue = 32.89;
        _won = 1452.89;
        _canadaDollar = 1.46;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text("Currency Converter"),
          backgroundColor: Colors.amber,
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.attach_money_rounded),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.money,
                size: 75,
              ),
              const SizedBox(height: 20),
              const Text(
                "CURRENCY CONVERTER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    30, 10, 30, 0), // Corrected closing parenthesis
                child: SizedBox(
                  height: 65,
                  width: 400,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage("images/euflag.png"),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Card(
                          child: TextField(
                            controller: _moneyIn,
                            onChanged: _convertCurrency,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "1 EURO",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: SizedBox(
                  height: 65,
                  width: 400,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage('images/trflag.png'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Card(
                          child: Center(
                              child: Text(
                                  '${_convertedValue.toStringAsFixed(2)} (TRY)')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: SizedBox(
                  height: 65,
                  width: 400,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage('images/koreaflag.jpg'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Card(
                          child: Center(
                              child: Text('${_won.toStringAsFixed(2)} (WON)')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                child: SizedBox(
                  height: 65,
                  width: 400,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage('images/canadaflag.jpg'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Card(
                          child: Center(
                              child: Text(
                                  '${_canadaDollar.toStringAsFixed(2)} (CD\$)')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
