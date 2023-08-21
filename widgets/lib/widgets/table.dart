library widgets;

import 'package:flutter/material.dart';
import 'package:widgets/controllers/theme_controller.dart';
import 'package:widgets/widgets/card.dart';
import 'package:widgets/widgets/widgets.dart';

class TableRowWidget {
  final List<String> cells;
  final EdgeInsets cellPadding;
  final Color? rowColor;
  const TableRowWidget({
    required this.cells,
    this.cellPadding = const EdgeInsets.all(ThemeConfig.kPaddingH),
    this.rowColor,
  });

  TableRow toTableRow({Color? rowColor}) {
    return TableRow(
      decoration: BoxDecoration(
        color: rowColor ?? this.rowColor,
      ),
      children: cells
          .map(
            (e) => Padding(
              padding: cellPadding,
              child: Text(e),
            ),
          )
          .toList(),
    );
  }
}

class TableWidget extends StatelessWidget {
  final List<TableRowWidget> rows;
  final Map<int, TableColumnWidth>? columnWidths;
  final EdgeInsets margin;
  const TableWidget({
    required this.rows,
    this.columnWidths,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget.single(
      margin: margin,
      child: Table(
        columnWidths: columnWidths,
        children: [
          for (int i = 0; i < rows.length; i++)
            if (i % 2 == 0)
              rows[i].toTableRow()
            else
              rows[i].toTableRow(
                rowColor:
                    context.theme.scaffoldBackgroundColor.withOpacity(0.5),
              )
        ],
      ),
    );
  }
}
