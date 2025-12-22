import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý Thư viện',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF0D47A1),
      ),
      home: const HomePage(),
    );
  }
}
/// ABSTRACTION
abstract class Person {
  String getName();
  String getRole();
}

/// INHERITANCE + ENCAPSULATION
class User extends Person {
  String _name;

  User(this._name);

  @override
  String getName() => _name;

  void setName(String name) {
    _name = name;
  }

  @override
  String getRole() => "User";
}

/// POLYMORPHISM
class Staff extends User {
  Staff(String name) : super(name);

  @override
  String getRole() => "Nhân viên";
}

class Reader extends User {
  Reader(String name) : super(name);

  @override
  String getRole() => "Người đọc";
}

/// ABSTRACTION
abstract class LibraryItem {
  String getInfo();
}

/// BOOK – ENCAPSULATION
class Book extends LibraryItem {
  String _title;
  bool _isBorrowed;

  Book(this._title, this._isBorrowed);

  String get title => _title;
  bool get isBorrowed => _isBorrowed;

  void borrow() => _isBorrowed = true;
  void returnBook() => _isBorrowed = false;

  @override
  String getInfo() =>
      "$_title - ${_isBorrowed ? "Đã mượn" : "Chưa mượn"}";
}

/// HOME PAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  Staff staff = Staff("Nguyen Van A");

  final List<Book> books = [
    Book("Sách 01", true),
    Book("Sách 02", true),
  ];

  final TextEditingController bookController = TextEditingController();
  final TextEditingController staffController = TextEditingController();

  /// ĐỔI NHÂN VIÊN
  void changeStaff() {
    staffController.text = staff.getName();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Đổi nhân viên"),
        content: TextField(
          controller: staffController,
          decoration: const InputDecoration(labelText: "Tên nhân viên"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                staff.setName(staffController.text);
              });
              Navigator.pop(context);
            },
            child: const Text("Lưu"),
          ),
        ],
      ),
    );
  }

  /// THÊM SÁCH
  void addBook() {
    if (bookController.text.isNotEmpty) {
      setState(() {
        books.add(Book(bookController.text, false));
        bookController.clear();
      });
      Navigator.pop(context);
    }
  }

  /// TAB QUẢN LÝ
  Widget buildManagerTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Hệ thống\nQuản lý Thư viện",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            "Nhân viên",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(staff.getName()),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: changeStaff,
                  child: const Text(
                    "Đổi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 25),
          const Text(
            "Danh sách sách",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: books.map((book) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CheckboxListTile(
                    value: book.isBorrowed,
                    activeColor: Colors.red,
                    title: Text(book.title),
                    onChanged: (value) {
                      setState(() {
                        value! ? book.borrow() : book.returnBook();
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const Spacer(),

          Center(
            child: SizedBox(
              width: 160,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D47A1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Thêm sách"),
                      content: TextField(
                        controller: bookController,
                        decoration:
                        const InputDecoration(labelText: "Tên sách"),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Hủy"),
                        ),
                        ElevatedButton(
                          onPressed: addBook,
                          child: const Text("Thêm"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Thêm",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// TAB DS SÁCH
  Widget buildBookListTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      itemBuilder: (_, i) => ListTile(
        leading: const Icon(Icons.book),
        title: Text(books[i].title),
        subtitle: Text(
          books[i].isBorrowed ? "Đã mượn" : "Chưa mượn",
          style: TextStyle(
            color: books[i].isBorrowed ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }

  /// TAB NHÂN VIÊN
  Widget buildStaffTab() {
    return Center(
      child: Text(
        "${staff.getName()}\n(${staff.getRole()})",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      buildManagerTab(),
      buildBookListTab(),
      buildStaffTab(),
    ];

    return Scaffold(
      body: SafeArea(child: tabs[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF0D47A1),
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Quản lý",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "DS Sách",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Nhân viên",
          ),
        ],
      ),
    );
  }
}
