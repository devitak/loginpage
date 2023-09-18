import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
          image: const AssetImage("assets/image/photo3.jpg"),
          fit: BoxFit.cover,
          colorFilter:
            ColorFilter.mode(Colors.blueAccent.withOpacity(0.5), BlendMode.dstATop),
        ),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 50, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_city_outlined,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "You're On The Login Page",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            color: Colors.blueAccent, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Enter The Data Correctly!"),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password address"),
        _buildInputField(passwordController,isPassword: true),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),

      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
    {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Colors.blue,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }
 Widget _buildOtherLogin(){
   return Center(
     child: Column(
       children: [
         _buildGreyText("Or Login with"),
         const SizedBox(height: 10),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Tab(icon:Image.asset("assets/image/photoGoogle.jpg")),
             Tab(icon:Image.asset("assets/image/photoFb.png")),
             Tab(icon:Image.asset("assets/image/photoTwitter.png")),
           ],
         )
       ],
     ),
   );
 }
}

