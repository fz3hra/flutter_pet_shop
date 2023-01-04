import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:lottie/lottie.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Lottie.asset("assets/lottie/no_fav.json", controller: _controller,
              onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          }),
          const Center(
            child: Text(
              "You have no favourites",
              style: TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 24,
                color: ColorConstants.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
