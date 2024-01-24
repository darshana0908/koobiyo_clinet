import 'dart:math';

import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../../const/const.dart';
import '../../finance/widget/payment_card.dart';

class CompleteOrder extends StatefulWidget {
  @override
  _CompleteOrderState createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  TextEditingController _searchController = TextEditingController();
  List<DataRow> _filteredRows = [];
  String selectedValue = "10";
  DateTime selectedDate = DateTime.now();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  final MultiSelectController _controller = MultiSelectController();
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
  Future<void> selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        if (isStart) {
          startDate.text = DateFormat.yMMMEd().format(picked).toString();
        } else {
          endDate.text = DateFormat.yMMMEd().format(picked).toString();
        }
      });
    }
  }

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
          'Complete Orders',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  PaymentCard(
                    color: Color.fromARGB(255, 55, 8, 81),
                    icon: Icons.access_time_filled,
                    text: 'Total Orders',
                    text2: '00',
                    text3: '',
                  ),
                  PaymentCard(
                    color: Color.fromARGB(255, 55, 8, 81),
                    icon: Icons.memory_rounded,
                    text: 'Delivered',
                    text2: '0',
                    text3: '',
                  ),
                  ScreenSize().checkScreenType(context) == 'web'
                      ? PaymentCard(
                          color: Color.fromARGB(255, 131, 127, 6),
                          icon: Icons.payment,
                          text: 'Return',
                          text2: '0',
                          text3: '',
                        )
                      : SizedBox()
                ],
              ),
              Row(
                children: [
                  ScreenSize().checkScreenType(context) != 'web'
                      ? PaymentCard(
                          color: Color.fromARGB(255, 131, 127, 6),
                          icon: Icons.payment,
                          text: 'Return',
                          text2: '0',
                          text3: '',
                        )
                      : SizedBox(),
                ],
              ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: MultiSelectDropDown(
                            hint: 'Status',
                            showClearIcon: true,
                            controller: _controller,
                            onOptionSelected: (options) {
                              debugPrint(options.toString());
                            },
                            options: const <ValueItem>[
                              ValueItem(label: 'Option 1', value: '1'),
                              ValueItem(label: 'Option 2', value: '2'),
                              ValueItem(label: 'Option 3', value: '3'),
                              ValueItem(label: 'Option 4', value: '4'),
                              ValueItem(label: 'Option 5', value: '5'),
                              ValueItem(label: 'Option 6', value: '6'),
                            ],
                            maxItems: 10,
                            disabledOptions: const [
                              ValueItem(label: 'Option 1', value: '1')
                            ],
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            dropdownHeight: 300,
                            optionTextStyle: const TextStyle(fontSize: 16),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: MultiSelectDropDown(
                            hint: 'branch',
                            showClearIcon: true,
                            controller: _controller,
                            onOptionSelected: (options) {
                              debugPrint(options.toString());
                            },
                            options: const <ValueItem>[
                              ValueItem(label: 'Option 1', value: '1'),
                              ValueItem(label: 'Option 2', value: '2'),
                              ValueItem(label: 'Option 3', value: '3'),
                              ValueItem(label: 'Option 4', value: '4'),
                              ValueItem(label: 'Option 5', value: '5'),
                              ValueItem(label: 'Option 6', value: '6'),
                            ],
                            maxItems: 10,
                            disabledOptions: const [
                              ValueItem(label: 'Option 1', value: '1')
                            ],
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            dropdownHeight: 300,
                            optionTextStyle: const TextStyle(fontSize: 16),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ScreenSize().checkScreenType(context) == 'web'
                            ? Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextField(
                                        controller: startDate,
                                        readOnly: true,
                                        onTap: () {
                                          selectDate(context, true);
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Select Start Date',
                                            prefixIcon: Icon(Icons.date_range)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextField(
                                        controller: endDate,
                                        readOnly: true,
                                        onTap: () {
                                          selectDate(context, false);
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Select End Date',
                                            prefixIcon: Icon(Icons.date_range)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                    ScreenSize().checkScreenType(context) != 'web'
                        ? Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: TextField(
                                  controller: startDate,
                                  readOnly: true,
                                  onTap: () {
                                    selectDate(context, true);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Start Date',
                                      prefixIcon: Icon(Icons.date_range)),
                                ),
                              ),
                              SizedBox(width: 12),
                              Flexible(
                                child: TextField(
                                  controller: endDate,
                                  readOnly: true,
                                  onTap: () {
                                    selectDate(context, false);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'End Date',
                                      prefixIcon: Icon(Icons.date_range)),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          )
                        : SizedBox(),
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
                                    color: backgroundColor2,
                                    elevation: 20,
                                    child: SizedBox(
                                      width: ScreenSize()
                                                  .checkScreenType(context) ==
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
                                          color: Colors.black12,
                                          width: 0.5,
                                        ),
                                        columns: [
                                          DataColumn(
                                              numeric: true,
                                              onSort:
                                                  (columnIndex, ascending) {},
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
                                              label: SizedBox(
                                                  child: Text('Brnch'))),
                                          DataColumn(label: Text('Del.Charge')),
                                          DataColumn(
                                              label: Text('Net Payable')),
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
