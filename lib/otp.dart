// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
//
//
// class Otp_Field extends StatefulWidget {
//   const Otp_Field({Key? key}) : super(key: key);
//
//   @override
//   State<Otp_Field> createState() => _Otp_FieldState();
// }
//
// class _Otp_FieldState extends State<Otp_Field> {
//   OtpFieldController otpController = OtpFieldController();
//   late String pinCode;
//   String? otp;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           OTPTextField(
//             controller: otpController,
//             length: 4,
//             keyboardType: TextInputType.number,
//             width: MediaQuery.of(context).size.width,
//             textFieldAlignment: MainAxisAlignment.spaceEvenly,
//             fieldWidth: 50,
//             contentPadding: EdgeInsets.all(11),
//             fieldStyle: FieldStyle.box,
//             outlineBorderRadius: 15,
//             obscureText: true,
//
//             style: TextStyle(fontSize: 17, height: 2.2),
//             onChanged: (pin) {
//               print("Changed: " + pin);
//
//               pinCode = pin;
//             },
//             onCompleted: (pin) {
//               if (pin.isNotEmpty) {
//                 print("Completed: " + pin);
//               } else {}
//             },
//           ),
//           SizedBox(height: 20,),
//          InkWell(
//            child:  Container(
//              height: 50,
//              width: 200,
//              decoration: BoxDecoration(
//                color: Colors.blueGrey,
//                borderRadius: BorderRadius.circular(20),
//              ),
//              child: Center(
//                child: Text("Verify",
//                  style: TextStyle(
//                    color: Colors.white,
//
//                  ),
//                ),
//              ),
//            ),
//            onTap: () {
//              print("$otp,$otpController");
//              if ((pinCode.isEmpty || pinCode.length != 4)) {
//                Fluttertoast.showToast(
//                    msg: "Please fill all field",
//                    backgroundColor: Colors.orange.shade500);
//                } else {
//                  print("OTP==========${otpController}");
//                }
//              }
//            }
//          )
//         ],
//       ),
//     );
//   }
// }

