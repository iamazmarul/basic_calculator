import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Basic Calculator",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fieldNoOne = TextEditingController();
  final TextEditingController _fieldNoTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _fieldNoOne,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Field 1"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Valid No";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _fieldNoTwo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Field 2"),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Valid No";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 12,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                            double.parse(_fieldNoOne.text);
                        double secondNumber =
                            double.parse(_fieldNoTwo.text);
                        result = firstNumber + secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.add, size: 15,),
                    label: const Text("ADD"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                        double.parse(_fieldNoOne.text);
                        double secondNumber =
                        double.parse(_fieldNoTwo.text);
                        result = firstNumber - secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.remove, size: 15,),
                    label: const Text("Sub"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                        double.parse(_fieldNoOne.text);
                        double secondNumber =
                        double.parse(_fieldNoTwo.text);
                        result = firstNumber * secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.star, size: 15,),
                    label: const Text("Mul"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                        double.parse(_fieldNoOne.text);
                        double secondNumber =
                        double.parse(_fieldNoTwo.text);
                        result = firstNumber / secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.dnd_forwardslash, size: 15,),
                    label: const Text("Dev"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                        double.parse(_fieldNoOne.text);
                        double secondNumber =
                        double.parse(_fieldNoTwo.text);
                        result = firstNumber % secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.share, size: 15,),
                    label: const Text("Mod"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Result Is: $result",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

