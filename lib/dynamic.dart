import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Dynamicpage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dynamicpage> {
  final _controller = TextEditingController();
  late FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              controller: _controller,
              focusNode: myFocusNode,
              maxLength: 10,
              textCapitalization: TextCapitalization.characters,
              keyboardType: (_controller.text.length < 5 || _controller.text.length >= 9) ? TextInputType.name : TextInputType.number,
              onChanged: (text) {
                if (_controller.text != text.toUpperCase()) {
                  _controller.value = _controller.value.copyWith(text: text.toUpperCase());
                }
                if (_controller.text.length == 5){
                  setState(() {
                    myFocusNode.unfocus();
                    Future.delayed(const Duration(milliseconds: 50)).then((value) {
                      myFocusNode.requestFocus();
                    });
                  });
                }
                if (_controller.text.length == 9){
                  setState(() {
                    myFocusNode.unfocus();
                    Future.delayed(const Duration(milliseconds: 50)).then((value) {
                      myFocusNode.requestFocus();
                    });
                  });
                }
              },

              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$'))
              ],
              decoration: const InputDecoration(labelText: 'Panvalidation')),
        ),
      ),
    );
  }
}