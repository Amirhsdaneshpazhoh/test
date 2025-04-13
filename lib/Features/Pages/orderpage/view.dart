import 'package:flutter/material.dart';
import 'package:flutter_fl/generated/assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Fooddetail/view.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: ConfirmButton(),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          size: size.width * 0.045,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'ثبت غذایی جدید',
                            style: TextStyle(
                              fontSize: size.width * 0.065,
                              fontFamily: 'Vazir',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'وجدهای غذایی پیشنهادی و اساس گزارش هفتگی و میزان نیاز آگاه به مواد مغذی ارائه شده است.',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextField(

                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(

                            hintText: 'نام غذا را وارد کنید...',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: size.width * 0.04,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'وعده رو پیدا نکردی؟ ',
                                style: TextStyle(
                                  fontSize: size.width * 0.037,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              TextSpan(
                                text: 'وعده خودت رو بساز!',
                                style: TextStyle(
                                  fontSize: size.width * 0.037,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                  fontFamily: 'Vazir',
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) => FoodItem(),
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatefulWidget {
  const FoodItem({super.key});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          Get.to(FoodDetailPage());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[250],
            border: Border.all(color: Colors.grey),
          ),
          width: double.infinity,
          height: 110,
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[250],
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: isSelected
                      ? Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff6937f0),
                    ),
                  )
                      : null,
                ),
              ),
              SizedBox(width: size.width * 0.27),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'غذا سرشار از پروتئین',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.030,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'تخم مرغ آب پز',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsHamburger),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 80,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Color(0xff6937f0),
        ),
        height: 60,
        child: const Center(
          child: Text(
            'افزودن غذا',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
