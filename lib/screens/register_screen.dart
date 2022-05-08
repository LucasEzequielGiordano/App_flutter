import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app1/providers/providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.indigo,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 35),
            const Icon(Icons.supervised_user_circle,
                size: 200, color: Colors.white),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Iniciar Sesión',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          validator: (value) =>
                              value!.length < 5 ? 'correo no valido' : null,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email_outlined),
                              hintText: 'Ingrese su correo'),
                        ),
                        TextFormField(
                          validator: (value) =>
                              value!.length < 3 ? 'contraseña no valida' : null,
                          obscureText: true,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password_outlined),
                              hintText: 'Contraseña'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('todo validado');
                            } else {
                              print('no se pudo validar');
                            }
                          },
                          child: const Text('Ingresar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
