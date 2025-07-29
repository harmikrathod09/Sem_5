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
          ProfileCardWidget(
            name: "Jane Smith",
            title: "UI/UX Designer",
            avatarUrl: "https://example.com/avatar.jpg",
            email: "jane.smith@example.com",
            phone: "+1 (555) 123-4567",
            website: "https://janesmith.com",
            backgroundColor: Colors.blue[50],
            textColor: Colors.blue[900],
            width: 300,
            padding: EdgeInsets.all(20),
            borderRadius: BorderRadius.circular(16),
          ),
          ProfileCardWidget(
            name: "Alex Johnson",
            title: "Product Manager",
            email: "alex@company.com",
            backgroundColor: Colors.grey[100],
            textColor: Colors.grey[800],
            shadow: BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          )
        ],
      ),
    ));
  }
}
