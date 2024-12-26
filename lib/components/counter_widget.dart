import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'counter_model.dart';
export 'counter_model.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 120.0,
          height: 28.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
          ),
          child: FlutterFlowCountController(
            decrementIconBuilder: (enabled) => Icon(
              Icons.remove_rounded,
              color: enabled
                  ? FlutterFlowTheme.of(context).secondaryText
                  : FlutterFlowTheme.of(context).alternate,
              size: 18.0,
            ),
            incrementIconBuilder: (enabled) => Icon(
              Icons.add_rounded,
              color: enabled
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).alternate,
              size: 18.0,
            ),
            countBuilder: (count) => Text(
              count.toString(),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter Tight',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
            count: _model.countControllerValue ??= 1,
            updateCount: (count) =>
                safeSetState(() => _model.countControllerValue = count),
            stepSize: 1,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          ),
        ),
      ],
    );
  }
}
