import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class StudentView extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());
  final TextEditingController searchController = TextEditingController();

  StudentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          APPBAR_VIEW,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Field
            TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search students',
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.search(value);
              },
            ),
            const SizedBox(height: 16),

            // Student List
            Expanded(
              child: Obx(() {
                if (controller.filteredStudents.isEmpty) {
                  return const Center(child: Text('No students found.'));
                }

                return ListView.separated(
                  itemCount: controller.filteredStudents.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final student = controller.filteredStudents[index];
                    return ListTile(
                      title: Text('${student.fname} ${student.lname}'),
                      subtitle: Text('Enrollment No: ${student.enNo}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to(() => AddEditView(student: student));
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(ROUTE_ADD_STUDENT);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
