import 'package:flutter/material.dart';
import '../screens/add_credits_screen.dart';
import '../screens/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de opções do menu
    final menuItems = [
      {
        'id': 'add-credits',
        'title': 'Adicionar Créditos',
        'icon': Icons.add_circle,
        'description': 'Adicione créditos para alunos',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCreditsScreen()),
          );
        },
      },
      {
        'id': 'history',
        'title': 'Histórico',
        'icon': Icons.history,
        'description': 'Veja seu histórico',
        'onTap': () {},
      },
      {
        'id': 'profile',
        'title': 'Meu Perfil',
        'icon': Icons.person,
        'description': 'Gerencie suas informações pessoais',
        'onTap': () {},
      },
      {
        'id': 'settings',
        'title': 'Configurações',
        'icon': Icons.settings,
        'description': 'Ajuste as configurações da sua conta',
        'onTap': () {},
      },
      {
        'id': 'help',
        'title': 'Ajuda',
        'icon': Icons.help_center,
        'description': 'Obtenha suporte e ajuda',
        'onTap': () {},
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF111827),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Hero(
                      tag: "imagem",
                      child: Image.network(
                        "https://raw.githubusercontent.com/Hermes-neptune/site-produto/refs/heads/main/img/logo/logo-white.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),

                  // Botão de logout
                  IconButton(
                    icon: const Icon(Icons.logout, color: Color(0xFF9CA3AF)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Saudação
              const Text(
                'Olá, Usuário',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Bem-vindo ao seu painel',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                ),
              ),
              const SizedBox(height: 24),

              // Card de saldo
              Card(
                child: Column(
                  children: [
                    // Botões de ação rápida
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildQuickActionButton(
                            context,
                            Icons.add_circle,
                            'Adicionar',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddCreditsScreen()),
                              );
                            },
                          ),
                          _buildQuickActionButton(
                            context,
                            Icons.history,
                            'Histórico',
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Título do menu
              const Text(
                'Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Lista de opções do menu
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuItems.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _buildMenuItem(
                    context,
                    item['icon'] as IconData,
                    item['title'] as String,
                    item['description'] as String,
                    item['onTap'] as Function(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF9F7AEA)),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF9F7AEA),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF1F2937)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(icon, color: const Color(0xFF9F7AEA)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
