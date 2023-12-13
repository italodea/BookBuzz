// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:bookbuzz/general_components/my_input.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/services/book_club_service.dart';
import 'package:bookbuzz/styles/app_buttons.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ClubCreatePage extends StatefulWidget {
  @override
  _ClubCreatePageState createState() => _ClubCreatePageState();
}

class _ClubCreatePageState extends State<ClubCreatePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _imageUrlController;
  late TextEditingController _descriptionController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _imageUrlController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _createClub() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });

        var result = await BookClubService().create(
          _nameController.text,
          _descriptionController.text,
          _imageUrlController.text,
        );

        if (result != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.HOME, (route) => false);
          Navigator.pushNamed(context, AppRoute.CLUBPAGE, arguments: result);
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   AppRoute.CLUBPAGE,
          //   arguments: result,
          //   (route) => route.settings.name == AppRoute.HOME,
          // );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Clube do livro criado com sucesso!",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Erro ao criar o clube. Tente novamente.",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar clube do livro"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(_imageUrlController.text),
                      radius: 50, // ajuste o tamanho conforme a necessidade
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          MyInput(
                            controller: _nameController,
                            label: "Nome",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um nome';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          MyInput(
                            controller: _imageUrlController,
                            maxLength: 256,
                            label: "URL da Imagem",
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira uma URL';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MyInput(
                  controller: _descriptionController,
                  label: "Descrição",
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: AppButtons.myButton,
                    onPressed: isLoading ? null : _createClub,
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.blackColor,
                            ),
                          )
                        : Text("Criar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
