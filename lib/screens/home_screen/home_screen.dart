import 'package:flutter/material.dart';
import 'package:flutter_pet_app/models/category_model.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F7),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBarWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(32),
                const Text(
                  "Hi Jack",
                  style: TextStyle(
                    fontFamily: 'poppins_bold',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "Good Morning!",
                  style: TextStyle(
                    fontFamily: 'poppins_regular',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const Gap(4),
                const BannerWidget(),
                // !start of category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontFamily: 'poppins_bold',
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: CategoryService.categoryLists.length,
                        itemBuilder: (BuildContext context, int index) {
                          var categories = CategoryService.categoryLists[index];
                          return GestureDetector(
                            child: CategoryWidget(
                              categoryImage: categories.categoryImage,
                              categoryName: categories.categoryName,
                              currentIndex: _currentIndex,
                              index: categories.id,
                            ),
                            onTap: () {
                              print("index ${categories.id}");
                              setState(() {
                                _currentIndex = categories.id;
                              });
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 24);
                        },
                      ),
                    ),
                  ],
                ),
                // !end of category
                const Gap(16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryService
                        .categoryLists[_currentIndex].petmodels.length,
                    itemBuilder: (BuildContext context, int index) {
                      var category = CategoryService
                          .categoryLists[_currentIndex].petmodels[index];
                      return PetWidget(
                        petName: category.petName,
                        petDistance: category.petDistance,
                        petImage: category.petImage,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 24);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
