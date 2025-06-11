import 'package:adv_flutter/utils/import_export.dart';

class CrudDatabaseView extends StatefulWidget {
  const CrudDatabaseView({super.key});

  @override
  State<CrudDatabaseView> createState() => _CrudDatabaseViewState();
}

class _CrudDatabaseViewState extends State<CrudDatabaseView> {
  TextEditingController _nameController = TextEditingController();
  String _selectedCity = "Ahmedabad";
  String _selectedGender = "Male";

  int _selectedID = -1;

  List<Map<String, dynamic>> _userList = [];

  ControllerDatabaseCRUD _controller = ControllerDatabaseCRUD();  // fixed typo

  List<String> city = [
    "Ahmedabad",
    "Surat",
    "Rajkot",
    "Amreli",
    "Junagadh",
    "Jamnagar",
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _userList = await _controller.readUserDatabase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CRUD_DATABASE_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(hintText: ENTER_NAME_FIELDTEXT),
            ),
            SizedBox(height: 10),
            DropdownButton(
              value: _selectedCity,
              items: city.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCity = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(GENEDER_MALE),
                    value: GENEDER_MALE,
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(GENEDER_FEMALE),
                    value: GENEDER_FEMALE,
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> user = {
                  DB_USER_NAME: _nameController.text,  // fixed key
                  DB_CITY: _selectedCity,
                  DB_GENDER: _selectedGender,
                };

                if (_selectedID != -1) {
                  await _controller.updateUserDatabase(user, _selectedID);  // added await
                } else {
                  await _controller.addUserDatabase(user);  // added await
                }

                _nameController.clear();
                _selectedCity = city[0]; // default city
                _selectedGender = GENEDER_MALE; // default gender
                _selectedID = -1;

                _userList = await _controller.readUserDatabase();
                setState(() {});
              },
              child: Text(BTN_SUBMIT),
            ),

            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("$DB_USER_NAME : ${_userList[index][DB_USER_NAME]}"),  // fixed key
                      subtitle: Text(
                        "$DB_CITY: ${_userList[index][DB_CITY]} \n$DB_GENDER : ${_userList[index][DB_GENDER]}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _nameController.text =
                                _userList[index][DB_USER_NAME];  // fixed key
                                _selectedCity = _userList[index][DB_CITY];
                                _selectedGender = _userList[index][DB_GENDER];
                                _selectedID = _userList[index][DB_ID];
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _controller.removeUserDatabase(
                                _userList[index][DB_ID],
                              );
                              _userList = await _controller.readUserDatabase();  // refresh after delete
                              setState(() {});
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}