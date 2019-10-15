import 'package:flutter/material.dart';

class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  State<StatefulWidget> createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Checkbox(
        value: value,
        onChanged: (v) {
          //将选中状态通过事件的形式抛出
          widget.onChanged(v);
          setState(() {
            //更新自身选中状态
            value = v;
          });
        });
  }
}
