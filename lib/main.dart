import 'dart:io';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_info/system_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Device Info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Loading...";
  late String model,
      manufacturer,
      hardware,
      display,
      ram,
      storage,
      version,
      kernel,
      kversion,
      karchitecture;
  late List<CameraDescription> _cameras;
  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  // print('Android - Running on ${androidInfo.model}');
  // print(androidInfo.manufacturer);
  // print(androidInfo.model);
  // print(androidInfo.hardware);
  // print(androidInfo.display);
  // print(SysInfo.getTotalPhysicalMemory() / 1073741824);
  // print(await DiskSpace.getTotalDiskSpace);
  // print(androidInfo.version.baseOS);
  // print(SysInfo.kernelName);
  // print(SysInfo.kernelVersion);
  // print(SysInfo.kernelArchitecture);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            const Text(
              "YOUR DEVICE INFORMATION",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Model   : $model",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Manufacturer   : $manufacturer",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Device Hardware  : $hardware",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Display  : $display",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "RAM   : $ram GB",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Device Storage  : $storage GB",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Model  : $model",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Android Version  :  $version",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kernel   : $kernel",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kernel Vesrion : $kversion",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kernel Architecture : $karchitecture ",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      int deviceMem;
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      print('Android - Running on ${androidInfo.model}');
      print(androidInfo.manufacturer);
      print(androidInfo.model);
      print(androidInfo.hardware);
      print(androidInfo.display);
      print(SysInfo.getTotalPhysicalMemory() / 1073741824);
      print(await DiskSpace.getTotalDiskSpace);
      var temp = await DiskSpace.getTotalDiskSpace;
      print(androidInfo.version.baseOS);
      print(SysInfo.kernelName);
      print(SysInfo.kernelVersion);
      print(SysInfo.kernelArchitecture);
      setState(() {
        model = androidInfo.model!;
        manufacturer = androidInfo.manufacturer!;
        hardware = androidInfo.hardware!;
        display = androidInfo.display!;
        ram = ((SysInfo.getTotalPhysicalMemory() / 1073741824)).toString();
        storage = (temp! / 1024).toString();
        version = androidInfo.version.baseOS!;
        kernel = SysInfo.kernelName;
        kversion = SysInfo.kernelVersion;
        karchitecture = SysInfo.kernelArchitecture;
      });
    }
  }
}
