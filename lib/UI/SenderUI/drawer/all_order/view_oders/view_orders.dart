import 'dart:math';

import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDataTable(),
    );
  }
}

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  TextEditingController _searchController = TextEditingController();
  List<DataRow> _filteredRows = [];
  String selectedValue = "10";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("10"), value: "10"),
      DropdownMenuItem(child: Text("20"), value: "20"),
      DropdownMenuItem(child: Text("30"), value: "30"),
      DropdownMenuItem(child: Text("All"), value: "All"),
    ];
    return menuItems;
  }

  List<DataRow> _rows = [
    DataRow(cells: [
      DataCell(Text('John')),
      DataCell(Text('Jane')),
      DataCell(Text('Smith')),
      DataCell(Text('25')),
      DataCell(Text('John')),
      DataCell(Text('Jane')),
      DataCell(Text('Smith')),
      DataCell(Text('25')),
      DataCell(Text('John')),
      DataCell(Text('Jane')),
      DataCell(Text('Smith')),
      DataCell(Text('25')),
      DataCell(Text('John')),
      DataCell(Text('Jane')),
      DataCell(Text('Smith')),
      DataCell(Text('25')),
      DataCell(Text('25')),
    ]),

    // Add more rows as needed
  ];

  @override
  void initState() {
    super.initState();
    _filteredRows = List.from(_rows);
    _searchController.addListener(() {
      filterSearchResults();
    });
  }

  void filterSearchResults() {
    List<DataRow> _searchResults = [];
    if (_searchController.text.isNotEmpty) {
      for (DataRow row in _rows) {
        for (DataCell cell in row.cells) {
          if (cell.child is Text &&
              (cell.child as Text)
                  .data!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) {
            _searchResults.add(row);
            break;
          }
        }
      }
    } else {
      _searchResults = List.from(_rows);
    }
    setState(() {
      _filteredRows = _searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Orders',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: h / 17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 0.3, color: black1.withOpacity(0.5))),
                    child: DropdownButton(
                        autofocus: true,
                        // isExpanded: true,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        value: selectedValue,
                        items: dropdownItems),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: h / 17,
                    child: TextField(
                      autofocus: true,
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Card(
                        color: backgroundColor2,
                        elevation: 20,
                        child: DataTable(
                          headingRowColor:
                              MaterialStateProperty.all(AppColors.borderColor),
                          columnSpacing: 10,
                          border: TableBorder.all(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black12,
                            width: 0.5,
                          ),
                          columns: [
                            DataColumn(
                                numeric: true,
                                onSort: (columnIndex, ascending) {},
                                tooltip: 'Orde Date',
                                label: Text(
                                  'Orde Date',
                                  textWidthBasis: TextWidthBasis.parent,
                                )),
                            DataColumn(
                                tooltip: 'Orde Date',
                                label: Text(
                                  'Waybill Id',
                                )),
                            DataColumn(
                                tooltip: 'Orde Date', label: Text('Order\nNo')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Address')),
                            DataColumn(
                                label: SizedBox(child: Text('Description'))),
                            DataColumn(
                                label:
                                    SizedBox(child: Text('Internal\nRemarks'))),
                            DataColumn(
                                label: SizedBox(
                                    child: Text('Koombiyo \nRemarks'))),
                            DataColumn(label: Text('COD')),
                            DataColumn(label: Text('Del\nChrg')),
                            DataColumn(label: Text('Branch')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Print')),
                            DataColumn(label: Text('More')),
                            DataColumn(label: Text('Delete')),
                            DataColumn(label: Text('Bulk\nSelect'))
                          ],
                          rows: _filteredRows,
                        ),
                      ),
                    ],
                  ),
                ),
                _filteredRows.isEmpty
                    ? Container(
                        width: w,
                        height: h / 4,
                        alignment: Alignment.center,
                        child: Text('No Data Available'))
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Showing 0 to 0 of 0 entries'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: black3,
                              size: 20.dp,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: black3,
                              size: 20.dp,
                            )),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
