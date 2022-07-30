import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controllers/main_controller.dart';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/screens/sub_screens/sub_category_screen.dart';
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
      ),
      body: provider.Consumer<MainController>(
        builder: (context, data, child) {
          if (data.hymnItems.isEmpty) {
            data.getHymnCategory();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.hymnItems.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          onTap: () {
                            List<HymnModel> data =
                                provider.Provider.of<MainController>(context,
                                        listen: false)
                                    .getDataInSelectedCategory(
                                        provider.Provider.of<MainController>(
                                                context,
                                                listen: false)
                                            .allCategory[index]);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SubCategoryScreen(data: data)));
                          },
                          leading: Text(index.toString()),
                          title: Text(provider.Provider.of<MainController>(
                                  context,
                                  listen: false)
                              .allCategory[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: provider.Provider.of<MainController>(context,
                              listen: false)
                          .allCategory
                          .length),
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
