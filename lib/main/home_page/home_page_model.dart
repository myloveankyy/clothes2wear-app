import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for home-searchTextbox widget.
  FocusNode? homeSearchTextboxFocusNode;
  TextEditingController? homeSearchTextboxTextController;
  String? Function(BuildContext, String?)?
      homeSearchTextboxTextControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    homeSearchTextboxFocusNode?.dispose();
    homeSearchTextboxTextController?.dispose();
  }
}
