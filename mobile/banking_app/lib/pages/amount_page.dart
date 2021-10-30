
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banking_app/pages/component/dropdown.dart';
import 'package:banking_app/pages/profile_page.dart';
import 'package:banking_app/pages/component/header_profile.dart';


class AmountPage extends StatefulWidget {
  const AmountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AmountPageState();
  }
}

class _AmountPageState extends State<AmountPage> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amounts"),
      ),
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
        child: SingleChildScrollView(
          child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:40),
                child: SizedBox(
                height: 140.0,
                child:  HeaderProfile(),
              ),
            ),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available: ", style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18.0), //backgroundColor
                  ),
                  const Text("£ 3,150.70", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                ]
              ),
              const DropdownMenu(),          
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                child: 
                    TextField(
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '00,00.00'
                    ),
                    style: const TextStyle(
                    fontSize: 42.0,
                      ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
              ),
              
               Container(
                  margin: const EdgeInsets.only(top: 60.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Commission: ", style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18.0,), //backgroundColor
                      ),
                      const Text("£ 3.30", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,
),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 15),
                  child: Container(
                    child: RaisedButton(
                    onPressed: () {
                            const AlertDialog alert = AlertDialog(
                              title: Text("Your money has been sent !"),
                              content: Icon(Icons.mail_outline),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient:  LinearGradient(
                          colors: [ Color(0xff374ABE), Color(0xff64B6FF)], //backgroundColor
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                    ),
                    child: Container(
                      constraints:
                      const BoxConstraints(minHeight: 70.0),
                      alignment: Alignment.center,
                      child: const Text (
                        "Send money",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
