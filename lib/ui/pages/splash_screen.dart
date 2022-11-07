import '../../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'converter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _aniController;
  bool copAnimated = false;
  bool animateText = false;

  @override
  void initState() {
    super.initState();
    _aniController = AnimationController(vsync: this);
    _aniController.addListener(() {
      if (_aniController.value > 0.7) {
        _aniController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _aniController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myColor,
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(copAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/coinfall.json',
                    controller: _aniController,
                    onLoaded: (composition) {
                      _aniController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset( 'assets/currency.png', height: 190.0, width: 190.0,  ),
                ),
                const SizedBox(height: 50.0),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text( 'CURRENCY - CONVERTER', style: TextStyle(fontSize: 30.0, color: myColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text( 'Mision Tic 2022', style: TextStyle( fontSize: 27.0, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 30.0),
            Text( 'Convertidor de Divisas - NRC2288 - Grupo 12',style: TextStyle( fontSize: 15.0,  color: Colors.white.withOpacity(0.8), height: 1.5, ), ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: //Icon(  Icons.chevron_right, size: 50.0, color: Colors.white,  ),
                    IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConverterPage()),
                      );
                    },
                    icon: const Icon( Icons.arrow_forward_ios,  color: Colors.redAccent, ),
                    iconSize: 50,
                  ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
