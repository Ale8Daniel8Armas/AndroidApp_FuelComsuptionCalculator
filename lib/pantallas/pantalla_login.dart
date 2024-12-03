import 'package:flutter/material.dart';
import '../logica/logica_login.dart';
import 'pantalla_bienvenida.dart';

class PantallaLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PantallaLoginState();
}

//Pantalla validadora
class PantallaLoginState extends State<PantallaLogin> {

  final TextEditingController controladorUsuario = TextEditingController();
  final TextEditingController controladorContrasena = TextEditingController();
  //Instancia de la clase del modelo de negocio
  final LogicalLogin logicalLogin = LogicalLogin();
  //mensaje
  String mensajeError = '';

  void iniciarSesion() {
    final usuarioSesion = controladorUsuario.text;
    final contrasenaSesion = controladorContrasena.text;

    if (logicalLogin.verificarCrendenciales(usuarioSesion, contrasenaSesion)) {
      //Aquí se implementa la navegación
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PantallaBienvenida(usuarioSesion)
        ),
      );
    } else {
      setState(() {
        mensajeError = "Usuario o contraseña incorrectos";
      });
    };
  }

  //**Diseño*//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFD700), // Amarillo dorado
              Color(0xFFFFE135), // Amarillo brillante
              Color(0xFFFFD700), // Amarillo dorado
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.grey),
                ),
                SizedBox(height: 20),

                // Campo de usuario
                TextField(
                  controller: controladorUsuario,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      hintText: "Usuario",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  style: TextStyle(color: Colors.black),
                ),

                SizedBox(height: 20),

                // Campo de contraseña
                TextField(
                  controller: controladorContrasena,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  style: TextStyle(color: Colors.black),
                ),

                SizedBox(height: 20),

                // Mensaje de error
                if (mensajeError.isNotEmpty)
                  Text(
                    mensajeError,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),

                SizedBox(height: 20),

                // Botón
                ElevatedButton(
                  onPressed: iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD700), // Amarillo dorado
                    foregroundColor: Colors.black, // Texto en negro para contraste
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Iniciar Sesión', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
