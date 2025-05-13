import 'package:bookbazaar/services/bookapi_service.dart';
import 'package:bookbazaar/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

TextEditingController _titleController = TextEditingController();
TextEditingController _authorController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController getControllerForLabel(String label) {
  switch (label) {
    case "Title":
      return _titleController;
    case "Author":
      return _authorController;
    case "Description":
      return _descriptionController;
    case "Price":
      return _priceController;
    default:
      throw Exception("Unknown label: $label");
  }
}

class AddbookScreen extends StatefulWidget {
  const AddbookScreen({super.key});

  @override
  State<AddbookScreen> createState() => _AddbookScreenState();
}

class _AddbookScreenState extends State<AddbookScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<String> categories = [
    'Fiction',
    'Self-help',
    'Programming',
    'Classic',
    'Dystopian',
    'Business',
    'Education',
    'History',
    'Entrepreneurship',
    'Romance',
  ];

  final List<String> condition = ['New', 'Like New', 'Good', 'Acceptable'];

  File? _selectedImage;
  String? selectedCategory;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _uploadBook() async {
    final int UserID= await PreferenceHelper.getuserID();
    try {
      await ApiService.uploadBookData(
        title: _titleController.text,
        author: _authorController.text,
        category: 'Fiction',
        price: _priceController.text,
        sellerId: UserID.toString(),
        imageFile: _selectedImage!,
      );
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Uploaded")));
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sell Your Book")),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: pickImage,
                  child: Text("Pick and image"),
                ),
              ),
              _selectedImage != null
                  ? Image.file(_selectedImage!, height: 200)
                  : Text("No file Selected"),
              IconButton(
                onPressed: pickImage,
                icon: Icon(Icons.camera_alt_outlined),
                iconSize: 35,
              ),
              customised_textfield(
                labeltext: "Title",
                hintText: "Name of the Book",
              ),
              customised_textfield(
                labeltext: "Author",
                hintText: "Name of Author",
              ),
              customised_textfield(
                labeltext: "Description",
                hintText: "A brief description about the book",
              ),
              dropdown_menu(options: categories, selected: selectedCategory),
              customised_textfield(
                labeltext: "Price",
                hintText: "Price you want to sell for",
              ),
              dropdown_menu(options: condition, selected: selectedCategory),
              ElevatedButton(onPressed: _uploadBook, child: Text("Submit")),
            ],
          ),
        ],
      ),
    );
  }
}

class customised_textfield extends StatelessWidget {
  const customised_textfield({
    required this.labeltext,
    required this.hintText,
    super.key,
  });

  final String labeltext;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    TextInputType? keyboardType;
    
    if (labeltext == "Title") {
      icon = Icon(FontAwesomeIcons.book);
   
    }
    if (labeltext == "Author") {
      icon = Icon(FontAwesomeIcons.penToSquare);
      
    }
    if (labeltext == "Description") {
      icon = Icon(FontAwesomeIcons.file);
    }
    if (labeltext == "Price") {
      icon = Icon(FontAwesomeIcons.rupeeSign);
      
      keyboardType = TextInputType.numberWithOptions(decimal: true);
    }

    return Container(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: TextField(
        controller: getControllerForLabel(labeltext),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(labeltext),
          hintText: hintText,
          prefixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: const Color.fromARGB(80, 0, 187, 212),
        ),
      ),
    );
  }
}

class dropdown_menu extends StatefulWidget {
  dropdown_menu({super.key, required this.options, required this.selected});

  final List<String> options;
  String? selected;

  @override
  State<dropdown_menu> createState() => _dropdown_menuState();
}

class _dropdown_menuState extends State<dropdown_menu> {
  void onChanged(String? newValue) {
    setState(() {
      widget.selected = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.options.length == 4 ? "Condition" : "Category",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: const Color.fromARGB(80, 0, 187, 212),
          prefixIcon: Icon(Icons.my_library_books_sharp),
        ),

        value: widget.selected,
        hint: Text(
          widget.options.length == 4
              ? "Select Condition of the book"
              : "Select Condition",
        ),
        onChanged: onChanged,

        items:
            widget.options.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }
}
