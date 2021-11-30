import 'package:flutter/material.dart';
import 'package:mfp_app/constants/colors.dart';
import 'package:mfp_app/view/Auth/register-pic.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Registerpassword extends StatefulWidget {
  Registerpassword({Key key}) : super(key: key);

  @override
  _RegisterpasswordState createState() => _RegisterpasswordState();
}

class _RegisterpasswordState extends State<Registerpassword> {
  final _key = GlobalKey<FormState>();
  bool isvis = false;
  bool iserror = false;

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  String msg;
    bool _autoValidate = false;

void _validateInputs() {
    if (_key.currentState.validate()) {
      print('submit');
//    If all data are correct then save data to out variables
      _key.currentState.save();
                                   Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PicProfile()),
                          );

    } else {
      print(' data are not valid');

//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    //--------------------อีเมล----------------------//
    final TextFormField _txtPassword = TextFormField(
        controller: _pass,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'รหัสผ่าน',
          contentPadding: EdgeInsets.only(left: 30, top: 8),
          border: InputBorder.none,
          suffixIcon: InkWell(
              // onTap: _togglePasswordView,
              child: Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: isvis == false
                      ? null
                      : Icon(
                          Icons.check,
                          color: MColors.primaryColor,
                        ))),
        ),
        keyboardType: TextInputType.text,
        autocorrect: false,
        validator: validatepassword);
    final TextFormField _txtCPassword = TextFormField(
        controller: _confirmPass,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'ใส่หรัสผ่านอีกครั้ง',
          contentPadding: EdgeInsets.only(left: 30, top: 8),
          border: InputBorder.none,
          suffixIcon: InkWell(
              // onTap: _togglePasswordView,
              child: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: isvis == false
                ? null
                : Icon(
                    Icons.check,
                    color: MColors.primaryColor,
                  ),
          )),
        ),
        keyboardType: TextInputType.text,
        autocorrect: false,
        validator: validatepassword);

    return Form(
      key: _key,
            autovalidate: _autoValidate,

      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/shutterstock_553511089.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        print('กด');
                      },
                    ),
                    Spacer(),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/MFP-Logo-Horizontal.png'),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'สวัสดี,\n',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                              text: 'ยินดีต้อนรับเข้าสู่ แพลตฟอร์ม\n',
                              style: TextStyle(fontSize: 25)),
                          TextSpan(
                              text: 'ก้าวไกลทูเดย์',
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'กรุณาใส่ตั้งรหัสผ่าน',
                        style: TextStyle(fontSize: 17, color: Colors.grey[100]),
                      ),
                    ],
                  ),
                ),
              ),
              //--------------------อีเมล----------------------//
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.2, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _txtPassword,
                ),
              ),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.86,
              ),
              //--------------------อีเมล----------------------//
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.2, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _txtCPassword,
                ),
              ),
          iserror == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              msg,
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          )
                        : Container(),
  
               Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '● รหัสผ่านควรมากกว่า 6 ตัวอักษรขึ้นไป,\n',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                              text:
                                  '● ประกอบด้วยตัวอักขระพิเศษอย่างน้อย 1 ตัว\n',
                              style: TextStyle(fontSize: 16)),
                          TextSpan(
                              text: '● ต้องมีตัวพิมพ์ใหญ่อย่างน้อย 1 ตัว',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.86,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.red)),
                        child: Text(
                          'ถัดไป',
                          style: TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.white,
                        color: Colors.orange[400],
                        onPressed: () {
                                                          _validateInputs();
                                             
                          // if (_key.currentState.validate()) {
                          //      Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => PicProfile()),
                          // );
                          // }
                         


                         
             
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Center(
                  child: Text(
                    '© 2021 พรรคก้าวไกล. ALL RIGHTS RESERVED.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  String validatepassword(String formPassword) {
    if (formPassword.isEmpty) return 'Password is required';
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(formPassword)) {
      msg='กรุณาตั้ง Password ให้ถูกต้องการเงือนไข';  
      setState(() {
        iserror = true;
      });
    }else{
      setState(() {
              isvis = false;
        iserror = false;
      });
    }
    if (formPassword != _pass.text) {
     msg='Passwordไม่ตรงกัน';

      setState(() {
        iserror = true;
      });
    }else{
      setState(() {
              isvis = false;
        iserror = false;
      });
    }

 
    return null;
  }
}