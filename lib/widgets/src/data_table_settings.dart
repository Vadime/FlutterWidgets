import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class TableSettingsWidget extends StatefulWidget {
  final void Function(int index) changeFilterIndex;
  final void Function(bool select, int index) selectColumn;
  final List<String> columns;
  final List<bool> cellIsShown;
  final int filterIndex;
  const TableSettingsWidget(
      {required this.filterIndex,
      required this.columns,
      required this.cellIsShown,
      required this.changeFilterIndex,
      required this.selectColumn,
      super.key});

  @override
  State<TableSettingsWidget> createState() => _TableSettingsWidgetState();
}

class _TableSettingsWidgetState extends State<TableSettingsWidget> {
  late int filterIndex;

  @override
  void initState() {
    filterIndex = widget.filterIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
              child: Row(children: [
                Expanded(
                    child: TextWidget('Felder', color: Colors.grey, size: 12)),
                VerticalDivider(
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 70,
                  child: TextWidget('Suche in',
                      align: TextAlign.center, color: Colors.grey, size: 12),
                ),
                VerticalDivider(
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 70,
                  child: TextWidget('Einblenden',
                      align: TextAlign.center, color: Colors.grey, size: 12),
                ),
              ]),
            ),
            const Divider(color: Colors.grey, height: 0),
            ...List.generate(widget.columns.length, (index) {
              if (widget.columns[index] == '') {
                return const SizedBox();
              }
              return SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextWidget(widget.columns[index], onTap: () {}),
                    ),
                    const VerticalDivider(color: Colors.grey),
                    SizedBox(
                      width: 70,
                      child: Radio<int>(
                          groupValue: filterIndex,
                          value: index,
                          onChanged: (v) {
                            setState(() {
                              widget.changeFilterIndex(v!);
                              filterIndex = v;
                            });
                          }),
                    ),
                    const VerticalDivider(color: Colors.grey),
                    SizedBox(
                      width: 70,
                      child: Checkbox(
                          value: widget.cellIsShown[index],
                          onChanged: (v) {
                            widget.selectColumn(v!, index);
                            setState(() {});
                            (() {});
                          }),
                    ),
                  ],
                ),
              );
            })
          ]),
    );
  }
}
