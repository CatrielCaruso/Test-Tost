class ValidationHelper {
  static bool isValidEmail(String value) {
    return RegExp(r'\S+@\S+\.\S+'
            //r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
            )
        .hasMatch(value);
    //  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  }

  static String? onErrorEmail(value) {
    if (value!.trim().isEmpty) {
      return 'El email es obligatorio';
    }
    if (!ValidationHelper.isValidEmail(value)) {
      return 'El email ingresado no es válido.';
    }
    return null;
  }

  static String? onErrorPassword(value) {
    if (value.toString().isEmpty) return 'El campo es requerido';
    if (value.toString().trim().isEmpty) return 'El campo es requerido';

    return null;
  }

  static String? onErrorFieldEmpty(value) {
    if (value.toString().isEmpty) return 'El campo es requerido';
    if (value.toString().trim().isEmpty) return 'El campo es requerido';

    return null;
  }

 
}
