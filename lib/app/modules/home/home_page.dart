import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  TextEditingController? _number1 = TextEditingController();
  TextEditingController? _number2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Calculator'),
        centerTitle: true,
      ),
      body: ScopedBuilder<HomeStore, Exception, String>(
        store: store,
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onState: (_, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    child: TextFormField(
                        controller: _number1,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                          labelText: 'First binary number',
                        ),
                        validator: (String? val) {
                          if (int.parse(val!, radix: 2) < 0 ||
                              int.parse(val, radix: 2) > 255)
                            return 'This number is greater than 255 or lower than 0.';
                        }),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 280,
                    child: TextFormField(
                        controller: _number2,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                          labelText: 'Second binary number',
                        ),
                        validator: (String? val) {
                          if ((int.parse(val!, radix: 2) < 0 &&
                                  int.parse(val, radix: 2) > 255 ||
                              int.parse(val) < 0 && int.parse(val) > 255))
                            return 'This number is greater than 255 or lower than 0.';
                        }),
                  ),
                  SizedBox(height: 40),
                  Divider(
                    color: Colors.grey[700],
                    height: 2,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$state',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.addition(_number1?.text, _number2?.text);
                            }
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minimumSize: Size(50, 50),
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.subtraction(_number1?.text, _number2?.text);
                            }
                          },
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minimumSize: Size(50, 50),
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.multiplication(
                                  _number1?.text, _number2?.text);
                            }
                          },
                          child: Text(
                            '*',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minimumSize: Size(50, 50),
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.division(_number1?.text, _number2?.text);
                            }
                          },
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minimumSize: Size(50, 50),
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.percent(_number1?.text, _number2?.text);
                            }
                          },
                          child: Text(
                            '%',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minimumSize: Size(50, 50),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        onError: (context, error) => _show(error),
      ),
    );
  }

  _show(Exception? error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error.toString()),
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.red,
    ));
  }
}
