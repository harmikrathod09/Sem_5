import 'package:adv_flutter/utils/import_export.dart';

class EcommerceDashboardView extends StatefulWidget {
  const EcommerceDashboardView({super.key});

  @override
  State<EcommerceDashboardView> createState() => _EcommerceDashboardViewState();
}

class _EcommerceDashboardViewState extends State<EcommerceDashboardView> {
  CommonWidget _commonWidget = CommonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          ECOMMERCE_DASHBOARD_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            _commonWidget.drawerHeaderEcommerce(
              circleAvatarIcon: Icons.person,
              title: USER_NAME_DRAWER,
              subtitle: USER_EMAIL_DRAWER,
            ),

            _commonWidget.listtileDrawer(
              context,
              title: HOME_DRAWER,
              icon: Icons.home,
              color: Colors.blue,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: CATEGORIES_DRAWER,
              icon: Icons.category,
              color: Colors.orange,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: ORDER_DRAWER,
              icon: Icons.shopping_bag,
              color: Colors.green,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: CART_DRAWER,
              icon: Icons.shopping_cart,
              color: Colors.purple,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: WISHLIST_DRAWER,
              icon: Icons.favorite,
              color: Colors.red,
            ),
            Divider(color: Colors.grey),
            _commonWidget.listtileDrawer(
              context,
              title: PROFILE_DRAWER,
              icon: Icons.person,
              color: Colors.indigo,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: SETTING_DRAWER,
              icon: Icons.settings,
              color: Colors.grey,
            ),
            _commonWidget.listtileDrawer(
              context,
              title: HELP_DRAWER,
              icon: Icons.help,
              color: Colors.cyan,
            ),
            Divider(color: Colors.grey),
            _commonWidget.listtileDrawer(
              context,
              title: LOGOUT_DRAWER,
              icon: Icons.logout,
              color: Colors.red,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _commonWidget.welcomeSectionEcommerce(
              Colors.orange,
              WELCOME_BACK_USER,
              Colors.white,
              24,
              WELCOME_SUBTITLE,
              Colors.white70,
              15,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _commonWidget.buildStatusCard(
                  icon: Icons.shopping_bag,
                  title: TOTAL_ORDERS,
                  value: "20",
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                _commonWidget.buildStatusCard(
                  icon: Icons.favorite,
                  title: WISHLIST,
                  value: "10",
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                _commonWidget.buildStatusCard(
                  icon: Icons.shopping_cart,
                  title: CART_ITEMS,
                  value: "13",
                  color: Colors.orange,
                ),
              ],
            ),
            SizedBox(height: 20),
            _commonWidget.titleText(QUICK_ACTIONS),
            SizedBox(height: 10,),
            Row(
              children: [
                _commonWidget.quickAccess(
                  color: Colors.blue,
                  icon: Icons.storefront,
                  title: BROWSE_PRODUCT,
                ),
                SizedBox(width: 10,),
                _commonWidget.quickAccess(
                  color: Colors.green,
                  icon: Icons.local_shipping,
                  title: TRACK_ORDERS,
                ),
              ],
            ),
            SizedBox(height: 20),
            _commonWidget.titleText(CATEGORIES),
          ],
        ),
      ),
    );
  }
}
