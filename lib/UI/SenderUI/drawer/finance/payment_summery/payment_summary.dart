import 'dart:math';

import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../../const/const.dart';
import '../widget/payment_card.dart';

class PaymentSummery extends StatefulWidget {
  @override
  _PaymentSummeryState createState() => _PaymentSummeryState();
}

class _PaymentSummeryState extends State<PaymentSummery> {
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
        automaticallyImplyLeading: false,
        title: Text(
          'Payment Summary',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PaymentCard(
                  color: Color.fromARGB(255, 55, 8, 81),
                  icon: Icons.access_time_filled,
                  text: 'Cash Deposit',
                  text2: 'Rs . 00.00',
                  text3: 'Refundable Deposit',
                ),
                PaymentCard(
                  color: Color.fromARGB(255, 55, 8, 81),
                  icon: Icons.memory_rounded,
                  text: 'Total Collected COD',
                  text2: 'Rs . 00.00',
                  text3: 'Total Collected Cash on Delivery',
                ),
                ScreenSize().checkScreenType(context) == 'web'
                    ? PaymentCard(
                        color: Color.fromARGB(255, 131, 127, 6),
                        icon: Icons.payment,
                        text: 'Payment',
                        text2: 'Rs . 00.00',
                        text3: 'Payment for Koombiyo',
                      )
                    : SizedBox()
              ],
            ),
            Row(
              children: [
                PaymentCard(
                  color: Color.fromARGB(255, 4, 146, 68),
                  icon: Icons.money,
                  text: 'Payble Cod',
                  text2: 'Rs . 00.00',
                  text3: 'Total Collected COD to be received',
                ),
                PaymentCard(
                  color: Color.fromARGB(255, 134, 31, 13),
                  icon: Icons.money_off_csred_outlined,
                  text: 'Cash Deposit',
                  text2: 'Rs . 00.00',
                  text3: 'Total delivery Charges to be paid',
                ),
              ],
            ),
            ScreenSize().checkScreenType(context) != 'web'
                ? PaymentCard(
                    color: Color.fromARGB(255, 131, 127, 6),
                    icon: Icons.payment,
                    text: 'Payment',
                    text2: 'Rs . 00.00',
                    text3: 'Payment for Koombiyo',
                  )
                : SizedBox(),
            SizedBox(
              height: 12,
            ),
            Container(
                padding: EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payable Orders',
                  style: TextStyle(
                      fontSize: 18.dp,
                      fontWeight: FontWeight.bold,
                      color: black1),
                )),
            SizedBox(
              height: 12,
            ),
            Card(
              color: backgroundColor2,
              elevation: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 20,
                                margin: EdgeInsets.all(0),
                                color: lightblue.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Copy',
                                    style: TextStyle(color: white),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 20,
                                margin: EdgeInsets.all(0),
                                color: lightblue.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'CSV',
                                    style: TextStyle(color: white),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 20,
                                margin: EdgeInsets.all(0),
                                color: lightblue.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Excel',
                                    style: TextStyle(color: white),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 20,
                                margin: EdgeInsets.all(0),
                                color: lightblue.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'PDF',
                                    style: TextStyle(color: white),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {},
                            child: Card(
                                elevation: 20,
                                margin: EdgeInsets.all(0),
                                color: lightblue.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Print',
                                    style: TextStyle(color: white),
                                  ),
                                ))),
                      ),
                    ],
                  ),
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
                                    width: 0.3,
                                    color: black1.withOpacity(0.5))),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: backgroundColor2,
                                  elevation: 20,
                                  child: SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'web'
                                            ? w - w / 5
                                            : null,
                                    child: DataTable(
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                              AppColors.borderColor),
                                      columnSpacing: ScreenSize()
                                                  .checkScreenType(context) ==
                                              'web'
                                          ? 10
                                          : null,
                                      border: TableBorder.all(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black12,
                                        width: 0.5,
                                      ),
                                      columns: [
                                        DataColumn(
                                            numeric: true,
                                            onSort: (columnIndex, ascending) {},
                                            tooltip: 'Delivery Date',
                                            label: Text(
                                              'Delivery Date',
                                              textWidthBasis:
                                                  TextWidthBasis.parent,
                                            )),
                                        DataColumn(
                                            tooltip: 'Order Status',
                                            label: Text(
                                              'Order Status',
                                            )),
                                        // DataColumn(
                                        //     tooltip: 'Orde Date', label: Text('Order\nNo')),
                                        DataColumn(label: Text('Waybill')),
                                        DataColumn(label: Text('Waight')),
                                        DataColumn(
                                            label: Text('Collected COD')),
                                        DataColumn(
                                            label:
                                                SizedBox(child: Text('Brnch'))),
                                        DataColumn(label: Text('Del.Charge')),
                                        DataColumn(label: Text('Net Payable')),
                                        DataColumn(
                                            label:
                                                Text('Prev\nSettlment(COD)')),
                                      ],
                                      rows: _filteredRows,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}

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
    ]);
  }
}
