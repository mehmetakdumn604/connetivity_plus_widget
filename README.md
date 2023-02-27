
Are you looking for a simple way to display the current network connectivity status in your Flutter app? Check out the "connectivity_plus_widget" package on the Dart programming language's package repository, pub.dev!

This package provides a customizable widget that automatically appears when there is no internet connection and disappears when the connection is restored. You can also customize the properties of the widget and pass your own widget to use instead. Plus, the package allows you to use the connectivity plus widget anywhere in your application.

If you want to simplify the management of network connectivity in your Flutter app, give the "connectivity_plus_widget" package a try. It could save you time and effort in your app development journey!



## Features

* Widget will automatically appears when internet is not connected
* Widget will automatically disappears when internet is connected
* You can customize the properties of connectivity plus widget
* You can pass your own widget
* You can use connectivity plus widget in anywhere in application
* You can also check internet status before calling api or any network operation
* Package also support marquee text 

## Usage

After adding dependency add the below  code in main function to enable connectivity check stream for whole
app

       WidgetsFlutterBinding.ensureInitialized();
       ConnectivityPlusService().initConnectivityService();

## Example
 
    void main() async {
   
       WidgetsFlutterBinding.ensureInitialized();

       ConnectivityPlusService().initConnectivityService();

       runApp(const MyApp());

     }


## Calling Widget
   
    ConnectivityPlusWidget(
            backgroundColor:Colors.red,
            height:40,
            marquee: false,
            textStyle:const TextStyle(fontSize: 20,color: Colors.white),
          ),


    ConnectivityPlusCustomWidget(
            customWidget: const Center( child: Icon(Icons.wifi_off_outlined,color: Colors.red,size: 100,),
           ),
          ),

    
    ConnectivityPlusWidget(
            backgroundColor:Colors.orange,
            height:40,
            marquee: true,

            textStyle:const TextStyle(fontSize: 20,color: Colors.white),
            decoration:  BoxDecoration(
                color: Colors.orange, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(20.0),
                    topRight: const  Radius.circular(20.0))
            ),

          ),

## Check Internet Status 


if you want check internet status before calling api or any network operation call the below function ConnectivityPlusService which returns boolean

    ConnectivityPlusService().getInternetStatus()
    log(ConnectivityPlusService().getInternetStatus().toString(),name:"status");


![Sample: ](https://firebasestorage.googleapis.com/v0/b/fluttermania-eebe3.appspot.com/o/connectivity_plus_media%2Fezgif-3-4213079cb3.gif?alt=media&token=2ae8023d-52ae-48e6-825c-94a98ace8bb9)
![Sample: ](https://firebasestorage.googleapis.com/v0/b/fluttermania-eebe3.appspot.com/o/connectivity_plus_media%2F1677491833746.JPEG?alt=media&token=c76ee3bb-10d8-4b2f-ab4d-3278fa17c884)
![Sample: ](https://firebasestorage.googleapis.com/v0/b/fluttermania-eebe3.appspot.com/o/connectivity_plus_media%2F1677493521249.JPEG?alt=media&token=d5fcc1ed-5ebf-40c1-a237-457da3a44112)


## Additional information

for further contact us on flutter.hasan@gmail.com
  

