import 'package:ChristianHlabu/config/app_theme.dart';
import 'package:ChristianHlabu/controllers/main_controller.dart';
import 'package:ChristianHlabu/models/hymn_model.dart';
import 'package:ChristianHlabu/screens/about_screen.dart';
import 'package:ChristianHlabu/screens/sub_screens/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "Categories",
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              }, // Image tapped
              child: Image.asset(
                iconsPath + 'info2.png',
                color: primaryText,
                height: 5,
                width: 23,
              ),
            ),
          ),
        ],
      ),
      body: provider.Consumer<MainController>(
        builder: (context, data, child) {
          if (data.allCategory.isEmpty) {
            data.getHymnCategory();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.allCategory.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          onTap: () {
                            List<HymnModel> info =
                                data.getDataInSelectedCategory(
                                    data.allCategory[index]);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SubCategoryScreen(data: info)));
                          },
                          leading: Text(index.toString()),
                          title: Text(data.allCategory[index].toUpperCase()),
                        );
                      },
                      separatorBuilder: (BuildContext context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: data.allCategory.length),
                ),
              ],
            );
          }
          return const Center(child: Text("Error, Try refresh the screen."));
        },
      ),
    );
  }
}
