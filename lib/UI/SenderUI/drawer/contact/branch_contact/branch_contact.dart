import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../../../const/color.dart';

class BranchContact extends StatefulWidget {
  const BranchContact({super.key});

  @override
  State<BranchContact> createState() => _BranchContactState();
}

class _BranchContactState extends State<BranchContact> {
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          onTap: () {
            _showFirstItems(10);
          },
          child: Text("10"),
          value: "10"),
      DropdownMenuItem(
          onTap: () {
            _showFirstItems(20);
          },
          child: Text("20"),
          value: "20"),
      DropdownMenuItem(
          onTap: () {
            _showFirstItems(50);
          },
          child: Text("50"),
          value: "30"),
      DropdownMenuItem(
          onTap: () {
            _showFirstItems(100);
          },
          child: Text("100"),
          value: "All"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    _showFirstItems(5);
    _displayedPersons = _persons.take(10).toList();
    _dataRows = _buildDataRows(_displayedPersons);
    _dataRowsTemp = _buildDataRows(_displayedPersons);
    _filteredRows = List.from(_rows);
    _searchController.addListener(() {
      filterSearchResults();
    });
  }

  List<DataRow> _buildDataRows(List<Person> persons) {
    return persons.map((person) => _buildDataRow(person)).toList();
  }

  DataRow _buildDataRow(Person person) {
    return DataRow(
      cells: [
        DataCell(Text(person.firstName)),
        DataCell(Text(person.lastName)),
      ],
    );
  }

  void _showFirstItems(int count) {
    setState(() {
      _displayedPersons = _persons.take(count).toList();
      _dataRows = _buildDataRows(_displayedPersons);
      _dataRowsTemp = _buildDataRows(_displayedPersons);
    });
  }

  void filterSearchResults() {
    List<DataRow> _searchResults = [];
    if (_searchController.text.isNotEmpty) {
      for (DataRow row in _dataRowsTemp) {
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
      _searchResults = List.from(_dataRowsTemp);
    }
    setState(() {
      _dataRows = _searchResults;
    });
  }

  List<String> listitems = [
    "Tokyo",
    "London",
    "New York",
    "Sanghaicsbzchbhbhabhbdhbc  s bchbscx s scsc s scbsac acnja",
    "Moscow",
    "Hong Kong"
  ];
  String? selectval;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Branch Contacts',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                                          width: 0.3,
                                          color: black1.withOpacity(0.5))),
                                  child: DropdownButton(
                                      autofocus: true,
                                      // isExpanded: true,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
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
                                // scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: backgroundColor2,
                                        elevation: 20,
                                        child: SizedBox(
                                          width: ScreenSize().checkScreenType(
                                                      context) ==
                                                  'web'
                                              ? w
                                              : w,
                                          child: DataTable(
                                            columnSpacing: 10,
                                            headingRowHeight: 100,
                                            headingRowColor:
                                                MaterialStateProperty.all(
                                                    AppColors.borderColor),
                                            sortAscending: true,
                                            showBottomBorder: true,
                                            border: TableBorder.all(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              style: BorderStyle.solid,
                                              color: Colors.black12,
                                              width: 0.5,
                                            ),
                                            columns: [
                                              DataColumn(
                                                  label: Text('Branch No')),
                                              DataColumn(label: Text('Phone')),
                                            ],
                                            rows: _dataRows,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                        'Showing 0 to 0 of ${_rows.length} entries'),
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
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  CustomTextFeild(String hintText) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 13,
      child: TextField(
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: white)),
          border: InputBorder.none,
          filled: true,
          hintText: hintText,
          fillColor: white,
        ),
      ),
    );
  }

  Widget customDropDown(IconData icon, String text, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white, width: 0.6)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: white,
        ),
        child: DropdownButton(
          style: TextStyle(backgroundColor: white),
          dropdownColor: white,
          borderRadius: BorderRadius.circular(10),
          focusColor: white,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: black,
          ),
          underline: SizedBox(),
          isExpanded: true,
          padding: EdgeInsets.only(right: 20),
          alignment: AlignmentDirectional.centerEnd,
          hint: Container(
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                  color: black3,
                  fontSize: 14.dp,
                  fontWeight: FontWeight.normal),
            ),
          ),

          value: selectval,

          //implement initial value or selected value
          onChanged: (value) {
            setState(() {
              //set state will update UI and State of your App
              selectval = value.toString(); //change selectval to new value
            });
          },
          items: listitems.map((itemone) {
            return DropdownMenuItem(
                value: itemone,
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          icon,
                          color: black,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(
                              ScreenSize().checkScreenType(context) == 'mobile'
                                  ? 8.0
                                  : 8),
                          child: Text(
                            itemone,
                            style: TextStyle(color: black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }).toList(),
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
