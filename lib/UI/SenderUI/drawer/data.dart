// import 'dart:async';
// import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:flutter_web_data_table/web_data_table.dart';

// import '../../../const/const.dart';

// class DataTableText extends StatefulWidget {
//   @override
//   _DataTableTextState createState() => _DataTableTextState();
// }

// class _DataTableTextState extends State<DataTableText> {
//   late String _sortColumnName;
//   late bool _sortAscending;
//   List<String>? _filterTexts;
//   bool _willSearch = true;
//   Timer? _timer;
//   int? _latestTick;
//   List<String> _selectedRowKeys = [];
//   int _rowsPerPage = 10;
//   List<SampleDataRow> sampleDataRowsa = [];
//   List newdata = [
//     {
//       "id": 1004,
//       "primerNombre": "Carlos",
//       "primerApellido": "Marroquin",
//       "createdAt": "2022-12-14T18:05:42.157Z"
//     }
//   ];

//   List DataList = [
//     'Orde Date',
//     'Waybill Id',
//     'Order No',
//     'Name',
//     'Phone',
//     'Address',
//     'Description',
//     'Internal Remarks',
//     'Koombiyo Remarks',
//     'COD',
//     'Del.Chrg',
//     'Branch',
//     'Status',
//     'Print',
//     'More',
//     'Delete',
//     'Bulk Select'
//   ];
//   getData() {
//     final List<SampleDataRow> sampleDataRowsa = List.generate(
//       DataList.length,
//       (index) {
//         return SampleDataRow.fromList([
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//           'ddddd',
//         ]);
//       },
//     );
//     // print(sampleDataRowsa.map((row) => row.values).toList());
//     setState(() {
//       sampleDataRowsa.map((row) => row.values).toList();
//     });
//     return sampleDataRowsa.map((row) => row.values).toList();
//   }

//   List<Map<String, dynamic>> data() {
//     return sampleDataRowsa.map((row) => row.values).toList();
//   }

//   @override
//   void initState() {
//     getData();
//     main();
//     super.initState();
//     _sortColumnName = 'browser';
//     _sortAscending = false;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (!_willSearch) {
//         if (_latestTick != null && timer.tick > _latestTick!) {
//           _willSearch = true;
//         }
//       }
//       if (_willSearch) {
//         _willSearch = false;
//         _latestTick = null;
//         setState(() {
//           if (_filterTexts != null && _filterTexts!.isNotEmpty) {
//             _filterTexts = _filterTexts;
//             print('filterTexts = $_filterTexts');
//           }
//         });
//       }
//     });
//   }

//   main() {
//     List<String> stringList = ["one", "two", "three"];
//     List<Map<String, dynamic>> mapList = [];

//     for (var element in stringList) {
//       mapList.add({"name": element, "selected": false});
//     }

//     print(mapList);
//     return mapList;
//   }

//   List<Map<String, dynamic>> s = [];
//   @override
//   void dispose() {
//     super.dispose();
//     _timer?.cancel();
//     _timer = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('WebDataTable Sample'),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(8.0),
//             child: WebDataTable(
//               columnSpacing: 10,
//               header: Text(ScreenSize().checkScreenType(context) == 'web'
//                   ? 'Sample Data'
//                   : ''),
//               actions: [
//                 if (_selectedRowKeys.isNotEmpty)
//                   SizedBox(
//                     height: 50,
//                     width: 100,
//                     child: TextButton(
//                       // color: Colors.red,
//                       child: Text(
//                         'Delete',
//                         style: TextStyle(
//                           color: Colors.red,
//                         ),
//                       ),
//                       onPressed: () {
//                         print('Delete!');
//                         setState(() {
//                           _selectedRowKeys.clear();
//                         });
//                       },
//                     ),
//                   ),
//                 Container(
//                   width: w / 2,
//                   height: h / 17,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: 'search...',
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(0xFFCCCCCC),
//                         ),
//                       ),
//                       border: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(0xFFCCCCCC),
//                         ),
//                       ),
//                     ),
//                     onChanged: (text) {
//                       _filterTexts = text.trim().split(' ');
//                       _willSearch = false;
//                       _latestTick = _timer?.tick;
//                     },
//                   ),
//                 ),
//               ],
//               source: WebDataTableSource(
//                 sortColumnName: _sortColumnName,
//                 sortAscending: _sortAscending,
//                 filterTexts: _filterTexts,
//                 columns: [
//                   WebDataColumn(
//                     name: 'id',
//                     label: const Text('Orde Date'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                   ),
//                   WebDataColumn(
//                     name: 'Waybill_Id',
//                     label: const Text('Waybill Id'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                   ),
//                   WebDataColumn(
//                     name: 'Order_No',
//                     label: const Text('Order No'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                   ),
//                   WebDataColumn(
//                     name: 'Name',
//                     label: const Text('Name'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                   ),
//                   WebDataColumn(
//                     name: 'Phone',
//                     label: const Text('Phone'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                   ),
//                   WebDataColumn(
//                     name: 'Koombiyo_Remarks',
//                     label: const Text('Koombiyo Remarks'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'COD',
//                     label: const Text('COD'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Del.Chrg',
//                     label: const Text('Del.Chrg'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Branch',
//                     label: const Text('Branch'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Print',
//                     label: const Text('Print'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Status',
//                     label: const Text('Status'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'More',
//                     label: const Text('More'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Delete',
//                     label: const Text('Delete'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                     name: 'Bulk_Select',
//                     label: const Text('Bulk Select'),
//                     dataCell: (value) => DataCell(Text('$value')),
//                     sortable: false,
//                   ),
//                   WebDataColumn(
//                       name: 'dateTime',
//                       label: const Text('DateTime'),
//                       dataCell: (value) {
//                         if (value is DateTime) {
//                           final text =
//                               '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
//                           return DataCell(Text(text));
//                         }
//                         return DataCell(Text(value.toString()));
//                       },
//                       filterText: (value) {
//                         if (value is DateTime) {
//                           return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
//                         }
//                         return value.toString();
//                       }),
//                 ],
//                 rows: main(),
//                 // sampleDataRowsa.map((row) {
//                 //   print(row);
//                 //   return row.values;
//                 // }).toList(),

//                 selectedRowKeys: _selectedRowKeys,
//                 onTapRow: (rows, index) {
//                   print('onTapRow(): index = $index, row = ${rows[index]}');
//                 },
//                 // onSelectRows: (keys) {
//                 // print('onSelectRows(): count = ${keys.length} keys = $keys');
//                 // setState(() {
//                 //   _selectedRowKeys = keys;
//                 // });
//                 // },
//                 primaryKeyName: 'id',
//               ),
//               horizontalMargin: 10,
//               onPageChanged: (offset) {
//                 print('onPageChanged(): offset = $offset');
//               },
//               onSort: (columnName, ascending) {
//                 print(
//                     'onSort(): columnName = $columnName, ascending = $ascending');
//                 setState(() {
//                   _sortColumnName = columnName;
//                   _sortAscending = ascending;
//                 });
//               },
//               onRowsPerPageChanged: (rowsPerPage) {
//                 print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
//                 setState(() {
//                   if (rowsPerPage != null) {
//                     _rowsPerPage = rowsPerPage;
//                   }
//                 });
//               },
//               rowsPerPage: _rowsPerPage,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SampleDataRow {
//   SampleDataRow._(
//       {
//       // required this.dateTime,
//       required this.Orde_Date,
//       required this.Waybill_Id,
//       required this.Order_No,
//       required this.Name,
//       required this.Phone,
//       required this.Address,
//       required this.Description,
//       required this.Internal_Remarks,
//       required this.Koombiyo_Remarks,
//       required this.COD,
//       required this.Del_Chrg,
//       required this.Branch,
//       required this.Status,
//       required this.Print,
//       required this.More,
//       required this.Delete,
//       required this.Bulk_Select,
//       required this.date});

//   factory SampleDataRow.fromList(List<String> values) {
//     print(values[5]);
//     return SampleDataRow._(
//         Orde_Date: values[5],
//         Waybill_Id: values[1],
//         Address: values[2],
//         Branch: values[3],
//         COD: values[4],
//         Del_Chrg: values[5],
//         Delete: values[6],
//         Description: values[7],
//         Internal_Remarks: values[8],
//         Koombiyo_Remarks: values[9],
//         More: values[10],
//         Name: values[11],
//         Order_No: values[12],
//         Phone: values[13],
//         Print: values[14],
//         Status: values[15],
//         Bulk_Select: values[16],
//         date: 'ss'
//         // dateTime: DateTime.parse(DateTime.now().toString()),
//         );
//   }

//   final String Orde_Date;
//   final String Waybill_Id;
//   final String Order_No;
//   final String Name;
//   final String Phone;
//   final String Address;
//   final String Description;
//   final String Internal_Remarks;
//   final String Koombiyo_Remarks;
//   final String COD;
//   final String Del_Chrg;
//   final String Branch;
//   final String Status;
//   final String Print;
//   final String More;
//   final String Delete;
//   final String Bulk_Select;
//   final String date;

//   Map<String, dynamic> get values {
//     return {
//       'Orde Date': Orde_Date,
//       'Waybill Id': Waybill_Id,
//       'Order No': Order_No,
//       'Name': Name,
//       'Phone': Phone,
//       'Address': Address,
//       'Description': Description,
//       'Internal Remarks': Internal_Remarks,
//       'Koombiyo Remarks': Koombiyo_Remarks,
//       'COD': COD,
//       'Del.Chrg': Del_Chrg,
//       'Branch': Branch,
//       'Status': Status,
//       'Print': Print,
//       'More': More,
//       'Delete': Delete,
//       'Bulk Select': Bulk_Select,
//       'date': date,
//     };
//   }
// }
