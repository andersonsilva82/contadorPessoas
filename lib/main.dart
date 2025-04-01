import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main()
{
    runApp(const MyApp());
}

class HomePage extends StatefulWidget
{
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
    int count = 0;
    String banner = 'ACEITANDO CLIENTES';

    bool get isEmpty => count == 0;
    bool get isFull => count == 20;

    void increment()
    {
        setState(()
            {
                count++;
            }
        );
    }

    void decrement()
    {
        setState(()
            {
                count--;
            }
        );

    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/bg_app.jpg'),
                        fit: BoxFit.cover

                    ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                        Text(isFull ? 'Lotado' : 'Aceitando clientes',
                            style: TextStyle(color:
                                Colors.purpleAccent,
                                fontSize: 30,
                                fontFamily: "Stencil",
                            ),
                        ),

                        Padding(padding: EdgeInsets.fromLTRB(5, 100, 5, 200),
                            child:
                            Text('$count',
                                style: isFull ? TextStyle(fontSize: 100, color: Colors.red) :
                                    TextStyle(fontSize: 100, color: Colors.white),
                            ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: const Size(180, 100),
                                        foregroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.red, width: 4),
                                            borderRadius: BorderRadius.circular(20),
                                        ),
                                    ),
                                    onPressed: isEmpty ? null : decrement,
                                    child: Text("SAIU", style: TextStyle(fontSize: 30),)
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: isFull ? Colors.white30 : Colors.white,
                                        fixedSize: const Size(180, 100),
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.white, width: 2),
                                            borderRadius: BorderRadius.circular(20),
                                        ),
                                    ),
                                    onPressed: isFull ? null : increment,
                                    child: Text("Entrou", style: TextStyle(fontSize: 30), )
                                ),
                            ],
                        ),

                    ],
                ),
            ),

        );  // widget principal
    }
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            debugShowCheckedModeBanner: false, //retirar o banner de debug
            home: HomePage(),
        );
    }
}

