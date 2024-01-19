import 'dart:math';

import 'package:client_app/const/color.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../const/const.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({Key? key}) : super(key: key);

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize().checkScreenType(context) == 'web' ? 0 : 135,
            ),
            Card(
              child: PaginatedDataTable(
                dataRowHeight: h / 15,
                sortAscending: true,
                headingRowColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 243, 226, 255)),
                showFirstLastButtons: true,
                actions: [
                  SizedBox(
                    width: ScreenSize().checkScreenType(context) == 'web'
                        ? w / 4
                        : w / 2,
                    height: h / 17,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        hintText: "search",
                        fillColor: Color.fromARGB(179, 226, 215, 215),
                      ),
                    ),
                  )
                ],

                arrowHeadColor: red,
                onSelectAll: (value) {
                  print(value);
                  print('ddddaaaaaaaaddddd');
                },
                // onRowsPerPageChanged: (value) {
                //   print(value);
                //   print('ddddddddd');
                // },
                onPageChanged: (value) {
                  print(value);
                },
                source: _data,
                header: const Text('My Products'),
                primary: true,
                columns: const [
                  DataColumn(label: Text('Orde Date')),
                  DataColumn(label: Text('Waybill Id')),
                  DataColumn(label: Text('Order No')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Address')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Internal Remarks')),
                  DataColumn(label: Text('Koombiyo Remarks')),
                  DataColumn(label: Text('COD')),
                  DataColumn(label: Text('Del.Chrg')),
                  DataColumn(label: Text('Branch')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Print')),
                  DataColumn(label: Text('More')),
                  DataColumn(label: Text('Delete')),
                  DataColumn(label: Text('Bulk Select'))
                ],
                columnSpacing: 35,
                horizontalMargin: 20,
                rowsPerPage: 10,
                showCheckboxColumn: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(onTap: () {}, Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(onTap: () {}, Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
    ]);
  }
}

/// Example without a datasource
class DataTableScreen extends StatelessWidget {
  const DataTableScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          border: TableBorder.all(),
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text('Column A'),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Column B'),
            ),
            DataColumn(
              label: Text('Column C'),
            ),
            DataColumn(
              label: Text('Column D'),
            ),
            DataColumn(
              label: Text('Column NUMBERS'),
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              100,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10))),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ]))),
    );
  }
}
