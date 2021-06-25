import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/job_detail_controller/job_detail_controller.dart';
import 'package:workvn/controller/job_type_controller.dart';
import 'package:workvn/controller/location_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/nearby_post/NearbyPost.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:workvn/ui/common_widgets/nearby_tile.dart';

class NearMeScreen extends StatefulWidget {
  @override
  _NearMeScreenState createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen>
    with AutomaticKeepAliveClientMixin<NearMeScreen> {
  RecruitmentPostController _recruitmentPostController = Get.find();
  JobTypeController _jobTypeController = Get.find();
  LocationController _locationController = Get.find();
  JobDetailController _jobDetailController = Get.find();
  NearbyPost _nearbyPost = NearbyPost();
  String locationName = '';
  int _distance = 10;
  bool isLoading = true;
  String _keyWord = '';
  var _selectedSalaries = RangeValues(5, 20);

  void getNearbyPost(int distance) {
    _recruitmentPostController.getNearbyPosts(
        _locationController.locationData.longitude.toString(),
        _locationController.locationData.latitude.toString(),
        '', {
      "match_data": {
        "list_job_detail_id": [],
        "job_level_id": null,
        "salary_range_id": null,
        "min_salary": 0,
        "max_salary": 9000,
        "job_type_id": null,
        "company_id": ""
      },
      "page_number": 5,
      "sort_type": "createdAt",
      "max_distance": distance
    }).then((value) {
      setState(() {
        _nearbyPost = value;
        isLoading = false;
      });
    });
  }

  void getNearbyPostWithKeyWord(String keyWord, int distance) {
    setState(() {
      isLoading = true;
    });
    _recruitmentPostController.getNearbyPosts(
        _locationController.locationData.longitude.toString(),
        _locationController.locationData.latitude.toString(),
        keyWord, {
      "match_data": {
        "list_job_detail_id": [],
        "job_level_id": null,
        "salary_range_id": null,
        "min_salary": 0,
        "max_salary": 9000,
        "job_type_id": null,
        "company_id": ""
      },
      "page_number": 5,
      "sort_type": "createdAt",
      "max_distance": _distance
    }).then((value) {
      setState(() {
        _nearbyPost = value;
        isLoading = false;
      });
    });
  }

  void getNearbyPostWithFilter(
      Map<String, dynamic> filterBody, String keyWord, int distance) {
    setState(() {
      isLoading = true;
    });
    _recruitmentPostController
        .getNearbyPosts(
            _locationController.locationData.longitude.toString(),
            _locationController.locationData.latitude.toString(),
            keyWord,
            filterBody)
        .then((value) {
      setState(() {
        _nearbyPost = value;
        isLoading = false;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    getNearbyPost(_distance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _buildFilterSheet(
        BuildContext context, void Function(void Function()) setState) {
      var categoryDropDownValue =
          _jobDetailController.allCategories.data!.first.id!;
      var jobTypeDropDownValue = _jobTypeController.jobType.data!.first.id!;
      var jobLevelDropDownValue = _jobTypeController.jobLevel.data!.first.id!;

      Map<String, String> categories = Map();
      Map<String, String> jobTypes = Map();
      Map<String, String> jobLevels = Map();

      _jobDetailController.allCategories.data!.forEach((element) {
        categories[element.JobDetailName!] = element.id!;
      });

      _jobTypeController.jobType.data!.forEach((element) {
        jobTypes[element.jobTypeName!] = element.id!;
      });

      _jobTypeController.jobLevel.data!.forEach((element) {
        jobLevels[element.jobLevelName!] = element.id!;
      });

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          'Bộ lọc'
              .text
              .semiBold
              .size(18)
              .color(AppColor.lightBlue)
              .make()
              .p(8),
          Align(
                  alignment: Alignment.centerLeft,
                  child: 'Ngành nghề'.text.size(16).semiBold.make())
              .pOnly(left: 8),
          Container(
            width: Get.width,
            child: DropdownButton(
              hint: 'Chọn ngành nghề'.text.make(),
              icon: Icon(Icons.expand_more_rounded),
              underline: Gaps.empty,
              value: categoryDropDownValue,
              items: categories
                  .map((description, value) {
                    return MapEntry(
                        description,
                        DropdownMenuItem<String>(
                          value: value,
                          child: Text(description),
                        ));
                  })
                  .values
                  .toList(),
              onChanged: (value) {
                setState(() {
                  categoryDropDownValue = value as String;
                });
                print(categoryDropDownValue);
              },
            ),
          ).pOnly(left: 8),
          Align(
                  alignment: Alignment.centerLeft,
                  child: 'Loại hình công việc'.text.size(16).semiBold.make())
              .pOnly(left: 8),
          Container(
            width: Get.width,
            child: DropdownButton(
              hint: 'Chọn kiểu công việc'.text.make(),
              icon: Icon(Icons.expand_more_rounded),
              underline: Gaps.empty,
              value: jobTypeDropDownValue,
              items: jobTypes
                  .map((description, value) {
                    return MapEntry(
                        description,
                        DropdownMenuItem<String>(
                          value: value,
                          child: Text(description),
                        ));
                  })
                  .values
                  .toList(),
              onChanged: (value) {
                setState(() {
                  jobTypeDropDownValue = value as String;
                });
                print(value);
              },
            ),
          ).pOnly(left: 8),
          Align(
                  alignment: Alignment.centerLeft,
                  child: 'Cấp bậc'.text.size(16).semiBold.make())
              .pOnly(left: 8),
          Container(
            width: Get.width,
            child: DropdownButton(
              hint: 'Chọn kiểu công việc'.text.make(),
              icon: Icon(Icons.expand_more_rounded),
              underline: Gaps.empty,
              value: jobLevelDropDownValue,
              items: jobLevels
                  .map((description, value) {
                    return MapEntry(
                        description,
                        DropdownMenuItem<String>(
                          value: value,
                          child: Text(description),
                        ));
                  })
                  .values
                  .toList(),
              onChanged: (value) {
                setState(() {
                  jobLevelDropDownValue = value as String;
                });
                print(jobLevelDropDownValue);
              },
            ),
          ).pOnly(left: 8),
          Align(
                  alignment: Alignment.centerLeft,
                  child: 'Mức lương'.text.size(16).semiBold.make())
              .pOnly(left: 8),
          Column(
            children: <Widget>[
              RangeSlider(
                inactiveColor: Colors.grey[300],
                activeColor: AppColor.lightBlue,
                values: _selectedSalaries,
                onChanged: (newRange) {
                  setState(() {
                    _selectedSalaries = newRange;
                  });
                },
                min: 0,
                max: 50,
                divisions: 5,
                labels: RangeLabels('${_selectedSalaries.start * 100}',
                    '${_selectedSalaries.end * 100}'),
              ),
              SizedBox(
                width: double.infinity,
                child:
                    '${_selectedSalaries.start * 100}\$ - ${_selectedSalaries.end * 100}\$'
                        .text
                        .align(TextAlign.right)
                        .make(),
              ).pOnly(right: 8),
            ],
          ),
          SizedBox(
            width: Get.width,
            child: TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: AppColor.lightBlue),
                  ),
                ),
                onPressed: () {
                  Map<String, dynamic> filterMap = {
                    "match_data": {
                      "list_job_detail_id": [categoryDropDownValue],
                      "job_level_id": null,
                      "salary_range_id": null,
                      "min_salary": 0,
                      "max_salary": 0,
                      "job_type_id": null,
                      "company_id": ""
                    },
                    "page_number": 5,
                    "sort_type": "createdAt",
                    "max_distance": _distance
                  };

                  getNearbyPostWithFilter(filterMap, _keyWord, _distance);
                  Navigator.pop(context);
                },
                child: 'LỌC'.text.color(AppColor.lightBlue).semiBold.make()),
          ).p(8),
        ],
      );
    }

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: 'Việc làm gần đây'
              .text
              .semiBold
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColor.lightBlue,
                        size: 25,
                      ),
                      Gaps.hGap8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Vị trí hiện tại:'.text.semiBold.size(16).make(),
                          Gaps.vGap4,
                          _locationController.locationName == ''
                              ? 'Đang lấy vị trí...'.text.size(16).make()
                              : _locationController.locationName.text
                                  .size(16)
                                  .make()
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 35,
                          child: VerticalDivider(color: Colors.black)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          'Khoảng cách:'.text.semiBold.size(16).make(),
                          Gaps.vGap4,
                          SizedBox(
                            height: 20,
                            child: DropdownButton(
                                icon: Icon(Icons.expand_more_rounded),
                                underline: Gaps.empty,
                                value: _distance,
                                items: [
                                  DropdownMenuItem(
                                      child: Text("1 km"), value: 1),
                                  DropdownMenuItem(
                                      child: Text("3 km"), value: 3),
                                  DropdownMenuItem(
                                      child: Text("5 km"), value: 5),
                                  DropdownMenuItem(
                                      child: Text("10 km"), value: 10),
                                  DropdownMenuItem(
                                      child: Text("15 km"), value: 15),
                                  DropdownMenuItem(
                                      child: Text("20 km"), value: 20),
                                  DropdownMenuItem(
                                      child: Text("30 km"), value: 30),
                                  DropdownMenuItem(
                                      child: Text("50 km"), value: 50),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _distance = value as int;
                                  });
                                  getNearbyPostWithKeyWord(
                                      _keyWord, value as int);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ).pSymmetric(h: 8),
              Gaps.vGap10,
              Row(
                children: [
                  TextField(
                    onSubmitted: (value) {
                      _keyWord = value;
                      getNearbyPostWithKeyWord(value, _distance);
                    },
                    onChanged: (value) {
                      if (value == '') {
                        _keyWord = '';
                        setState(() {
                          isLoading = true;
                        });
                        getNearbyPost(_distance);
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      hintText: 'Nhập từ khóa',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.textFieldColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ).pOnly(left: 8).pSymmetric(v: 4).expand(),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context,
                                    void Function(void Function()) setState) {
                              return _buildFilterSheet(context, setState);
                            });
                          });
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: AppColor.lightBlue,
                    ),
                  ),
                ],
              ),
              isLoading
                  ? SizedBox(
                      width: double.infinity,
                      height: 350.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: ListView.builder(
                          itemBuilder: (_, __) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.0),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          itemCount: 6,
                        ),
                      ),
                    ).pSymmetric(h: 8, v: 20)
                  : ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          NearbyTile.buildInstance(_nearbyPost.data![index]),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1.0,
                            color: Colors.grey[300],
                          ).pSymmetric(h: 16),
                      itemCount: _nearbyPost.data!.length),
            ],
          ),
        ),
      ),
    );
  }
}
