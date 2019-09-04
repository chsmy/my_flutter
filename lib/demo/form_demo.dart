import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RegisterFormDemo()
              ],
            ),
          )),
    );
  }
}

class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username,password;
  bool autovalidate = false;
  void submitRegisterForm() {
    if(registerFormKey.currentState.validate()){
      registerFormKey.currentState.save();
      debugPrint('username:$username');
      debugPrint('password:$password');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("正在注册....")));
    }else{
      setState(() {
        autovalidate = true;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration:InputDecoration(
              labelText: 'username',
            ),
            onSaved: (value){
              username = value;
            },
            validator: validatorUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration:InputDecoration(
              labelText: 'password',
            ),
            onSaved: (value){
              password = value;
            },
            validator: validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 32),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColorDark,
                elevation: 0.0,
                child: Text("register",style: TextStyle(color: Colors.white),),
                onPressed: submitRegisterForm),
          )
        ],
      ),
    );
  }


  String validatorUsername(String value) {
    if(value.isEmpty){
      return '用户名不能为空';
    }
    return null;
  }

  String validatorPassword(String value) {
    if(value.isEmpty){
      return '密码不能为空';
    }
    return null;
  }
}



class TextFileDemo extends StatefulWidget {
  @override
  _TextFileDemoState createState() => _TextFileDemoState();
}

class _TextFileDemoState extends State<TextFileDemo> {

  final TextEditingController textEditController = TextEditingController();

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }

  @override
  void initState() {
//    textEditController.text='hai';
    textEditController.addListener((){
      debugPrint('text：${textEditController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditController,
//      onChanged: (value){
//        debugPrint('intput+$value');
//      },
      onSubmitted: (value){
        debugPrint('Submitted+$value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        hintText: "请输入",
        labelText: "name",
//        border: InputBorder.none
//      border: OutlineInputBorder()
      filled: true
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: TextFileDemo(),
    );
  }
}
