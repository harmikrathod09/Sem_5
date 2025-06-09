import 'package:madf/Lab3/crud_database_controller.dart';
import 'package:madf/utils/import_export.dart';

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
        title: Text(CRUDDATABASEAPPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(hintText: ENTERNAMEFIELDTEXT),
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
                    title: const Text(GENEDERMALE),
                    value: GENEDERMALE,
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
                    title: const Text(GENEDERFEMALE),
                    value: GENEDERFEMALE,
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
                  DBUSERNAME: _nameController.text,  // fixed key
                  DBCITY: _selectedCity,
                  DBGENDER: _selectedGender,
                };

                if (_selectedID != -1) {
                  await _controller.updateUserDatabase(user, _selectedID);  // added await
                } else {
                  await _controller.addUserDatabase(user);  // added await
                }

                _nameController.clear();
                _selectedCity = city[0]; // default city
                _selectedGender = GENEDERMALE; // default gender
                _selectedID = -1;

                _userList = await _controller.readUserDatabase();
                setState(() {});
              },
              child: Text(BTNSUBMIT),
            ),

            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("$DBUSERNAME : ${_userList[index][DBUSERNAME]}"),  // fixed key
                      subtitle: Text(
                        "$DBCITY: ${_userList[index][DBCITY]} \n$DBGENDER : ${_userList[index][DBGENDER]}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _nameController.text =
                                _userList[index][DBUSERNAME];  // fixed key
                                _selectedCity = _userList[index][DBCITY];
                                _selectedGender = _userList[index][DBGENDER];
                                _selectedID = _userList[index][DBID];
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _controller.removeUserDatabase(
                                _userList[index][DBID],
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
