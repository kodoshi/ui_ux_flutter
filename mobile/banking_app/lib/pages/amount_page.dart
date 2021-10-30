
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banking_app/pages/component/dropdown.dart';


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
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 59,
                width: 59,
                color: Colors.pink,
                child: Text("Maria Callas"),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available :", style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  const Text("£ 3,150.70", style: TextStyle(fontWeight: FontWeight.bold),
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
                        "Commission :", style: TextStyle(color: Colors.black.withOpacity(0.8)),
                      ),
                      const Text("£ 3.30", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                  ),
                ),
                
             Container(
                height: 50.0,
                margin: const EdgeInsets.only(top: 80.0),
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                     gradient:  LinearGradient(
                       colors: [ Color(0xff374ABE), Color(0xff64B6FF)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),
                 child: Container(
                   constraints:
                       const BoxConstraints(minHeight: 50.0),
                   alignment: Alignment.center,
                   child: const Text(
                     "Send money",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 15),
                   ),
                 ),
               ),
             ),
           ),
           
            ],
          ),
        ),
      ),
    );
  }
}
