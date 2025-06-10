import 'package:madf/utils/import_export.dart';

class CrudListMapView extends StatefulWidget {
  const CrudListMapView({super.key});

  @override
  State<CrudListMapView> createState() => _CrudListMapViewState();
}

class _CrudListMapViewState extends State<CrudListMapView> {
  TextEditingController _nameController = TextEditingController();
  String _selectedCity = "Ahmedabad";
  String _selectedGender = GENEDERMALE;

  int? _editingIndex = -1;

  ControllerCrudListMap _userCRUD = ControllerCrudListMap();

  List<String> city = [
    "Ahmedabad",
    "Surat",
    "Rajkot",
    "Amreli",
    "Junagadh",
    "Jamnagar",
  ];

  List<Map<String, dynamic>> _userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userList = _userCRUD.readUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CRUDLISTMAPAPPBAR, style: TextStyle(color: Colors.white)),
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
              items:
                  city.map((String items) {
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
              onPressed: () {
                Map<String, dynamic> user = {
                  USERNAME: _nameController.text,
                  USERCITY: _selectedCity,
                  USERGENDER: _selectedGender,
                };

                if (_editingIndex == -1) {
                  _userCRUD.addUser(user);
                } else {
                  _userCRUD.updateUser(user, _editingIndex!);
                  _editingIndex = -1;
                }

                setState(() {
                  _nameController.clear();
                  _selectedCity = city[0]; // default city
                  _selectedGender = GENEDERMALE; // default gender
                  _editingIndex = -1;
                  _userList = _userCRUD.readUser();
                });
              },
              child: Text(BTNSUBMIT),
            ),

            SizedBox(height: 20),

            Text(DISPLAYUSER, style: TextStyle(height: 5)),

            Expanded(
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("$USERNAME : ${_userList[index][USERNAME]}"),
                      subtitle: Text(
                        "$USERCITY : ${_userList[index][USERCITY]} \n$USERGENDER : ${_userList[index][USERGENDER]}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _nameController.text =
                                    _userList[index][USERNAME];
                                _selectedCity = _userList[index][USERCITY];
                                _selectedGender = _userList[index][USERGENDER];
                                _editingIndex = index;
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _userCRUD.removeUser(index);
                              setState(() {
                                _userList = _userCRUD.readUser();
                              });
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
