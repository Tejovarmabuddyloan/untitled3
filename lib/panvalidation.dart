import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class PanValidationForm extends StatefulWidget {
  @override
  _PanValidationFormState createState() => _PanValidationFormState();
}

class _PanValidationFormState extends State<PanValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  late FocusNode focus = FocusNode();
  bool _acceptChars = true;
  int timerforformfields = 50;
  late int position;
  String panregex = r'[A-Z]{3}[A B C F G H L J P T]{1}[A-Z]{1}[0-9]{4}[A-Z]{1}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAN Validation'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: TextFormField(
                controller: _controller,
                focusNode: focus,
                maxLength: 10,
                textCapitalization: TextCapitalization.characters,
                keyboardType: _acceptChars
                    ? TextInputType.text
                    : TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,


                onTap: () {
                  if(_controller.text.isNotEmpty)
                  {
                    position =  _controller.selection.base.offset;
                    log("jzdhvcbz skdfjhvb   $position");
                    if((position >= 0 && position <= 4) || (position >=9 && position <= 10) && !_acceptChars){
                      setState(() {
                        print('djfhdvfb  1');
                        FocusManager.instance.primaryFocus?.unfocus();
                        _acceptChars = true;

                        Timer(Duration(milliseconds: timerforformfields), () {
                          FocusScope.of(context).requestFocus(focus);
                        });
                      });
                    }
                    if(position >= 5 && position <= 8 &&_acceptChars ) {
                      log("djfhdvfb 2");
                      setState(() {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _acceptChars = false;

                        Timer(Duration(milliseconds: timerforformfields), () {

                          FocusScope.of(context).requestFocus(focus);
                        });
                      });
                    }
                    //  isCursor = true;
                    setState(() {

                    });
                  }

                },
                onChanged: (text) {

                  setState(() {});

                  position = _controller.selection.base.offset;
                  if ((position == 0 || position == 9 || position == 10 || position == 4) &&
                      !_acceptChars) {
                    setState(() {
                      print("wefewfewfwe   ${position}");
                      FocusManager.instance.primaryFocus?.unfocus();
                      _acceptChars = true;
                      Timer(Duration(milliseconds: timerforformfields), () {
                        FocusScope.of(context).requestFocus(focus);
                      });
                    });
                  } else if ((position == 5 || position == 8) && _acceptChars) {
                    print("bjberfjbjgbejg ${position}");
                    setState(() {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _acceptChars = false;
                      Timer(Duration(milliseconds: timerforformfields), () {
                        FocusScope.of(context).requestFocus(focus);
                      });
                    });
                  }
                  if (_controller.text != text.toUpperCase()) {
                    _controller.value =
                        _controller.value.copyWith(text: text.toUpperCase());
                  }
                },

                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  }

                  if (value.length != 10) {
                    // User is still entering PAN, no need to validate yet
                    return null;
                  }


                    if (!RegExp(panregex).hasMatch(value)) {
                      return 'PAN is not valid';
                    }



                  return null;
                },


                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp("[0-9A-Z]")),
                ],
                decoration: const InputDecoration(labelText: 'PAN Validation'),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (_formKey.currentState!.validate()) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: Text('Validated')));
            //     }
            //   },
            //   child: Text('Validate'),
            // ),
          ],
        ),
      ),
    );
  }

  // getKeyboardType() {
  //   position = _controller.selection.base.offset;
  //   if ((position == 0 || position == 9 || position == 10 || position == 4) &&
  //       !_acceptChars) {
  //     setState(() {
  //       print("wefewfewfwe   ${position}");
  //       FocusManager.instance.primaryFocus?.unfocus();
  //       _acceptChars = true;
  //       Timer(Duration(milliseconds: timerforformfields), () {
  //         FocusScope.of(context).requestFocus(focus);
  //       });
  //     });
  //   } else if ((position == 5 || position == 8) && _acceptChars) {
  //     print("bjberfjbjgbejg ${position}");
  //     setState(() {
  //       FocusManager.instance.primaryFocus?.unfocus();
  //       _acceptChars = false;
  //       Timer(Duration(milliseconds: timerforformfields), () {
  //         FocusScope.of(context).requestFocus(focus);
  //       });
  //     });
  //   }
  // }

}
