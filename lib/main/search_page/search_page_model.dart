import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for home-searchTextbox widget.
  final homeSearchTextboxKey = GlobalKey();
  FocusNode? homeSearchTextboxFocusNode;
  TextEditingController? homeSearchTextboxTextController;
  String? homeSearchTextboxSelectedOption;
  String? Function(BuildContext, String?)?
      homeSearchTextboxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    homeSearchTextboxFocusNode?.dispose();
  }
}
