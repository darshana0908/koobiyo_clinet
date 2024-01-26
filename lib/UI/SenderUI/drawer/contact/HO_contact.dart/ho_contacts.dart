import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../../const/color.dart';

class HOContact extends StatefulWidget {
  const HOContact({super.key});

  @override
  State<HOContact> createState() => _HOContactState();
}

class _HOContactState extends State<HOContact> {
  TextEditingController trackingId = TextEditingController();
  bool isCheck = false;
  TextEditingController _searchController = TextEditingController();
  List _filteredRows = [];
  List<DataRow> displayedItems = [];
  String selectedValue = "10";
  List _rows = List.generate(10, (i) {
    return DataRow(cells: [
      DataCell(Text('John')),
      DataCell(Text('Jane')),
      DataCell(Text('Smith')),
      DataCell(Text('Smith')),
      DataCell(Card(
          elevation: 20,
          color: Colors.yellowAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text('Resolve'),
          ))),
      DataCell(onTapDown: (details) {
        print(details);
      },
          onTap: () {},
          Card(
              elevation: 20,
              color: blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  'Click',
                  style: TextStyle(color: white),
                ),
              ))),
    ]);
  });

  List<DataRow> _dataRows = [];
  List<DataRow> _dataRowsTemp = [];
  List<Person> _persons = List.generate(
    50,
    (index) => Person(
      firstName: 'First$index',
      lastName: 'Last$index',
      age: index + 1,
    ),
  );

  List<Person> _displayedPersons = [];

  @override
  void initState() {
    super.initState();

    _displayedPersons = _persons.take(10).toList();
    _dataRows = _buildDataRows(_displayedPersons);
    _dataRowsTemp = _buildDataRows(_displayedPersons);
    _filteredRows = List.from(_rows);
    _searchController.addListener(() {});
  }

  List<DataRow> _buildDataRows(List<Person> persons) {
    return persons.map((person) => _buildDataRow(person)).toList();
  }

  DataRow _buildDataRow(Person person) {
    return DataRow(
      cells: [
        DataCell(Text(person.firstName)),
        DataCell(Text(person.lastName)),
        DataCell(Text(person.firstName)),
        DataCell(Text(person.lastName)),
        DataCell(Text(person.lastName)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'HO Contacts',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                          width: ScreenSize().checkScreenType(context) == 'web'
                              ? w - w / 5
                              : null,
                          child: DataTable(
                            columnSpacing: 10,
                            headingRowHeight: 100,
                            headingRowColor: MaterialStateProperty.all(
                                AppColors.borderColor),
                            sortAscending: true,
                            showBottomBorder: true,
                            border: TableBorder.all(
                              borderRadius: BorderRadius.circular(12),
                              style: BorderStyle.solid,
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            columns: [
                              DataColumn(label: Text('Department')),
                              DataColumn(label: Text('Person')),
                              DataColumn(label: Text('Description')),
                              DataColumn(label: Text('Phone')),
                              DataColumn(label: Text('Email')),
                            ],
                            rows: _dataRows,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "If they couldn't resolve the problem, you can always call me, if any case I couldn't return to your calls please contact me via whats App",
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.bold,
                              color: black1),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Director - Lakshan Vithanage",
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.bold,
                              color: black1),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Phone-0765173042",
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal,
                              color: black2),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Email- lakshan@koombiyodelivery.com",
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal,
                              color: black2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Person {
  String firstName;
  String lastName;
  int age;

  Person({required this.firstName, required this.lastName, required this.age});
}
