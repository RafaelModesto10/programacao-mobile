//Cardápio de Restaurante Japonês
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FoodMenuApp()));
}

class FoodMenuApp extends StatefulWidget {
  const FoodMenuApp({super.key});

  @override
  State<FoodMenuApp> createState() => _FoodMenuAppState();
}

class _FoodMenuAppState extends State<FoodMenuApp> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Todos',
      'image': 'https://cdn-icons-png.flaticon.com/512/1539/1539414.png',
    },
    {
      'name': 'Frio',
      'image':
          'https://cdn-icons-png.flaticon.com/512/2252/2252075.png',
    },
    {
      'name': 'Quente',
      'image':
          'https://cdn-icons-png.flaticon.com/512/2388/2388080.png',
    },
    {
      'name': 'Sobremesa',
      'image':
          'https://cdn-icons-png.flaticon.com/512/5347/5347946.png',
    },
  ];

  final List<Map<String, dynamic>> dishes = [
    {
      'name': 'Sushi Especial',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMlZRME_rQCm6YKPlF0JrCTxDdWloEQG0L5w&s',
      'category': 'Frio',
      'price': 28.90,  // Adicionando o preço do prato
      'discount': 15,  // Adicionando o desconto de 15%
    },
    {
      'name': 'Ramen Tradicional',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLQxLm2PI5YnBZFuK-V8K6hDKFkrMTI0uDoA&s',
      'category': 'Quente',
      'price': 35.90,
    },
    {
      'name': 'Mochi de Morango',
      'image':
          'https://thumbs.dreamstime.com/b/diafragma-de-morango-ichigo-mochi-japon%C3%AAs-daifuku-com-feij%C3%A3o-vermelho-281002960.jpg',
      'category': 'Sobremesa',
      'price': 19.90,
    },
  ];

  String selectedCategory = 'Todos';
  String? selectedDish;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredDishes = selectedCategory == 'Todos'
        ? dishes
        : dishes.where((dish) => dish['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio Japonês'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildCategoryCards(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ...filteredDishes.map((dish) {
                    bool hasDiscount = dish['discount'] != null;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDish = dish['name'];
                        });
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                dish['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception,
                                    StackTrace? stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                dish['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              if (hasDiscount)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${dish['discount']}% OFF',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          subtitle: Text('Preço: R\$ ${dish['price'].toStringAsFixed(2)}'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedDish = dish['name'];
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Adicionar'),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  if (selectedDish != null) buildNutritionTable(selectedDish!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCards() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];
          final isSelected = category['name'] == selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category['name'];
                selectedDish = null;
              });
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange[100] : Colors.white,
                border: Border.all(
                    color: isSelected ? Colors.deepOrange : Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Image.network(category['image'],
                      width: 40,
                      height: 40,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return const Icon(Icons.error);
                  }),
                  const SizedBox(height: 8),
                  Text(
                    category['name'],
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNutritionTable(String dishName) {
    switch (dishName) {
      case 'Sushi Especial':
        return buildStyledTable(
          title: 'Sushi Especial',
          description:
              'Deliciosos pedaços de sushi com peixe fresco, arroz e alga nori.',
          calories: '250 kcal',
          protein: '15g',
          carbs: '30g',
        );
      case 'Ramen Tradicional':
        return buildStyledTable(
          title: 'Ramen Tradicional',
          description:
              'Sopa quente com macarrão, carne, ovo cozido e vegetais, perfeita para aquecer o corpo.',
          calories: '450 kcal',
          protein: '20g',
          carbs: '50g',
        );
      case 'Mochi de Morango':
        return buildStyledTable(
          title: 'Mochi de Morango',
          description:
              'Sobremesa japonesa feita de arroz glutinoso com recheio de morango fresco.',
          calories: '180 kcal',
          protein: '3g',
          carbs: '35g',
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget buildStyledTable({
    required String title,
    required String description,
    required String calories,
    required String protein,
    required String carbs,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Detalhes do Prato: $title',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Text(
          'Tabela Nutricional',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange.shade50,
          ),
          child: Column(
            children: [
              buildRow(Icons.local_fire_department, 'Calorias', calories),
              buildRow(Icons.fitness_center, 'Proteínas', protein),
              buildRow(Icons.grain, 'Carboidratos', carbs),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrange),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
