runCode() is mocked here — you should replace it with an API call or embed a Python interpreter (e.g., via pyodide
 in Flutter Web, or your backend).
import 'package:flutter/material.dart';

void main() {
  runApp(CodeRunnerApp());
}

class CodeRunnerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Runner',
      home: CodeRunnerScreen(),
    );
  }
}

class CodeRunnerScreen extends StatefulWidget {
  @override
  _CodeRunnerScreenState createState() => _CodeRunnerScreenState();
}

class _CodeRunnerScreenState extends State<CodeRunnerScreen> {
  final TextEditingController _codeController = TextEditingController(text: "print(2 + 3)\nprint('Hello world!')");
  String _output = "";

  // Simulated run function: in a real app call your backend or embed interpreter
  Future<String> runCode(String code) async {
    // TODO: Replace with actual backend call or interpreter
    await Future.delayed(Duration(seconds: 1)); // simulate delay

    // Simulate running code:
    if (code.contains("print(2 + 3)")) {
      return "5\nHello world!";
    } else {
      return "Output not implemented for this code.";
    }
  }

  void _onRunPressed() async {
    setState(() {
      _output = "Running...";
    });

    final result = await runCode(_codeController.text);

    setState(() {
      _output = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Python Code Runner")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black87,
                  ),
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: _codeController,
                      maxLines: null,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _onRunPressed,
                child: Text("Run"),
              ),
              SizedBox(height: 12),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _output,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}