import '/components/empty_listview_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'support_page_widget.dart' show SupportPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SupportPageModel extends FlutterFlowModel<SupportPageWidget> {
  ///  Local state fields for this page.

  bool isTyping = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchPublicKey] action in SupportPage widget.
  String? fetchPublicKey;
  // Stores action output result for [Custom Action - initializeSocket] action in SupportPage widget.
  String? initializeSocket;
  // Stores action output result for [Custom Action - fetchReceiverId] action in SupportPage widget.
  String? fetchReceiverId;
  // Stores action output result for [Custom Action - fetchPublicKey] action in IconButton widget.
  String? fetchPublicKey1;
  // Stores action output result for [Custom Action - initializeSocket] action in IconButton widget.
  String? initializeSocket1;
  // Stores action output result for [Custom Action - fetchReceiverId] action in IconButton widget.
  String? fetchReceiverId1;
  // Model for emptyListview component.
  late EmptyListviewModel emptyListviewModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - encryptMessage] action in TextField widget.
  String? encryptedMessageTextfield;
  // Stores action output result for [Custom Action - sendMessage] action in TextField widget.
  String? sendMessage2;
  // Stores action output result for [Custom Action - encryptMessage] action in Button widget.
  String? encryptedMessage;
  // Stores action output result for [Custom Action - sendMessage] action in Button widget.
  String? sendMessage;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    emptyListviewModel = createModel(context, () => EmptyListviewModel());
    listViewController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    emptyListviewModel.dispose();
    listViewController?.dispose();
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
