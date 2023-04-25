import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signature Demo',
      home: SignaturePage(),
    );
  }
}

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: _controller,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              backgroundColor: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             ElevatedButton(
                child: Text('Clear'),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                },
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final signature = await _controller.toPngBytes();
                    // Do something with the signature, like upload to server or save to local storage
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
