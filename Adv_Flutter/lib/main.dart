import 'package:adv_flutter/firebase_options.dart';
import 'package:adv_flutter/lab14/pub_check.dart';
import 'package:adv_flutter/lab15_16/camera_permission.dart';
import 'package:adv_flutter/lab15_16/file_permission.dart';
import 'package:adv_flutter/lab15_16/location_permission.dart';
import 'package:adv_flutter/lab15_16/read_data_from_external_storage.dart';
import 'package:adv_flutter/lab17/color_base_web_app.dart';
import 'package:adv_flutter/lab17/display_width_height.dart';
import 'package:adv_flutter/lab17/media_query_padding.dart';
import 'package:adv_flutter/lab18/responsive_grid_view.dart';
import 'package:adv_flutter/lab24/google_map.dart';
import 'package:adv_flutter/lab26/animation_view.dart';
import 'package:adv_flutter/utils/import_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'lab20/user_list_firebase_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: RxboolShowHide(),
      initialRoute: NAV_ANIMATION,
      // initialBinding: TextBinding(),
      getPages: [
        GetPage(name: NAV_FIRST_PAGE, page: () => FirstPageNamedRoute()),
        GetPage(name: NAV_SECOND_PAGE, page: () => SecondPageNamedRoute()),
        GetPage(name: FIRST_MIDDLEWARE_PAGE, page: () => FirstMiddlepageView()),
        GetPage(
          name: SECOND_MIDDLEWARE_PAGE,
          page: () => SecondMiddlewareView(),
          middlewares: [CheckboxMiddleware()],
        ),
        GetPage(name: RXSTRING_HIDE_SHOW, page: () => TextBindingPage()),
        GetPage(name: RXLIST_CRUD, page: () => RxlistCrudView()),
        GetPage(name: RXLIST_ADD_EDIT, page: () => AddEditPage()),
        GetPage(name: RXLIST_FAV, page: () => FavoriteUsersView()),
        GetPage(name: ROUTE_STUDENT_LIST, page: () => StudentView()),
        GetPage(name: ROUTE_ADD_STUDENT, page: () => AddEditView()),
        GetPage(name: ROUTE_EDIT_STUDENT, page: () => AddEditView()),
        GetPage(name: NAV_USER_LIST, page: () => UserView()),
        GetPage(name: NAV_USER_ADD_EDIT, page: () => UserFormView()),
        GetPage(name: NAV_ERROR_CHECKING_PAGE, page: () => ErrorSnackBar()),
        GetPage(name: NAV_TODO_VIEW, page: () => TodoListScreen()),
        GetPage(name: NAV_ASYNC, page: () => AsyncView()),
        GetPage(name: NAV_AGE_CHECKER, page: () => AgeCheckerView()),
        GetPage(name: NAV_CHECK_PUB, page: () => PubCheck()),
        GetPage(name: NAV_CAMERA_PERMISSION, page: () => CameraPermission()),
        GetPage(name: NAV_LOCATION_PERMISSION, page: () => LocationPermission()),
        GetPage(name: NAV_FILE_PERMISSION, page: ()=>FilePermission()),
        GetPage(name: NAV_READ_DATA_FROM_EXTERNAL_STORAGE, page: ()=>FileReadExample()),
        GetPage(name: NAV_DISPLAY_WIDTH_HEIGHT, page: ()=>DisplayWidthHeight()),
        GetPage(name: NAV_COLOR_BASED_WEB_APP, page: ()=>ColorBaseWebApp()),
        GetPage(name: NAV_MEDIA_QUERY_PADDING, page: ()=>MediaQueryPadding()),
        GetPage(name: NAV_RESPONSIVE_GRID, page: ()=>ResponsiveGridView()),
        GetPage(name: NAV_DIFFERENT_WIDGET, page: ()=>DifferentWidgetView()),
        GetPage(name: "/firebase-database", page: ()=>UserViewFirebase()),
        GetPage(name: NAV_ANIMATED_MAP, page: ()=>AnimatedMarkerMap()),
        GetPage(name: NAV_ANIMATION, page: ()=>AnimationView())
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
