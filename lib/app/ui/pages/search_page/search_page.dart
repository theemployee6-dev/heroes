import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Semantics(label: 'Texto barra superior', child: Text('SearchPage')),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.01),
              _buildTextField(),
              Divider(thickness: 3),
              SizedBox(height: Get.height * 0.01),
              _buildTextSearch(),
              SizedBox(height: Get.height * 0.01),
              _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextSearch() {
    return Semantics(
      label: 'Texto Resultado da Pesquisa',
      child: Text(
        'Resultado da Pesquisa',
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildListView() {
    return GetBuilder<SearchController>(
      builder: (_) => Expanded(
        child: _.textController.text.isEmpty
            ? Center(
                child: Semantics(
                  label: 'Texto Nada encontrado',
                  child: Text('nada encontrado'),
                ),
              )
            : ListView.builder(
                itemCount: _.filteredList.length,
                itemBuilder: (__, index) {
                  final filtered = _.filteredList[index];
                  return Card(
                    child: ListTile(
                      title: Text(filtered.name),
                      subtitle: Text(filtered.slug),
                      leading: Semantics(
                        enabled: true,
                        label: 'Imagem dos Herois',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: filtered.images.lg,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      trailing: Text(filtered.appearance.gender.toString()),
                      onTap: () {
                        _.showHeroDetail(filtered);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }

  _buildTextField() {
    return GetBuilder<SearchController>(
      builder: (_) => Semantics(
        label: 'Caixa de texto para buscar os herois, digite seu heroi',
        child: TextField(
          controller: _.textController,
          onChanged: (text) {
            text = text.toLowerCase();
            _.filteredHeroList(text);
          },
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintTextDirection: TextDirection.ltr,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'search',
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
