import 'package:flutter/material.dart';

class AddCreditsScreen extends StatefulWidget {
  const AddCreditsScreen({super.key});

  @override
  State<AddCreditsScreen> createState() => _AddCreditsScreenState();
}

class _AddCreditsScreenState extends State<AddCreditsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos do formulário
  final _creditsController = TextEditingController();
  String? _selectedCourse;
  String? _selectedYear;
  final _studentNameController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  String? _selectedType;
  final _donationDetailsController = TextEditingController();
  final _donationQuantityController = TextEditingController();
  final _activityDetailsController = TextEditingController();

  bool _isSubmitted = false;

  // Opções para os dropdowns
  final List<String> _courses = [
    'Técnico em Informática',
    'Técnico em Administração'
  ];

  final List<String> _years = ['1º Ano', '2º Ano', '3º Ano'];

  final List<String> _types = ['Doação', 'Participação em Atividades'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Em um app real, você enviaria os dados para o backend
      setState(() {
        _isSubmitted = true;
      });
    }
  }

  @override
  void dispose() {
    _creditsController.dispose();
    _studentNameController.dispose();
    _registrationNumberController.dispose();
    _donationDetailsController.dispose();
    _donationQuantityController.dispose();
    _activityDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isSubmitted) {
      return _buildSuccessScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Créditos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Campo de créditos
                        _buildTextField(
                          controller: _creditsController,
                          label: 'Créditos',
                          hint: 'Quantidade de créditos',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira a quantidade de créditos';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Dropdown de curso
                        _buildDropdown(
                          label: 'Curso',
                          hint: 'Selecione o curso',
                          value: _selectedCourse,
                          items: _courses,
                          onChanged: (value) {
                            setState(() {
                              _selectedCourse = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione um curso';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Dropdown de ano
                        _buildDropdown(
                          label: 'Ano',
                          hint: 'Selecione o ano',
                          value: _selectedYear,
                          items: _years,
                          onChanged: (value) {
                            setState(() {
                              _selectedYear = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione um ano';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Campo de nome do aluno
                        _buildTextField(
                          controller: _studentNameController,
                          label: 'Nome do Aluno',
                          hint: 'Nome completo do aluno',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o nome do aluno';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Campo de RM
                        _buildTextField(
                          controller: _registrationNumberController,
                          label: 'RM (Registro de Matrícula)',
                          hint: 'Número de matrícula',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o RM do aluno';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Dropdown de tipo
                        _buildDropdown(
                          label: 'Tipo',
                          hint: 'Selecione o tipo',
                          value: _selectedType,
                          items: _types,
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione um tipo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Campos condicionais baseados no tipo selecionado
                        if (_selectedType == 'Doação') ...[
                          _buildTextField(
                            controller: _donationDetailsController,
                            label: 'O que foi doado',
                            hint: 'Especifique o que foi doado',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, especifique o que foi doado';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: _donationQuantityController,
                            label: 'Quantidade',
                            hint: 'Quantidade doada',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira a quantidade';
                              }
                              return null;
                            },
                          ),
                        ] else if (_selectedType ==
                            'Participação em Atividades') ...[
                          _buildTextArea(
                            controller: _activityDetailsController,
                            label: 'Atividade Realizada',
                            hint: 'Descreva a atividade realizada',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, descreva a atividade realizada';
                              }
                              return null;
                            },
                          ),
                        ],

                        const SizedBox(height: 24),

                        // Botão de envio
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Adicionar Créditos'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créditos Adicionados'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Créditos Adicionados!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_creditsController.text} créditos foram adicionados para ${_studentNameController.text} com sucesso.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Voltar ao Painel'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA78BFA),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA78BFA),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          maxLines: 4,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA78BFA),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
          ),
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          dropdownColor: const Color(0xFF111827),
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF9F7AEA)),
        ),
      ],
    );
  }
}
