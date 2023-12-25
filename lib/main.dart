import 'package:flutter/material.dart';

void main() {
  runApp(const AppKu());
}


class AppKu extends StatelessWidget{
  const AppKu({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Latihan 9',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home:
      // const FirstScreen(), // Panggil FirstScreen di sini
    const TwoScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{
  /*
  Pada kode di atas kita membuat sebuah StatelessWidget bernama FirstScreen, yang merupakan widget tampilan kita. Kemudian di dalam method build kita panggil Scaffold.
   */

  const FirstScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // ----------------------
      // menambahkan AppBar pada Scaffold.
      /*
      menambahkan parameter appBar pada Scaffold dan menambahkan title pada AppBar tersebut.
      Title di sini tidak hanya spesifik Text saja, melainkan juga dapat diisi dengan widget lainnya seperti TextField untuk kolom pencarian atau yang lainnya.
       */
        appBar: AppBar(
            title: const Text('Halaman Pertama'),
            // -----------------
            //   menambahkan widget-widget actions
            //   menambahkan menu ikon search

            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: (){},
              )
            ],
            // ------------------------------
            //   menambahkan ikon menu
            /*
          Tidak seperti pada actions, leading hanya dapat menampung satu widget saja. Secara default, leading akan berisi tombol untuk kembali ke halaman sebelumnya (jika tersedia), atau tombol untuk menu drawer (jika kita mengatur untuk drawer pada Scaffold tersebut)
           */
            leading: IconButton(
              icon: const Icon(
                  Icons.menu,
                  color: Colors.white
              ),
              onPressed: (){},
            )
        ),
        // ------------------------
        //   kode untuk menambahkan body.

        body: Container(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text("Tombol"),
                onPressed: () {
                  // Aksi ketika button diklik
                },
              ),
              TextButton(
                child: const Text('Text Button tanpa border'),
                onPressed: () {
                  // Aksi ketika button diklik
                },
              ),
              OutlinedButton(
                child: const Text('Outlined Button'),
                onPressed: (){

                },
              ),
              IconButton(
                icon: const Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: (){

                },
              ),

            ],
          )
        ),
        // -------------------

        //   kode untuk floatingactionbutton
        /*
        FloatingActionButton ini merupakan bagian dari Scaffold yang digunakan untuk menampilkan sebuah tombol aksi yang posisinya floating (melayang dan posisinya tetap).
         */
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){},
        )
    );
  }
}

// ------------
// cara dibawah menggunakan StatefulWidget{} untuk menampilkan dropdownButton
class TwoScreen extends StatefulWidget{
  const TwoScreen({Key? key}): super(key: key);

  @override
  State<TwoScreen> createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen>{
  String? language;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: DropdownButton<String>(
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'Dart',
            child: Text('Dart'),
          ),
          DropdownMenuItem<String>(
            value: 'Kotlin',
            child: Text('Kotlin'),
          ),
          DropdownMenuItem<String>(
            value: 'Swift',
            child: Text('Swift'),
          ),
        ],
        value: language,
        hint: const Text('Select Language'),
        onChanged: (String? value) {
          setState(() {
            language = value;
          });
        },
      ),
    );
  }
}
/*
Pada contoh tersebut DropdownButton tidak menggunakan child maupun children, akan tetapi menggunakan items di mana berisi list dari widget DropdownMenuItem.
 Pada widget DropdownMenuItem terdapat child untuk tiap itemnya dan value yang ada pada DropdownMenuItem adalah nilai dari tiap itemnya.
 Nantinya akan dibutuhkan parameter onChanged ketika ada perubahan atau ketika memilih salah satu dari item tersebut dan mengubah nilai language atau value dari DropdownButton tersebut.
 Sedangkan hint berfungsi ketika nilai value dari DropdownButton null atau kosong.
 */