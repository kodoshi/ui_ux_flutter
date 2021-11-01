import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banking_app/pages/component/dropdown.dart';
import 'package:banking_app/pages/profile_page.dart';
import 'package:banking_app/pages/component/header_profile.dart';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';

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
      backgroundColor: getTheme('backgroundColor'),
      appBar: AppBar(
        leading: BackButton(
          color: getTheme('secondaryTextColor'),
        ),
        title: Text(
          getText('amountText'),
          style: TextStyle(
            color: getTheme('secondaryTextColor'),
          ),
        ),
        centerTitle: true,
        backgroundColor: getTheme('backgroundColor'),
      ),
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 140.0,
                  child: HeaderProfile(),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  getText('availableText'),
                  style: TextStyle(
                      color: getTheme('secondaryTextColor'),
                      fontSize: 18.0), //backgroundColor
                ),
                const Text(
                  "€ 3,150.70",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                  padding: EdgeInsets.only(top: 52),
                  child: const DropdownMenu(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: const TextField(
                    decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        hintText: '0,000'),
                    style: TextStyle(
                      fontSize: 42.0,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ]),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    getText('commissionText'),
                    style: TextStyle(
                      color: getTheme('secondaryTextColor'),
                      fontSize: 18.0,
                    ), //backgroundColor
                  ),
                  const Text(
                    "€ 3.97",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: Container(
                  child: RaisedButton(
                    onPressed: () {
                      AlertDialog alert = AlertDialog(
                        title: Text(getText('fundsSentText')),
                        //content: Icon(Icons.mail_outline),
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
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff374ABE),
                            Color(0xff64B6FF)
                          ], //backgroundColor
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 70.0),
                        alignment: Alignment.center,
                        child: Text(
                          getText('sendFundsText'),
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
      bottomNavigationBar: Footer(page: "home"),
    );
  }
}
