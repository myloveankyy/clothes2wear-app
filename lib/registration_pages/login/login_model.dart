import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  int? registrationSHOW = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Login)] action in Login widget.
  ApiCallResponse? autoLoginAPI;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for login-email widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  // State field(s) for login-password widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in login-btn widget.
  ApiCallResponse? loginApi;
  // State field(s) for PageView widget.
  PageController? pageViewController3;

  int get pageViewCurrentIndex3 => pageViewController3 != null &&
          pageViewController3!.hasClients &&
          pageViewController3!.page != null
      ? pageViewController3!.page!.round()
      : 0;
  // State field(s) for register-email widget.
  FocusNode? registerEmailFocusNode;
  TextEditingController? registerEmailTextController;
  String? Function(BuildContext, String?)? registerEmailTextControllerValidator;
  // State field(s) for register-password widget.
  FocusNode? registerPasswordFocusNode;
  TextEditingController? registerPasswordTextController;
  late bool registerPasswordVisibility;
  String? Function(BuildContext, String?)?
      registerPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send Email Password)] action in register-proceed-btn widget.
  ApiCallResponse? aPIRegister1;
  // State field(s) for Enter-OTP-textbox widget.
  FocusNode? enterOTPTextboxFocusNode;
  TextEditingController? enterOTPTextboxTextController;
  String? Function(BuildContext, String?)?
      enterOTPTextboxTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send Email and OTP)] action in otp-proceed-btn widget.
  ApiCallResponse? apiOtp;
  // State field(s) for First-name-textbox widget.
  FocusNode? firstNameTextboxFocusNode;
  TextEditingController? firstNameTextboxTextController;
  String? Function(BuildContext, String?)?
      firstNameTextboxTextControllerValidator;
  // State field(s) for Last-name-textbox widget.
  FocusNode? lastNameTextboxFocusNode;
  TextEditingController? lastNameTextboxTextController;
  String? Function(BuildContext, String?)?
      lastNameTextboxTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send First and Last Name)] action in final-register-btn widget.
  ApiCallResponse? finalRegisterApi;

  @override
  void initState(BuildContext context) {
    loginPasswordVisibility = false;
    registerPasswordVisibility = false;
  }

  @override
  void dispose() {
    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();

    registerEmailFocusNode?.dispose();
    registerEmailTextController?.dispose();

    registerPasswordFocusNode?.dispose();
    registerPasswordTextController?.dispose();

    enterOTPTextboxFocusNode?.dispose();
    enterOTPTextboxTextController?.dispose();

    firstNameTextboxFocusNode?.dispose();
    firstNameTextboxTextController?.dispose();

    lastNameTextboxFocusNode?.dispose();
    lastNameTextboxTextController?.dispose();
  }
}
