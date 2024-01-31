import 'package:flutter/material.dart';
import 'package:my_project/my_project.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  int n =0;
  int result =0;
  final MyProject _myProject = MyProject(0);
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, 
            title: const Text('Chu Công Vĩnh')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Value(x): ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                ' ${_myProject.value}',
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Nhập số mũ n',
                  ),
                  onChanged: (value) {
                    setState(() {
                      n = int.parse(value);
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _myProject.increase();
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Tăng')),
                // const SizedBox( width: 5),
                OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _myProject.decrease();
                      });
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Giảm')),
                    ElevatedButton(
                onPressed:(){
                  setState(() {
                    // Gọi phương thức đặt giá trị 
                    _myProject.value=0;
                  });
                },
                child: const Text('Value mặc định(0)'),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _myProject.square();
                        });
                      },
                      child: const Text('x*x')),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _myProject.power(3);
                        });
                      },
                      child: const Text('x^3')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                 const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = pow(n.toDouble(), n.toDouble()).toInt();
                  });
                },
                child: const Text('Tính lũy thừa với số mũ n'),
              ),
              const SizedBox(height: 20),
              Text(
                'Kết quả: $result',
                style: const TextStyle(fontSize: 20),
              ),
                ],
              )
            ],
          ),
        ));
  }
}
