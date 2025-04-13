import 'package:flutter/material.dart';
import 'package:flutter_fl/generated/assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../orderpage/view.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const ConfirmButton(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.1),
                child: IconButton(
                  onPressed: () => Get.to(OrderPage()),
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            expandedHeight: width * 0.6,
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  Assets.assetsBalckpizza,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                'پیتزا ایتالیایی',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate.fixed(const [
                NutrientCard(
                  title: 'کربوهیدرات',
                  value: '800/1300 mg',
                  icon: Icons.shopping_bag,
                  barColor: Colors.purple,
                  progress: 0.6,
                ),
                NutrientCard(
                  title: 'چربی و امگا ۳',
                  value: '500/1000 mg',
                  icon: Icons.science,
                  barColor: Colors.teal,
                  progress: 0.5,
                ),
                NutrientCard(
                  title: 'پروتئین',
                  value: '1100/1200 mg',
                  icon: Icons.egg,
                  barColor: Colors.deepOrange,
                  progress: 0.9,
                ),
                NutrientCard(
                  title: 'ویتامین',
                  value: '500/1000 mg',
                  icon: Icons.medical_services,
                  barColor: Colors.orangeAccent,
                  progress: 0.5,
                ),
                NutrientCard(
                  title: 'آب',
                  value: '800/1200 mg',
                  icon: Icons.water_drop,
                  barColor: Colors.blue,
                  progress: 0.66,
                ),
                NutrientCard(
                  title: 'مواد معدنی',
                  value: '800/1300 mg',
                  icon: Icons.grain,
                  barColor: Colors.green,
                  progress: 0.61,
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 160,
                childAspectRatio: 0.72,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FoodTableWidget()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'تخم مرغ آب پز و پنیر',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        '''
تخم‌مرغ آب‌پز و پنیر را کودکان می‌توانند در هر سه وعده ناهار، صبحانه و شام میل کنند. بشقاب در نظر گرفته شده شامل ۲۵۰ گرم وعده غذایی است که این وعده غذایی می‌تواند شامل ۲۵۰ گرم از خوراکی‌های متنوع باشد که علاوه بر تخم‌مرغ آب‌پز و پنیر، می‌تواند محتویات تازه مانند گوجه‌فرنگی، خیار، نان و سبزیجات تازه مانند نعنا، ریحان و کاهو نیز به آن اضافه شود. همچنین میزان قابل‌توجهی از مواد مغذی می‌تواند به تامین پروتئین و انرژی پایدار برای کودک کمک کند.

          ''',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color barColor;
  final double progress;

  const NutrientCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.barColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.black),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            color: barColor,
            backgroundColor: Colors.grey[200],
            minHeight: 4,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}

class FoodTableWidget extends StatelessWidget {
  const FoodTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'جدول محتویات غذایی',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.purple),
                    ),
                    child: const Text(
                      '۲۵۰ گرم',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              border: TableBorder(
                horizontalInside: BorderSide(color: Colors.grey.shade300),
              ),
              children: [
                _buildTableRow('محتویات', 'مقدار', isHeader: true),
                _buildTableRow('تخم‌مرغ', '۳۰ گرم'),
                _buildTableRow('نان لواش', '۳ کف‌دست'),
                _buildTableRow('پنیر', '۳۰ گرم'),
                _buildTableRow('خیار', '۳ عدد'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static TableRow _buildTableRow(String content, String amount,
      {bool isHeader = false}) {
    final textStyle = isHeader
        ? TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600])
        : const TextStyle(color: Colors.black);
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(content, style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(amount, style: textStyle, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
