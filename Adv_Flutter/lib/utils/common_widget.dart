import 'import_export.dart';

class CommonWidget {
  Widget textField(controller, hintTxt, labelTxt) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTxt,
        labelText: labelTxt,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget titleText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget titleRowText(label, value) {
    return Row(
      children: [
        Text(
          "$label : ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(value, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }

  Widget iconButtonSocialMedia(url, icon) {
    return IconButton(
      onPressed: () async {
        await launch(url);
      },
      icon: Icon(icon),
    );
  }

  Widget listtileDrawer(context, {icon, color, title}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget drawerHeaderEcommerce({circleAvatarIcon, title, subtitle}) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.black87),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Icon(circleAvatarIcon, size: 35), radius: 30),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget welcomeSectionEcommerce(
    background,
    title,
    titleColor,
    titleSize,
    subtitle,
    subtitleColor,
    subtitleSize,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(color: subtitleColor, fontSize: subtitleSize),
          ),
        ],
      ),
    );
  }

  Widget buildStatusCard({icon, color, value, title}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget quickAccess({color, icon, title}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
