import 'package:flutter/material.dart';
import 'pantalla_ingresar_datos.dart';

class PantallaBienvenida extends StatelessWidget{

  final String usuario;


  PantallaBienvenida(this.usuario);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Examen Primer Parcial'),
       backgroundColor: Colors.yellow,
     ),
     body:Center(
       child: Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             'Holaa, $usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 20.0,),
           Text(
             'Bienvenido a la app',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 20.0,),
           ElevatedButton(onPressed: (){
             Navigator.pop(context);
           },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.black26,
                 padding: EdgeInsets.symmetric(horizontal:50, vertical: 15 ),
               ),
             child: Text ('Cerrar Sesión',
               style: TextStyle(
               color: Colors.white, // Cambia el texto a blanco
               fontSize: 18, // Tamaño de fuente más grande
               fontWeight: FontWeight.bold, // Texto en negrita
             ),
             ),
           ),
           const SizedBox(height: 20.0),
           ElevatedButton(onPressed: (){
             Navigator.push(context,
             MaterialPageRoute(builder: (context) => IngresarDatosPage()));
           },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.redAccent,
               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15 ),
             ),
             child: Text ('Ingresar datos',
               style: TextStyle(
               color: Colors.white, // Cambia el texto a blanco
               fontSize: 18, // Tamaño de fuente más grande
               fontWeight: FontWeight.bold, // Texto en negrita
             ),
           ),
           ),
         ],
       )
     ),
   );
  }
}