import 'package:flutter/material.dart';

class Person {
  String firstName;
  String lastName;
  int age;

  Person({required this.firstName, required this.lastName, required this.age});
}

class Testing extends StatelessWidget {
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
  List<Person> _persons = [
    Person(firstName: 'John', lastName: 'Doe', age: 10),
    Person(firstName: 'Jane', lastName: 'Smith', age: 20),
    Person(firstName: 'Alice', lastName: 'Johnson', age: 30),
    // Add more persons as needed
  ];

  int _filterLength = 0;

  @override
  void initState() {
    super.initState();
    _filteredRows = _buildDataRows(_persons);
    _searchController.addListener(() {
      filterSearchResults();
    });
  }

  void filterSearchResults() {
    List<DataRow> _searchResults = [];
    if (_searchController.text.isNotEmpty) {
      for (Person person in _persons) {
        if (person.firstName
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            person.lastName
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            person.age
                .toString()
                .toLowerCase()
                .contains(_searchController.text.toLowerCase())) {
          _searchResults.add(_buildDataRow(person));
        }
      }
    } else {
      _searchResults = _buildDataRows(_persons);
    }
    setState(() {
      _filteredRows = _searchResults;
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
        DataCell(Text(person.age.toString())),
        DataCell(
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
              _editPerson(person);
            },
          ),
        ),
        DataCell(
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Handle delete action
              _deletePerson(person);
            },
          ),
        ),
      ],
    );
  }

  void _addPerson() {
    // You can implement your logic to add a new person here
    // For simplicity, let's add a new person with dummy data
    Person newPerson = Person(firstName: 'New', lastName: 'Person', age: 0);
    setState(() {
      _persons.add(newPerson);
      _filteredRows = _buildDataRows(_persons);
    });
  }

  void _deletePerson(Person person) {
    // You can implement your logic to delete the person here
    setState(() {
      _persons.remove(person);
      _filteredRows = _buildDataRows(_persons);
    });
  }

  void _editPerson(Person person) {
    // You can implement your logic to edit the person here
    // For simplicity, let's update the person's age
    setState(() {
      person.age += 1;
      _filteredRows = _buildDataRows(_persons);
    });
  }

  void _filterByLength(int length) {
    List<Person> filteredPersons =
        _persons.where((person) => person.age == length).toList();
    setState(() {
      _filteredRows = _buildDataRows(filteredPersons);
      _filterLength = length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable with CRUD and Filter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle filter by length action (10)
                    _filterByLength(10);
                  },
                  child: Text('Filter 10'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle filter by length action (20)
                    _filterByLength(20);
                  },
                  child: Text('Filter 20'),
                ),
              ],
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('First Name')),
              DataColumn(label: Text('Last Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('Edit')),
              DataColumn(label: Text('Delete')),
            ],
            rows: _filteredRows,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle add action
                  _addPerson();
                },
                child: Text('Add Person'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('List Data: $_filterLength'),
        ],
      ),
    );
  }
}
