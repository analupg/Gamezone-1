import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'game.dart';

// COLE aqui a URL e a Publishable key do seu projeto Supabase.
// No painel Supabase: Connect -> App Frameworks / API Keys.
const String supabaseUrl = 'https://rygqapxbhstctvbbpcbp.supabase.co';
const String supabasePublishableKey = 'sb_publishable_rNT47NzKK24gguN9IyEr5A_OXIjd31p';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabasePublishableKey,
  );
  runApp(const GameZoneApp());
}

final SupabaseClient supabase = Supabase.instance.client;

// ======================================================
// CORES DO GAMEZONE
// ======================================================

class AppColors {
  static const background = Color(0xFFFFF5FA);
  static const surface = Colors.white;
  static const surfaceLight = Color(0xFFFFE0F0);

  static const blue = Color(0xFFB44AFF);
  static const purple = Color(0xFF8B35D1);
  static const pink = Color(0xFFFF2D95);

  static const textPrimary = Color(0xFF35152F);
  static const textSecondary = Color(0xFF85627F);
}

// ======================================================
// APLICATIVO
// ======================================================

class GameZoneApp extends StatelessWidget {
  const GameZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameZone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.pink,
          primary: AppColors.pink,
          secondary: AppColors.purple,
          surface: AppColors.surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: false,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: AppColors.surfaceLight,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      home: const AuthGate(),
    );
  }
}

// ======================================================
// JOGOS DO CATÁLOGO E LANÇAMENTOS
// ======================================================

const List<Game> gameList = [
  Game(
    id: 1,
    name: 'Project Makeover',
    genre: 'Moda e beleza',
    description:
    'Transforme personagens, renove ambientes e crie visuais incríveis '
        'enquanto resolve desafios de combinação.',
    releaseDate: 'Projeto de moda',
    rating: 4.8,
    imageUrl: 'assets/images/makeover.jpg',
    developer: 'Magic Tavern',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Project%20Makeover&c=apps',
  ),
  Game(
    id: 2,
    name: 'SuitU',
    genre: 'Moda',
    description:
    'Monte looks, combine roupas e acessórios e explore sua criatividade '
        'em desafios de estilo.',
    releaseDate: 'Jogo de moda',
    rating: 4.7,
    imageUrl: 'assets/images/SuitU.jpeg',
    developer: 'Libii',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=SuitU&c=apps',
  ),
  Game(
    id: 3,
    name: 'Love Nikki',
    genre: 'Moda e aventura',
    description:
    'Explore um universo de moda, monte combinações e participe de '
        'desafios de estilo.',
    releaseDate: 'Jogo de moda',
    rating: 4.8,
    imageUrl: 'assets/images/love.jpeg',
    developer: 'Papergames',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Love%20Nikki&c=apps',
  ),
  Game(
    id: 4,
    name: 'Shining Nikki',
    genre: 'Moda e RPG',
    description:
    'Personalize personagens, descubra histórias e monte produções '
        'com diferentes estilos.',
    releaseDate: 'Jogo de moda',
    rating: 4.8,
    imageUrl: 'assets/images/shining.jpeg',
    developer: 'Papergames',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Shining%20Nikki&c=apps',
  ),
  Game(
    id: 5,
    name: 'Covet Fashion',
    genre: 'Moda',
    description:
    'Crie combinações de roupas, escolha acessórios e participe de '
        'desafios inspirados no mundo fashion.',
    releaseDate: 'Jogo de moda',
    rating: 4.5,
    imageUrl: 'assets/images/covet.jpeg',
    developer: 'Crowdstar',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Covet%20Fashion&c=apps',
  ),
  Game(
    id: 6,
    name: 'Super Stylist',
    genre: 'Moda e simulação',
    description:
    'Trabalhe como estilista, crie looks para clientes e desenvolva '
        'seu próprio negócio de moda.',
    releaseDate: 'Jogo de simulação',
    rating: 4.6,
    imageUrl: 'assets/images/super.jpeg',
    developer: 'CrazyLabs',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Super%20Stylist&c=apps',
  ),
  Game(
    id: 7,
    name: 'Fashion Dreamer',
    genre: 'Moda e criatividade',
    description:
    'Experimente estilos, monte combinações e compartilhe suas criações '
        'em um universo dedicado à moda.',
    releaseDate: 'Jogo de moda',
    rating: 4.4,
    imageUrl: 'assets/images/fashion.jpeg',
    developer: 'syn Sophia',
    platforms: 'Nintendo Switch',
    websiteUrl:
    'https://www.nintendo.com/',
  ),
  Game(
    id: 8,
    name: 'Good Pizza, Great Pizza',
    genre: 'Simulação',
    description:
    'Administre uma pizzaria, prepare pedidos e conquiste clientes '
        'com suas habilidades culinárias.',
    releaseDate: 'Jogo de simulação',
    rating: 4.7,
    imageUrl: 'assets/images/pizza.jpeg',
    developer: 'TapBlaze',
    platforms: 'Android, iOS e PC',
    websiteUrl:
    'https://play.google.com/store/search?q=Good%20Pizza%20Great%20Pizza&c=apps',
  ),
  Game(
    id: 9,
    name: 'Animal Crossing',
    genre: 'Simulação',
    description:
    'Explore um mundo tranquilo, personalize seu espaço e conheça '
        'personagens divertidos.',
    releaseDate: 'Jogo de simulação',
    rating: 4.8,
    imageUrl: 'assets/images/animal.jpeg',
    developer: 'Nintendo',
    platforms: 'Nintendo Switch e dispositivos móveis',
    websiteUrl:
    'https://www.nintendo.com/',
  ),
  Game(
    id: 10,
    name: 'The Sims 4',
    genre: 'Simulação de vida',
    description:
    'Crie personagens, construa casas e desenvolva histórias '
        'em um mundo que você pode personalizar.',
    releaseDate: 'Jogo de simulação',
    rating: 4.7,
    imageUrl: 'assets/images/sims4.jpeg',
    developer: 'Maxis',
    platforms: 'PC e consoles',
    websiteUrl:
    'https://www.ea.com/games/the-sims/the-sims-4',
  ),
];

// ======================================================
// JOGOS POPULARES
// ======================================================

const List<Game> popularGames = [
  Game(
    id: 101,
    name: 'Minecraft',
    genre: 'Aventura e construção',
    description:
    'Explore mundos, construa estruturas e descubra possibilidades '
        'em uma aventura feita de blocos.',
    releaseDate: 'Jogo popular',
    rating: 4.9,
    imageUrl: 'assets/images/minecraft_novo.jpeg',
    developer: 'Mojang Studios',
    platforms: 'PC, consoles e dispositivos móveis',
    websiteUrl: 'https://www.minecraft.net/',
  ),
  Game(
    id: 102,
    name: 'Roblox',
    genre: 'Aventura e criatividade',
    description:
    'Explore experiências criadas por jogadores e descubra diferentes '
        'mundos e atividades.',
    releaseDate: 'Jogo popular',
    rating: 4.8,
    imageUrl: 'assets/images/roblox.jpeg',
    developer: 'Roblox Corporation',
    platforms: 'PC, consoles e dispositivos móveis',
    websiteUrl: 'https://www.roblox.com/',
  ),
  Game(
    id: 103,
    name: 'Hay Day',
    genre: 'Fazenda e simulação',
    description:
    'Cuide de uma fazenda, plante alimentos, crie animais e negocie '
        'seus produtos.',
    releaseDate: 'Jogo popular',
    rating: 4.7,
    imageUrl: 'assets/images/hayday.jpeg',
    developer: 'Supercell',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Hay%20Day&c=apps',
  ),
  Game(
    id: 104,
    name: 'Toca Life World',
    genre: 'Criatividade e simulação',
    description:
    'Crie histórias, personalize personagens e explore diferentes '
        'lugares em um mundo interativo.',
    releaseDate: 'Jogo popular',
    rating: 4.7,
    imageUrl: 'assets/images/toca.jpeg',
    developer: 'Toca Boca',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://play.google.com/store/search?q=Toca%20Boca%20World&c=apps',
  ),
  Game(
    id: 105,
    name: 'EA SPORTS FC Mobile',
    genre: 'Futebol',
    description:
    'Monte seu time, participe de partidas e acompanhe o universo '
        'do futebol.',
    releaseDate: 'Jogo popular',
    rating: 4.5,
    imageUrl: 'assets/images/fifa.jpeg',
    developer: 'Electronic Arts',
    platforms: 'Android e iOS',
    websiteUrl:
    'https://www.ea.com/games/ea-sports-fc/fc-mobile',
  ),
  Game(
    id: 106,
    name: 'Fortnite',
    genre: 'Ação e aventura',
    description:
    'Explore diferentes experiências, participe de partidas e '
        'personalize seu personagem.',
    releaseDate: 'Jogo popular',
    rating: 4.6,
    imageUrl: 'assets/images/fortinite.jpeg',
    developer: 'Epic Games',
    platforms: 'PC, consoles e dispositivos compatíveis',
    websiteUrl: 'https://www.fortnite.com/',
  ),
  Game(
    id: 107,
    name: 'Among Us',
    genre: 'Estratégia e multiplayer',
    description:
    'Trabalhe em equipe, complete tarefas e descubra quem está '
        'enganando os outros jogadores.',
    releaseDate: 'Jogo popular',
    rating: 4.5,
    imageUrl: 'assets/images/among.jps.jpeg',
    developer: 'Innersloth',
    platforms: 'PC, consoles e dispositivos móveis',
    websiteUrl: 'https://www.innersloth.com/games/among-us/',
  ),
  Game(
    id: 108,
    name: 'Fall Guys',
    genre: 'Competição e diversão',
    description:
    'Participe de desafios divertidos, supere obstáculos e tente '
        'chegar à linha de chegada.',
    releaseDate: 'Jogo popular',
    rating: 4.5,
    imageUrl: 'assets/images/fall.jpeg',
    developer: 'Mediatonic',
    platforms: 'PC e consoles',
    websiteUrl: 'https://www.fallguys.com/',
  ),
  Game(
    id: 109,
    name: 'Rocket League',
    genre: 'Esportes e corrida',
    description:
    'Controle carros em partidas competitivas que misturam futebol '
        'e direção.',
    releaseDate: 'Jogo popular',
    rating: 4.6,
    imageUrl: 'assets/images/rocket.jpeg',
    developer: 'Psyonix',
    platforms: 'PC e consoles',
    websiteUrl: 'https://www.rocketleague.com/',
  ),
  Game(
    id: 110,
    name: 'God of War',
    genre: 'Ação e aventura',
    description:
    'Acompanhe uma aventura mitológica com exploração, combates '
        'e uma história cinematográfica.',
    releaseDate: 'Jogo popular',
    rating: 4.9,
    imageUrl: 'assets/images/god.jpeg',
    developer: 'Santa Monica Studio',
    platforms: 'PlayStation e PC, conforme a versão',
    websiteUrl: 'https://www.playstation.com/',
  ),
];

// ======================================================
// CONTROLE DE FAVORITOS
// ======================================================

class FavoritesController {
  static final ValueNotifier<Set<int>> favorites =
  ValueNotifier<Set<int>>(<int>{});
  static bool isLoading = false;

  static Future<void> load() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      favorites.value = <int>{};
      return;
    }

    isLoading = true;
    try {
      final rows = await supabase
          .from('favorites')
          .select('game_id')
          .eq('user_id', user.id);
      favorites.value = rows
          .map<int>((row) => (row['game_id'] as num).toInt())
          .toSet();
    } catch (e) {
      debugPrint('Erro ao carregar favoritos: $e');
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  static Future<void> toggle(Game game) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final updated = Set<int>.from(favorites.value);
    final alreadyFavorite = updated.contains(game.id);

    if (alreadyFavorite) {
      await supabase
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('game_id', game.id);
      updated.remove(game.id);
    } else {
      await supabase.from('favorites').insert({
        'user_id': user.id,
        'game_id': game.id,
        'game_name': game.name,
      });
      updated.add(game.id);
    }
    favorites.value = updated;
  }

  static List<Game> getFavoriteGames() {
    final allGames = [...gameList, ...popularGames];
    return allGames
        .where((game) => favorites.value.contains(game.id))
        .toList();
  }
}

// ======================================================
// AUTENTICAÇÃO: LOGIN E CADASTRO
// ======================================================

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (supabase.auth.currentSession != null) {
          return const GameZoneHome();
        }
        return const AuthPage();
      },
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegister = false;
  bool _isLoading = false;
  bool _hidePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _message(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final email = _emailController.text.trim().toLowerCase();
      final password = _passwordController.text;

      if (_isRegister) {
        final response = await supabase.auth.signUp(
          email: email,
          password: password,
          data: {'name': _nameController.text.trim()},
        );
        final user = response.user;
        if (user != null && response.session != null) {
          await supabase.from('profiles').upsert({
            'id': user.id,
            'name': _nameController.text.trim(),
            'email': email,
          });
          _message('Conta criada com sucesso!');
        } else {
          _message('Cadastro iniciado! Confira seu e-mail para confirmar a conta antes de entrar.');
          if (mounted) setState(() => _isRegister = false);
        }
      } else {
        final response = await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
        final user = response.user;
        if (user != null) {
          await supabase.from('profiles').upsert({
            'id': user.id,
            'name': (user.userMetadata?['name'] ?? '').toString(),
            'email': email,
          });
          _message('Login realizado! Bem-vinda ao GameZone.');
        }
      }
    } on AuthException catch (e) {
      _message(e.message);
    } catch (e) {
      _message('Não foi possível concluir. Confira sua conexão e as configurações do Supabase.');
      debugPrint('Erro de autenticação: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.background, Color(0xFFF2D5FF)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 76, height: 76,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [AppColors.pink, AppColors.purple]),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: const Icon(Icons.sports_esports, color: Colors.white, size: 42),
                        ),
                        const SizedBox(height: 16),
                        const Text('GameZone', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        const SizedBox(height: 6),
                        Text(_isRegister ? 'Crie sua conta para salvar seus jogos' : 'Entre para acessar seus favoritos', textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textSecondary)),
                        const SizedBox(height: 24),
                        if (_isRegister) ...[
                          TextFormField(
                            controller: _nameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(labelText: 'Nome', prefixIcon: Icon(Icons.person_outline), border: OutlineInputBorder()),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Digite seu nome' : null,
                          ),
                          const SizedBox(height: 14),
                        ],
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: const InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
                          validator: (v) => (v == null || !v.contains('@')) ? 'Digite um e-mail válido' : null,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _passwordController, obscureText: _hidePassword,
                          decoration: InputDecoration(labelText: 'Senha', prefixIcon: const Icon(Icons.lock_outline), border: const OutlineInputBorder(), suffixIcon: IconButton(icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => _hidePassword = !_hidePassword))),
                          validator: (v) => (v == null || v.length < 6) ? 'A senha precisa ter pelo menos 6 caracteres' : null,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(backgroundColor: AppColors.pink, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 15)),
                            onPressed: _isLoading ? null : _submit,
                            child: _isLoading ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Text(_isRegister ? 'Criar conta' : 'Entrar'),
                          ),
                        ),
                        TextButton(
                          onPressed: _isLoading ? null : () => setState(() => _isRegister = !_isRegister),
                          child: Text(_isRegister ? 'Já tem conta? Entrar' : 'Não tem conta? Cadastre-se', style: const TextStyle(color: AppColors.purple)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// TELA PRINCIPAL E NAVEGAÇÃO
// ======================================================

class GameZoneHome extends StatefulWidget {
  const GameZoneHome({super.key});

  @override
  State<GameZoneHome> createState() => _GameZoneHomeState();
}

class _GameZoneHomeState extends State<GameZoneHome> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    FavoritesController.load().catchError((e) {
      debugPrint('Não foi possível carregar os favoritos: $e');
    });
  }

  final List<Widget> pages = const [
    HomePage(),
    ExplorePage(),
    ReleasesPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  final List<String> titles = const [
    'GameZone',
    'Explorar jogos',
    'Lançamentos',
    'Meus favoritos',
    'Meu perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.pink,
                    AppColors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.sports_esports,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              titles[selectedIndex],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Explorar',
          ),
          NavigationDestination(
            icon: Icon(Icons.new_releases_outlined),
            selectedIcon: Icon(Icons.new_releases),
            label: 'Lançamentos',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// ======================================================
// TELA INICIAL
// ======================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.pink,
                AppColors.purple,
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.sports_esports,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 12),
              Text(
                'Seu próximo jogo favorito está aqui!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Descubra jogos, explore novidades e monte sua coleção.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        const SectionTitle(
          title: 'Jogos populares',
          subtitle: 'Confira os jogos que estão em destaque',
        ),
        const SizedBox(height: 12),
        ...popularGames.map(
              (game) => GameCard(game: game),
        ),
      ],
    );
  }
}

// ======================================================
// TELA EXPLORAR
// ======================================================

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String searchText = '';
  String selectedGenre = 'Todos';

  final List<String> genres = const [
    'Todos',
    'Moda',
    'Simulação',
    'Aventura',
    'Futebol',
    'Estratégia',
  ];

  List<Game> get filteredGames {
    final allGames = [...gameList, ...popularGames];

    return allGames.where((game) {
      final matchesName =
      game.name.toLowerCase().contains(searchText.toLowerCase());

      final matchesGenre = selectedGenre == 'Todos' ||
          game.genre.toLowerCase().contains(selectedGenre.toLowerCase());

      return matchesName && matchesGenre;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Pesquisar jogos...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final genre = genres[index];

              return ChoiceChip(
                label: Text(genre),
                selected: selectedGenre == genre,
                selectedColor: AppColors.surfaceLight,
                onSelected: (_) {
                  setState(() {
                    selectedGenre = genre;
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: filteredGames.isEmpty
              ? const Center(
            child: Text('Nenhum jogo encontrado.'),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: filteredGames[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

// ======================================================
// TELA DE LANÇAMENTOS
// ======================================================

class ReleasesPage extends StatelessWidget {
  const ReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle(
          title: 'Catálogo de jogos',
          subtitle: 'Explore jogos de moda, beleza, aventura e simulação',
        ),
        const SizedBox(height: 14),
        ...gameList.map(
              (game) => GameCard(game: game),
        ),
      ],
    );
  }
}

// ======================================================
// TELA DE FAVORITOS
// ======================================================

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: FavoritesController.favorites,
      builder: (context, favorites, child) {
        final games = FavoritesController.getFavoriteGames();

        if (games.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppColors.pink,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sua lista está vazia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Toque no coração de um jogo para adicioná-lo aos favoritos.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionTitle(
              title: 'Seus favoritos',
              subtitle: 'Os jogos que você guardou',
            ),
            const SizedBox(height: 12),
            ...games.map(
                  (game) => GameCard(game: game),
            ),
          ],
        );
      },
    );
  }
}

// ======================================================
// TELA DE PERFIL
// ======================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    final email = user?.email ?? 'Usuário';
    final name = (user?.userMetadata?['name'] ?? '').toString().trim();

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: 100, height: 100,
            decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [AppColors.pink, AppColors.purple])),
            child: const Icon(Icons.person, color: Colors.white, size: 55),
          ),
        ),
        const SizedBox(height: 16),
        Center(child: Text(name.isEmpty ? 'Meu perfil' : name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary))),
        const SizedBox(height: 8),
        Center(child: Text(email, style: const TextStyle(color: AppColors.textSecondary))),
        const SizedBox(height: 28),
        Card(
          color: Colors.white,
          child: ValueListenableBuilder<Set<int>>(
            valueListenable: FavoritesController.favorites,
            builder: (context, favorites, child) => ListTile(
              leading: const Icon(Icons.favorite, color: AppColors.pink),
              title: const Text('Jogos favoritos'),
              subtitle: Text('${favorites.length} jogo(s) salvo(s)'),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.logout, color: AppColors.purple),
            title: const Text('Sair da conta'),
            onTap: () async {
              try {
                await supabase.auth.signOut();
                FavoritesController.favorites.value = <int>{};
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Não foi possível sair da conta.')));
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

// ======================================================
// TÍTULO DE SEÇÃO
// ======================================================

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ======================================================
// CARTÃO DE JOGO
// ======================================================
class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GameImage(
              url: game.imageUrl,
              width: 105,
              height: 125,
              radius: 15,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    game.genre,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 17,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        game.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    game.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.pink,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          minimumSize: const Size(0, 34),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {
                          openWebsite(context, game.websiteUrl);
                        },
                        child: const Text(
                          'Acessar jogo',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      FavoriteButton(game: game),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ======================================================
// BOTÃO DE FAVORITOS
// ======================================================

class FavoriteButton extends StatelessWidget {
  final Game game;

  const FavoriteButton({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: FavoritesController.favorites,
      builder: (context, favorites, child) {
        final isFavorite = favorites.contains(game.id);

        return IconButton(
          tooltip: isFavorite
              ? 'Remover dos favoritos'
              : 'Adicionar aos favoritos',
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 34,
            minHeight: 34,
          ),
          onPressed: () async {
            try {
              await FavoritesController.toggle(game);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Não foi possível atualizar os favoritos. Tente novamente.')),
                );
              }
              debugPrint('Erro ao atualizar favorito: $e');
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.pink,
          ),
        );
      },
    );
  }
}

// ======================================================
// IMAGEM DO JOGO
// ======================================================

class GameImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double radius;

  const GameImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (url.trim().isEmpty) {
      image = const _GameImagePlaceholder();
    } else if (url.startsWith('assets/')) {
      image = Image.asset(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Text(
              'Erro ao carregar imagem:\n$error',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          );
        },
      );
    } else {
      image = Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const _GameImagePlaceholder();
        },
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: image,
      ),
    );
  }
}

class _GameImagePlaceholder extends StatelessWidget {
  const _GameImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surfaceLight,
            Color(0xFFF2D5FF),
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.sports_esports,
          size: 38,
          color: AppColors.purple,
        ),
      ),
    );
  }
}

// ======================================================
// DETALHES DO JOGO
// ======================================================

void openGameDetails(BuildContext context, Game game) {
  // A tela de detalhes não será aberta.
}
class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: GameImage(
              url: game.imageUrl,
              width: 105,
              height: 125,
              radius: 15,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            game.name,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(
                icon: Icons.category,
                label: game.genre,
              ),
              _InfoChip(
                icon: Icons.star,
                label: game.rating.toStringAsFixed(1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Sobre o jogo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            game.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          _DetailRow(
            icon: Icons.business,
            title: 'Desenvolvedora',
            value: game.developer,
          ),
          _DetailRow(
            icon: Icons.devices,
            title: 'Plataformas',
            value: game.platforms,
          ),
          _DetailRow(
            icon: Icons.calendar_today,
            title: 'Categoria',
            value: game.releaseDate,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.pink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                openWebsite(context, game.websiteUrl);
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Acessar jogo'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: FavoriteButton(game: game),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// INFORMAÇÕES DOS DETALHES
// ======================================================

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        icon,
        size: 17,
        color: AppColors.purple,
      ),
      label: Text(label),
      backgroundColor: AppColors.surfaceLight,
      side: BorderSide.none,
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.purple,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// ABRIR SITE OU PÁGINA DO JOGO
// ======================================================

Future<void> openWebsite(
    BuildContext context,
    String websiteUrl,
    ) async {
  final uri = Uri.tryParse(websiteUrl);

  if (uri == null ||
      (uri.scheme != 'https' && uri.scheme != 'http') ||
      uri.host.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('O endereço deste jogo não é válido.'),
      ),
    );
    return;
  }

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o endereço do jogo.'),
        ),
      );
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ocorreu um erro ao abrir o endereço.'),
        ),
      );
    }
  }
}