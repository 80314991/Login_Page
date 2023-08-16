import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color mycolor;
  late Size mediasize;
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passcontrollar = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    mediasize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: mycolor,
        image:DecorationImage(image: AssetImage("assets/images/download (2).jpeg"),
        fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(mycolor.withOpacity(0.2), BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80 ,child: _buildTop()),
            Positioned(bottom: 0 ,child: _buildButton())
          ],
        ),
      ),
    );
  }
  Widget _buildTop(){
    return SizedBox(
      width: mediasize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Colors.white,
          ),
          Text("GO MAP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
            letterSpacing: 2
          ),
          )
        ],
      ),
    );
  }
  Widget _buildButton(){
    return SizedBox(
      width: mediasize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: _buildFormat(),
        ),
      ),
    );
  }
  Widget _buildFormat(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Welcome" ,
          style:TextStyle(
            color: mycolor,
            fontSize: 32,
            fontWeight: FontWeight.w500
          ) ,),
        _buildGrayText("please login white your information"),
        const SizedBox(height: 60,),
        _buildGrayText("Email address"),
        _buildInputField(emailcontrollar),
        const SizedBox(height: 40,),
        _buildInputField(passcontrollar),
        _buildGrayText("password address"),
        const SizedBox(height: 20,),
        _buildRememberForgot(),
        const SizedBox(height: 20,),
        _buildLoginButton(),
        const SizedBox(height: 20,),
        _buildOtherLogin()


      ],
    );
  }
  Widget _buildGrayText(String text){
    return Text(text ,
    style: TextStyle(color: Colors.grey),);
  }
  Widget _buildInputField(TextEditingController controller ,{ispassword =false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: ispassword ?Icon(Icons.remove_red_eye) : Icon(Icons.done)
      ),
      obscureText: ispassword,
    );
  }
  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
        children: [
          Checkbox(value: rememberUser, onChanged: (value){
            setState(() {
              rememberUser = value! ;
            });
          }),
          _buildGrayText("Remember me")
        ],
        ),
        TextButton(onPressed: (){}, child: _buildGrayText("Forget my password"))
      ],
    );
  }
  Widget _buildLoginButton(){
    return ElevatedButton(onPressed: (){
      debugPrint("Email : ${emailcontrollar.text}");
      debugPrint("password : ${passcontrollar.text}");
    },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: mycolor,
          minimumSize: const Size.fromHeight(60),
        ), child: const Text("LOGIN"));
  }
  Widget _buildOtherLogin(){
    return Center(
      child: Column(
        children: [
          _buildGrayText("Or Login With"),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tab(icon: Image.asset("assets/images/download (1).jpeg"),),
              Tab(icon: Image.asset("assets/images/download.jpeg"),),
              Tab(icon: Image.asset("assets/images/download.png"),)
            ],
          )
        ],
      ),
    );
  }
}
