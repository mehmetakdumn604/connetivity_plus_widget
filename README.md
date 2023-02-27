 A connectivity status widget package

## Features
* You can display a widget on screen when internet is not connected 
* Widget will automatically appears when internet is not connected 
* Widget will  automatically disappears when internet is connected
* You can customize internet is not connected widget and its text
* There are different types of widget to display such as icon,text and text with red background
* This package is made with bloc 

## Usage
After adding dependency
This package is made with bloc so you also need to add flutter_bloc in pubspec.yaml then call this ConnectivityCubit()..initConnectivityService()  in your main under BlocProvider to connectivity widgets changes this in whole app


    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Flutter Flash Toast',
    home: BlocProvider(
    create: (context) => ConnectivityCubit()..initConnectivityService(),
    child: MyHomePage(),
                      ),
                     );
                                       }
                                        }



    class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(),
            body: const Center(child: ConnectivityWidget()),
                    );
            }
                }


    class _MyHomePageState extends State<MyHomePage> {
    @override
         Widget build(BuildContext context) {
           return Scaffold(
               appBar: AppBar(),
              body: const Center(child: ConnectivityWidget()),
       );
       }
        }
