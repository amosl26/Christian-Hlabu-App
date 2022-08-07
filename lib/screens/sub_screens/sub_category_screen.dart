import 'package:ChristianHlabu/config/app_theme.dart';
import 'package:ChristianHlabu/models/hymn_model.dart';
import 'package:ChristianHlabu/widgets/hymn_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubCategoryScreen extends StatefulWidget {
  List<HymnModel> data;

  SubCategoryScreen({required this.data});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: primaryText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.data[0].category,
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            color: primaryText,
            onPressed: () {},
            icon: SvgPicture.asset(
              iconsPath + "search.svg",
              color: primaryText,
            ),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return HymnsCardWidget(
              id: widget.data[index].id!,
              pageNumber: widget.data[index].pageNumber,
              title: widget.data[index].title,
              songNumber: widget.data[index].songNumber,
              category: widget.data[index].category,
              isVisible: false,
            );
            ;
          },
          separatorBuilder: (BuildContext context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: widget.data.length),
    );
  }
}
