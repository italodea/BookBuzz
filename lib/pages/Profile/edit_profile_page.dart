import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:bookbuzz/styles/app_buttons.dart';

import '../../data/models/user.dart';
import '../../styles/app_colors.dart';
import 'package:bookbuzz/provider/profile_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _imageUrlController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final profile =
        Provider.of<ProfileProvider>(context, listen: false).userProfile;
    if (profile != null) {
      _nameController.text = profile.name;
      _imageUrlController.text = profile.urlPhoto;
      _emailController.text = profile.email;
    }
  }

  Future<void> _saveProfile() async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<ProfileProvider>(context, listen: false);
      try {
        await provider.editProfile(
          User(
            id: provider.userProfile!.id,
            name: _nameController.text,
            urlPhoto: _imageUrlController.text,
            email: _emailController.text,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Perfil atualizado com sucesso!",
                textAlign: TextAlign.center),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao atualizar perfil: $e",
                textAlign: TextAlign.center),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus dados'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          final profile = provider.userProfile;
          return profile == null
              ? Center(
                  child: CircularProgressIndicator(
                      color: AppColors.secondaryColor))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: buildProfileFields(profile),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget buildProfileFields(User profile) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                spreadRadius: 2,
                color: AppColors.secondaryColor,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundImage: _imageUrlController.text.isEmpty
                ? NetworkImage(profile.urlPhoto)
                : NetworkImage(_imageUrlController.text),
            radius: 70,
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          maxLength: 60,
          controller: _nameController,
          decoration: InputDecoration(labelText: "Nome"),
          onChanged: (value) {
            setState(() {});
          },
        ),
        TextFormField(
          maxLength: 256,
          controller: _imageUrlController,
          decoration: InputDecoration(labelText: "URL da Imagem"),
          onChanged: (value) {
            setState(() {
              _imageUrlController.text = value;
            });
          },
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(labelText: "E-mail"),
          enabled: false,
          onChanged: (value) {
            setState(() {
              _emailController.text = value;
            });
          },
        ),
        SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            style: AppButtons.myButton,
            onPressed: isLoading ? null : _saveProfile,
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.blackColor,
                    ),
                  )
                : Text("Salvar"),
          ),
        ),
      ],
    );
  }
}
