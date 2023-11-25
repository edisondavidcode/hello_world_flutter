import 'package:flutter/material.dart';

class CounterFunctionsCreen extends StatefulWidget {
  const CounterFunctionsCreen({super.key});

  @override
  State<CounterFunctionsCreen> createState() => _CounterFunctionsCreenState();
}

class _CounterFunctionsCreenState extends State<CounterFunctionsCreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Functions Screen')),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(clickCounter.toString(),
              style: const TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 45, 100))),
          Text(
            'Click${clickCounter == 1 ? '' : 's'}',
            style: const TextStyle(fontSize: 25),
          )
        ]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),

          // Separacion
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            },
          ),

          // Separacion
          const SizedBox(height: 10),

          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(), onPressed: onPressed, child: Icon(icon));
  }
}
