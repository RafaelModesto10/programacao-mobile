# Equipe
- Cristopher Oliveira Modesto
- Gabriel Luiz Boch
- Rafael da Silva Modesto

## Tutorial: Calculadora de IMC
## 1. Scaffold

**Descrição**:  
O `Scaffold` é o componente básico utilizado para criar a estrutura da interface de uma aplicação Flutter. Ele oferece uma área para a `AppBar`, o corpo da tela (`body`), e outras funcionalidades como `Drawer`, `BottomNavigationBar`, etc.

**Aplicações**:  
Usado para construir a estrutura de páginas, oferecendo elementos fundamentais como cabeçalho (AppBar) e área central para conteúdo.

**Como usar**:
```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Calculadora de IMC'),
    backgroundColor: Colors.blueAccent,
  ),
  body: Center(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // restante dos widgets aqui
        ],
      ),
    ),
  ),
)
```

## 2. TextEditingController

**Descrição**:  
O `TextEditingController` é utilizado para controlar a entrada de texto em campos de texto. Ele permite obter e modificar o valor do texto digitado pelo usuário.

**Aplicações**:  
Controlar os valores digitados pelo usuário, como altura e peso no caso dessa calculadora de IMC.

**Como usar**:
```dart
final TextEditingController _controladorAltura = TextEditingController();
final TextEditingController _controladorPeso = TextEditingController();
```

## 3. ElevatedButton

**Descrição**:  
O `ElevatedButton` é um botão de ação que aparece elevado sobre o fundo, com um estilo padrão de Material Design. Ele pode ser usado para disparar ações, como o cálculo do IMC.

**Aplicações**:  
Acionar funções no aplicativo, como o cálculo do IMC no caso do protótipo.  

**Como usar**:
```dart
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      // Ação para calcular o IMC
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
    child: const Text(
      'CALCULAR',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
```

## 4. Table

**Descrição**:  
O `Table` é usado para exibir dados em formato tabular. No caso da calculadora de IMC, ele é utilizado para mostrar a tabela de referência dos valores de IMC e suas respectivas classificações.

**Aplicações**:  
Exibir informações de forma organizada e alinhada, como as faixas de IMC e suas classificações (Abaixo do peso, Peso normal, etc.).

**Como usar**:
```dart
Table(
  border: TableBorder.all(color: Colors.black),
  columnWidths: const {
    0: FlexColumnWidth(3),
    1: FlexColumnWidth(2),
  },
  children: const [
    TableRow(
      decoration: BoxDecoration(color: Colors.blueAccent),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Classificação',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'IMC (kg/m²)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    // Outras TableRow aqui...
  ],
)
```

## 5. TextField

**Descrição**:  
O `TextField` é um componente utilizado para capturar entradas de texto do usuário. É comum em formulários, como para capturar altura e peso.

**Aplicações**:  
Capturar entradas do usuário para o cálculo do IMC, como a altura e o peso.

**Como usar**:
```dart
TextField(
  controller: _controladorAltura,
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: 'Ex: 182',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  ),
)
```

## 6. Container

**Descrição**:  
O `Container` é um componente genérico que pode ser utilizado para agrupar outros widgets, definir margens, padding, cor de fundo, entre outros. Ele é muito útil para criação de áreas de conteúdo e estilização.

**Aplicações**:  
Agrupar os componentes de entrada de dados e a tabela de IMC, com a possibilidade de personalizar visualmente, adicionando margens, bordas, e sombras.

**Como usar**:
```dart
Container(
  padding: const EdgeInsets.all(16.0),
  margin: const EdgeInsets.symmetric(horizontal: 16.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.2),
        blurRadius: 10,
        spreadRadius: 1,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  child: Column(
    children: [
      // outros widgets
    ],
  ),
)
```
##




## Tutorial: Perfil de Artista Musical

## 1. **MaterialApp**

### Descrição
O `MaterialApp` é um widget fundamental no Flutter que configura o estilo visual da aplicação e as configurações gerais, como tema, título e páginas iniciais. Ele também é responsável pela navegação da aplicação.

### Aplicações
Usado em praticamente todas as aplicações Flutter, o `MaterialApp` cria a base para a estrutura visual do app, como temas, rotas e controles de navegação.

### Como usar
```dart
MaterialApp(
  title: 'Spotify Clone',
  theme: ThemeData.dark(),
  debugShowCheckedModeBanner: false,
  home: const SpotifyHomePage(),
);
```

## 2. **Scaffold**

### Descrição
O `Scaffold` é um widget usado para criar a estrutura visual básica de uma tela, com opções como AppBar, Drawer, BottomNavigationBar e o corpo da tela. Ele organiza os componentes do layout.

### Aplicações
Ideal para construir a estrutura padrão de telas, proporcionando uma área para a navegação, cabeçalho e conteúdo centralizado.

### Como usar
```dart
Scaffold(
  appBar: AppBar(
    title: const Text("Olá, Usuário 👋"),
    actions: [
      IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
    ],
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...],
    ),
  ),
);
```

## 3. **ListView**

### Descrição
O `ListView` é um widget usado para exibir listas de itens de maneira rolável, vertical ou horizontal.

### Aplicações
Ideal para exibir coleções de itens como listas de músicas, álbuns, ou outras coleções dinâmicas de dados.

### Como usar
```dart
ListView(
  scrollDirection: Axis.horizontal,
  children: albums
      .map((album) => AlbumCard(
            album: album,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MusicPlayerScreen(
                    imageUrl: album['image']!,
                    title: album['title']!,
                    artist: album['artist']!,
                  ),
                ),
              );
            },
          ))
      .toList(),
);
```

## 4. **GestureDetector**

### Descrição
O `GestureDetector` é utilizado para capturar gestos do usuário, como toques ou arrastos. Ele é usado para detectar interações e executar ações com base nelas.

### Aplicações
Utilizado para tornar widgets interativos, como clicar em um álbum para navegar para outra tela ou realizar alguma ação.

### Como usar
```dart
GestureDetector(
  onTap: onTap,
  child: Container(
    width: 140,
    margin: const EdgeInsets.only(right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            album['image']!,
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          album['title']!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          album['artist']!,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    ),
  ),
);
```

## 5. **Slider**

### Descrição
O `Slider` permite ao usuário ajustar um valor entre um intervalo definido (por exemplo, o tempo de uma música). O valor pode ser alterado por meio de um deslizamento.

### Aplicações
Ideal para ajustar valores de maneira interativa, como o controle de volume ou o tempo de reprodução de uma música.

### Como usar
```dart
Slider(
  value: 120.0,
  min: 0.0,
  max: 240.0,
  activeColor: Colors.green,
  inactiveColor: Colors.white24,
  onChanged: (value) {},
);
```

## 6. **Column**

### Descrição
O `Column` é um widget que organiza seus filhos verticalmente, um abaixo do outro. Ele é amplamente utilizado para layouts lineares em uma direção.

### Aplicações
Ideal para agrupar elementos que precisam ser exibidos na mesma coluna (verticalmente), como textos e imagens.

### Como usar
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    const SizedBox(height: 4),
    Text(
      artist,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    ),
  ],
);
```

## 7. **AppBar**

### Descrição
O `AppBar` é um componente utilizado para criar a barra superior da tela, onde geralmente são colocados elementos como o título, ícones de navegação e ações.

### Aplicações
Comumente usado para mostrar o título da tela, botões de navegação e ações como configurações ou login.

### Como usar
```dart
AppBar(
  title: const Text("Olá, Usuário 👋"),
  actions: [
    IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
  ],
);
```

## 8. **ClipRRect**

### Descrição
O `ClipRRect` é usado para cortar um widget com bordas arredondadas. Ele é útil para exibir imagens ou qualquer outro componente com bordas curvadas.

### Aplicações
Ideal para criar efeitos de bordas arredondadas em imagens, botões ou outros elementos da UI.

### Como usar
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: Image.network(
    album['image']!,
    width: 140,
    height: 140,
    fit: BoxFit.cover,
  ),
);
```

## 9. **IconButton**

### Descrição
O `IconButton` é um widget que exibe um ícone clicável, muito usado para ações rápidas, como navegação, favoritar, etc.

### Aplicações
Ideal para ações que requerem um botão pequeno e visualmente simples, como avançar para a próxima música ou acessar o menu.

### Como usar
```dart
IconButton(
  icon: const Icon(Icons.skip_next_rounded),
  iconSize: 40,
  color: Colors.white,
  onPressed: () {},
);
```

## 10. **Navigator**

### Descrição
O `Navigator` é utilizado para controlar a pilha de telas (rotas) da aplicação, permitindo navegar entre elas. A navegação pode ser empurrada (push) ou removida (pop) da pilha de telas.

### Aplicações
Essencial para navegar entre diferentes telas da aplicação, como ir para a tela do player de música ao clicar em um álbum.

### Como usar
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => MusicPlayerScreen(
      imageUrl: album['image']!,
      title: album['title']!,
      artist: album['artist']!,
    ),
  ),
);
```

## 

## Tutorial: Cardápio de Restaurante Japonês

### 1. `Scaffold`

- **Descrição**: Componente base que estrutura visualmente a tela principal do app, contendo a barra superior (`AppBar`), corpo (`body`) e outros elementos como `drawer` e `bottomNavigationBar`.
- **Aplicações**: Utilizado como contêiner raiz de qualquer tela no Flutter. Permite criar apps responsivos com padrão de design consistente.
- **Como usar**:
  ```dart
  return Scaffold(
    appBar: AppBar(title: Text('Cardápio')),
    body: Container(),
  );
  ```

---

### 2. `AppBar`

- **Descrição**: Barra superior fixa que geralmente exibe título, ações e ícones de navegação.
- **Aplicações**: Ideal para mostrar o nome da página, botões de ação (ex: pesquisa, menu) e botão de voltar.
- **Como usar**:
  ```dart
  AppBar(
    title: Text('Cardápio Japonês'),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
  );
  ```

---

### 3. `ListView.builder`

- **Descrição**: Lista dinâmica e preguiçosa (lazy loading) que carrega apenas os elementos visíveis.
- **Aplicações**: Essencial para criar listas com muitos itens, como menus, catálogos ou feed de notícias.
- **Como usar**:
  ```dart
  ListView.builder(
    itemCount: items.length,
    itemBuilder: (_, index) {
      return Text(items[index]);
    },
  );
  ```

---

### 4. `GestureDetector`

- **Descrição**: Widget que detecta gestos do usuário, como toques, arrastes e cliques longos.
- **Aplicações**: Útil para tornar qualquer widget "clicável", como cartões, imagens ou containers.
- **Como usar**:
  ```dart
  GestureDetector(
    onTap: () {
      print("Clicado");
    },
    child: Container(color: Colors.amber, height: 100),
  );
  ```

---

### 5. `Card` + `ListTile`

- **Descrição**: `Card` cria um contêiner com elevação e bordas arredondadas; `ListTile` organiza conteúdo em formato de linha com título, subtítulo, imagem e trailing.
- **Aplicações**: Usado para exibir informações em formato de cartão (como produtos ou mensagens).
- **Como usar**:
  ```dart
  Card(
    child: ListTile(
      leading: Icon(Icons.food_bank),
      title: Text('Sushi Especial'),
      subtitle: Text('R\$ 28.90'),
      trailing: ElevatedButton(onPressed: () {}, child: Text('Adicionar')),
    ),
  );
  ```

---

### 6. `Expanded`

- **Descrição**: Expande o widget filho para preencher o espaço disponível dentro de uma `Column`, `Row` ou `Flex`.
- **Aplicações**: Perfeito para garantir que o conteúdo utilize toda a altura/largura disponível.
- **Como usar**:
  ```dart
  Expanded(
    child: ListView(children: [...]),
  );
  ```

---

### 7. `Image.network`

- **Descrição**: Exibe uma imagem diretamente de uma URL.
- **Aplicações**: Ideal para mostrar imagens vindas da internet, como fotos de produtos ou perfis.
- **Como usar**:
  ```dart
  Image.network(
    'https://link-da-imagem.png',
    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
  );
  ```

---

### 8. `Container` com `BoxDecoration`

- **Descrição**: `Container` com `BoxDecoration` permite estilizar widgets com bordas, cores, imagens e sombras.
- **Aplicações**: Utilizado para criar cartões customizados, botões estilizados ou qualquer bloco visual personalizado.
- **Como usar**:
  ```dart
  Container(
    decoration: BoxDecoration(
      color: Colors.orange[100],
      border: Border.all(color: Colors.deepOrange),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text('Categoria'),
  );
  ```

---

### 9. `setState`

- **Descrição**: Método usado para atualizar o estado da interface após alguma ação (como clique ou alteração de valor).
- **Aplicações**: Essencial em `StatefulWidgets` para re-renderizar componentes com base em interações do usuário.
- **Como usar**:
  ```dart
  setState(() {
    selectedCategory = 'Quente';
  });
  ```

---

### 10. `Column` e `Row`

- **Descrição**: Widgets de layout que organizam elementos vertical e horizontalmente.
- **Aplicações**: Usados para empilhar elementos visualmente (como botões, imagens, textos, etc).
- **Como usar**:
  ```dart
  Column(
    children: [
      Text('Título'),
      Row(
        children: [Icon(Icons.star), Text('Detalhe')],
      ),
    ],
  );
  ```

