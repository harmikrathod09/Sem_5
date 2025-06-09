import 'package:madf/Lab3/crud_listmap_controller.dart';
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
      appBar: AppBar(title: Text(CRUDLISTMAPAPPBAR)),
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

                _userCRUD.addUser(user);

                setState(() {});
              },
              child: Text(BTNSUBMIT),
            ),

            SizedBox(height: 50),

            Text(DISPLAYUSER, style: TextStyle(height: 10)),

            Expanded(
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_userList[index][USERNAME]),
                    subtitle: Text(_userList[index][USERCITY]),
                    trailing: IconButton(onPressed: (){
                      _userCRUD.removeUser(index);
                      setState(() {
                        
                      });
                    }, icon: Icon(Icons.delete)),
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
