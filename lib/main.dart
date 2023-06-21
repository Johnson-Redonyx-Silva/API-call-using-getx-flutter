import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: GetBuilder<UniversityController>(
        init: UniversityController(),
        builder: (controller) => LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/loginn.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Indigo-colored overlay
          Container(
            color: Colors.indigo.withOpacity(0.9),
          ),
          // Login content
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Voo - Find Your\nDream Job Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Finding,Connecting\nBusiness Success',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the next screen
          Get.to(NextScreen());
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
  }
}

class NextScreen extends GetView<UniversityController> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/profile_image.png',
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Emma R.",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Quality Assurance",
              style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/bell.png',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Find a job",
                  style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              focusNode: searchFocusNode,
              onTap: () {
                searchFocusNode.requestFocus();
                controller.setSearchVisible(true);
              },
              onChanged: (value) {
                controller.filterUniversities(value);
              },
              decoration: InputDecoration(
                hintText: 'Job title or keyword',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Obx(() {
              if (!controller.isSearchVisible.value) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Popoular jobs",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                            color: Colors.indigo,
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          child: Image.asset(
                                            'assets/images/profile_image.png',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("UX Researcher",style: TextStyle(color: Colors.white,fontSize: 20,),),
                                                SizedBox(width: 155,),
                                                Icon(Icons.save,color: Colors.white,),
                                              ],
                                            ),
                                            Text("Miro Inc.",style: TextStyle(color: Colors.grey,fontSize: 15,),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Full Time button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigo.shade400,
                                          ),
                                          child: Text(
                                            'Full Time',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),SizedBox(width: 10,),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Senior Level button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigo.shade400,
                                          ),
                                          child: Text(
                                            'Senior Level',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New York,NY",style: TextStyle(color: Colors.white,fontSize: 15),),
                                        Text("20 hours ago",style: TextStyle(color: Colors.indigo.shade400,fontSize: 15),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                            color: Colors.white,
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          child: Image.asset(
                                            'assets/images/profile_image.png',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Quality Assurance",style: TextStyle(color: Colors.black,fontSize: 20,),),
                                                SizedBox(width: 125,),
                                                Icon(Icons.save),
                                              ],
                                            ),
                                            Text("Zapier Inc.",style: TextStyle(color: Colors.grey,fontSize: 15,),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Full Time button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[200],
                                          ),
                                          child: Text(
                                            'Full Time',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),SizedBox(width: 10,),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Senior Level button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[200],
                                          ),
                                          child: Text(
                                            'Senior Level',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),SizedBox(width: 10,),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Senior Level button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[200],
                                          ),
                                          child: Text(
                                            'Remote',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("California,CA",style: TextStyle(color: Colors.black,fontSize: 15),),
                                        Text("1 day ago",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                            ),
                            color: Colors.white,
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          child: Image.asset(
                                            'assets/images/profile_image.png',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Project Designer",style: TextStyle(color: Colors.black,fontSize: 20,),),
                                                SizedBox(width: 135,),
                                                Icon(Icons.save),
                                              ],
                                            ),
                                            Text("Miro Inc.",style: TextStyle(color: Colors.grey,fontSize: 15,),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Full Time button press
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[200],
                                          ),
                                          child: Text(
                                            'Full Time',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Tennessee,TN",style: TextStyle(color: Colors.black,fontSize: 15),),
                                        Text("1 day ago",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (controller.filteredUniversities.isEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Search Results..."),
                  ],
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.filteredUniversities.length,
                    itemBuilder: (context, index) {
                      final university = controller.filteredUniversities[index];
                      return Card(
                        child: ListTile(
                          title: Text(university['name']),
                          subtitle: Text(university['country']),
                          // Add more information as desired
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}


class UniversityController extends GetxController {
  final universities = <dynamic>[].obs;
  final filteredUniversities = <dynamic>[].obs;
  final isSearchVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUniversities();
  }

  void fetchUniversities() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=India'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      universities.value = data;
      filteredUniversities.value = data;
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  void filterUniversities(String keyword) {
    if (keyword.isEmpty) {
      filteredUniversities.value = [];
    } else {
      filteredUniversities.value = universities
          .where((uni) =>
      uni['country'].toString().toLowerCase().contains(keyword.toLowerCase()) ||
          uni['alpha_two_code'].toString().toLowerCase().contains(keyword.toLowerCase()) ||
          uni['name'].toString().toLowerCase().contains(keyword.toLowerCase()) ||
          uni['state-province'].toString().toLowerCase().contains(keyword.toLowerCase()) ||
          (uni['domains'] as List<dynamic>)
              .any((domain) => domain.toString().toLowerCase().contains(keyword.toLowerCase())))
          .toList();
    }
  }

  void setSearchVisible(bool visible) {
    isSearchVisible.value = visible;
  }
}
