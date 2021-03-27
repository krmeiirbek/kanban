import 'package:flutter/material.dart';
import 'package:my_app/style/theme.dart';

class TabListView extends StatefulWidget {
  final List<dynamic> listCardsWithRow;
  final String row;

  TabListView({@required this.listCardsWithRow, this.row});

  @override
  _TabListViewState createState() => _TabListViewState();
}

class _TabListViewState extends State<TabListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      itemBuilder: (context, index) =>
          widget.listCardsWithRow[index].row == widget.row
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Themes.greyC,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      "ID: ${widget.listCardsWithRow[index].id}",
                      style: TextStyle(
                        color: Themes.textC,
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      "${widget.listCardsWithRow[index].text}",
                      style: TextStyle(
                        color: Themes.textC,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
      itemCount: widget.listCardsWithRow.length,
    );
  }
}
