
import 'dart:convert';



// class ErrorMessageModel {
//     final int code;
//     final String message;

//     ErrorMessageModel({
//         required this.code,
//         required this.message,
//     });

//     factory ErrorMessageModel.fromJson(String str) => ErrorMessageModel.fromMap(json.decode(str));

   

//     factory ErrorMessageModel.fromMap(Map<String, dynamic> json) => ErrorMessageModel(
//         code: json["code"],
//         message: json["message"],
//     );

   
// }




class ErrorMessageModel {
    final bool success;
    final Error error;

    ErrorMessageModel({
        required this.success,
        required this.error,
    });

    factory ErrorMessageModel.fromJson(String str) => ErrorMessageModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ErrorMessageModel.fromMap(Map<String, dynamic> json) => ErrorMessageModel(
        success: json["success"],
        error: Error.fromMap(json["error"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "error": error.toMap(),
    };
}

class Error {
    final int code;
    final String message;

    Error({
        required this.code,
        required this.message,
    });

    factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Error.fromMap(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
    };
}
