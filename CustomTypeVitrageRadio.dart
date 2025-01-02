// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomTypeVitrageRadio extends StatefulWidget {
  final String presenceVitrage;
  final String initialValue;
  final String onChangedAction;
  final double? width;
  final double? height;

  const CustomTypeVitrageRadio({
    Key? key,
    required this.presenceVitrage,
    required this.initialValue,
    required this.onChangedAction,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<CustomTypeVitrageRadio> createState() => _CustomTypeVitrageRadioState();
}

class _CustomTypeVitrageRadioState extends State<CustomTypeVitrageRadio> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.presenceVitrage.toLowerCase() != 'oui') return SizedBox();

    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Type vitrage',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _buildCustomRadioTile('Oculus rond'),
            _buildCustomRadioTile('Oculus rectangulaire'),
            _buildCustomRadioTile('Grand vitrage'),
            _buildCustomRadioTile('Full glass avec agraphe'),
            _buildCustomRadioTile('Full glass total'),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadioTile(String value) {
    final isSelected = _selectedValue == value;
    return InkWell(
      onTap: () => _updateSelection(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSelection(String value) {
    setState(() {
      _selectedValue = value;
    });
    // Ici, vous devrez implémenter la logique pour déclencher l'action dans FlutterFlow
    // Par exemple, vous pourriez utiliser un service ou une méthode statique pour communiquer avec FlutterFlow
    // FlutterFlowActions.triggerAction(widget.onChangedAction, value);
  }
}
