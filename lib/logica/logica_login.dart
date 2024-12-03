class LogicalLogin {
  bool verificarCrendenciales(String usuario, String contrasena){
    const usuarioValido = "inge";
    const contrasenaValida = "123456";
    return usuario == usuarioValido && contrasena==contrasenaValida;
  }
}