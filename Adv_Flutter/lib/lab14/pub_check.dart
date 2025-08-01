import 'package:adv_flutter/utils/import_export.dart';
import 'package:profile_card_pub/profile_card_pub.dart';

class PubCheck extends StatelessWidget {
  const PubCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          ProfileCardWidget(
            name: "John Doe",
            title: "Software Developer",
          ),
          SizedBox(height: 10,),
          ProfileCardWidget(
            name: "Jane Smith",
            title: "UI/UX Designer",
            avatarUrl: "https://example.com/avatar.jpg",
            email: "jane.smith@example.com",
            phone: "+1 (555) 123-4567",
            website: "https://janesmith.com",
          ),
          SizedBox(height: 10,),
          ProfileCardWidget(
            name: "Alex Johnson",
            title: "Product Manager",
            email: "alex@company.com",
            backgroundColor: Colors.blue[50],
            textColor: Colors.blue[900],
          ),
          SizedBox(height: 10,),
          ProfileCardWidget(
            name: "Sarah Wilson",
            title: "Frontend Developer",
            email: "sarah@company.com",
            phone: "+1 (555) 987-6543",
            backgroundColor: Colors.grey[900],
            textColor: Colors.white,
          ),
          SizedBox(height: 10,),
          ProfileCardWidget(
            name: "Mike Chen",
            title: "Backend Engineer",
            email: "mike@company.com",
            width: 400, // Custom width
          )
        ],
      ),
    ));
  }
}
