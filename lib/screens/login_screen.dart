import 'package:flutter/material.dart';
import 'package:ge01_crud_front/config/session_manager.dart';
import 'package:ge01_crud_front/providers/login_provider.dart';
import 'package:ge01_crud_front/widgets/input_decoration.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [purpleBox(size), personIcon(), loginForm(context)],
        ),
      ),
    );
  }

  SingleChildScrollView loginForm(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 380),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 30),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: (value){
                                  return EmailValidator.validate(value.toString())
                                  ? null
                                  : 'El valor ingresado no es un correo electronico';
                            },  
                          autocorrect: false,
                          decoration: InputDecorations.authInputDecoration(
                            hintText: 'ejemplo@micorreo.com',
                            labelText: 'Correo electrónico',
                            prefixIcon: Icons.alternate_email_outlined,
                                
                          ),

                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: passwordController,
                          validator: (value){
                                  return (value != null && value.length >= 6)
                                  ? null
                                  : 'La contraseña debe tener al menos 6 caracteres';
                          },
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecorations.authInputDecoration(
                            hintText: '**********',
                            labelText: 'Contraseña',
                            prefixIcon: Icons.lock_outline_rounded
                          )
                        ),
                        SizedBox(height: 30),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledColor: Colors.grey,
                          onPressed: () async {
                            final email = emailController.text;
                            final password = passwordController.text;
                            await loginProvider.login(email, password);
                            if (SessionManager.authToken != null && SessionManager.authToken!.isNotEmpty) {
                              Navigator.pushReplacementNamed(context, 'home');
                            }
                            // Navigator.pushReplacementNamed(context, 'home');
                          },
                          color: Colors.deepPurple,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            child: Text('Ingresar', style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ]
                    )
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  SafeArea personIcon() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 55),
        width: double.infinity,
        child: Icon(Icons.person_pin, color: Colors.white, size: 150),
      ),
    );
  }

  Container purpleBox(Size size) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: purpleCircle()),
          Positioned(top: -40, left: -30, child: purpleCircle()),
          Positioned(top: -50, left: -20, child: purpleCircle()),
          Positioned(bottom: -50, left: 10, child: purpleCircle()),
          Positioned(bottom: 120, right: -20, child: purpleCircle()),
        ],
      ),
    );
  }

  Container purpleCircle() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
