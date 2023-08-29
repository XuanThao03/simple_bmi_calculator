import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/constants/app_colors.dart';
import 'package:simple_bmi_caculator/routes/slide_route.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _alignController;
  late Animation _amountController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _alignController =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight)
            .animate(_controller);
    _amountController = IntTween(begin: 15, end: 0).animate(_controller);

    //   Future.delayed(Duration(milliseconds: 2500), () {
    //     Navigator.pushNamed(context, RouteGenerator.inputPage);

    ;

    _amountController.addListener(() {
      if (_amountController.value == 0) {
        Future.delayed(const Duration(milliseconds: 50), () {
          //Navigator.pushNamed(context, RouteGenerator.inputPage);
          Navigator.of(context).push(createRoute());
        });
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return Container(
              //margin: const EdgeInsets.symmetric(horizontal: 20),
              width: 350,
              decoration: const BoxDecoration(
                  color: AppColors.appPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 50,
              child: Stack(
                children: [
                  Align(
                    alignment: _alignController.value,
                    //alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/pacman.png',
                      width: 50,
                    ),
                  ),
                  Visibility(
                    visible: _amountController.value == 0 ? false : true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        //color: Colors.amber,
                        height: 10,

                        alignment: Alignment.centerRight,
                        child: ListView.builder(
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            //itemCount: 0,
                            itemCount: _amountController.value,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 10,
                                width: 10,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white54,
                                ),
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
