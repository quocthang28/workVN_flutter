import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/location_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/nearby_post/NearbyPost.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:location/location.dart';

class NearMeScreen extends StatefulWidget {
  @override
  _NearMeScreenState createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen>
    with AutomaticKeepAliveClientMixin<NearMeScreen> {
  RecruitmentPostController _recruitmentPostController = Get.find();
  LocationController _locationController = Get.find();
  Location _location = Location();
  NearbyPost _nearbyPost = NearbyPost();
  late LocationData _locationData;
  String locationName = '';
  int _distance = 10;
  bool isLoading = true;

  Future getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
  }

  @override
  bool get wantKeepAlive => true;

  void getNearbyPost() {
    _recruitmentPostController.getNearbyPosts(
        _locationData.longitude.toString(),
        _locationData.latitude.toString(),
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
      "page_number": 1,
      "sort_type": "createdAt",
      "max_distance": 10
    }).then((value) {
      setState(() {
        _nearbyPost = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getLocation().then((value) {
      _locationController
          .getLocation(_locationData.latitude.toString(),
              _locationData.longitude.toString())
          .then((value) {
        setState(() {
          locationName = value.name!;
        });
      });
    }).then((value) => getNearbyPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildNearbyPosts() {
      return Gaps.empty;
    }

    super.build(context);
    return Scaffold(
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
                        locationName == ''
                            ? 'Đang lấy vị trí...'.text.size(16).make()
                            : locationName.text.size(16).make()
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
                                DropdownMenuItem(child: Text("1 km"), value: 1),
                                DropdownMenuItem(child: Text("3 km"), value: 3),
                                DropdownMenuItem(child: Text("5 km"), value: 5),
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
                                print(_distance);
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
                  onPressed: () {},
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
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                : Container(
                    child: _nearbyPost.data!.first.jobTitle!.text.make(),
                  ),
          ],
        ),
      ),
    );
  }
}
