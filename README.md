# Mobile_ADM

Este repositório contém o código-fonte de um aplicativo móvel administrativo, desenvolvido com a robustez e eficiência do Flutter. Projetado para oferecer controle total e insights em tempo real.

## Estrutura de Projeto

```
mobile_adm/
├── android/             # Configurações e recursos otimizados para a plataforma Android
├── ios/                 # Configurações e recursos otimizados para a plataforma iOS
├── lib/                 # O coração do aplicativo: código-fonte Dart modular e bem-estruturado
│   ├── assets/          # Recursos estáticos como imagens e ícones
│   │   └── logo-white.png
│   ├── main.dart        # O ponto de entrada principal do aplicativo
│   └── screens/         # Telas principais da aplicação
│       ├── add_credits_screen.dart # Interface para adição e gerenciamento de créditos
│       ├── dashboard_screen.dart   # Painel de controle com métricas e informações cruciais
│       └── login_screen.dart       # Autenticação segura para acesso administrativo
├── test/                # Testes unitários e de widget para garantir a qualidade do código
├── web/                 # Suporte para a plataforma Web, expandindo o alcance do aplicativo
├── .gitignore           # Gerenciamento de versão otimizado, ignorando arquivos desnecessários
├── pubspec.yaml         # Definições de dependências e metadados do projeto Flutter
└── README.md            # Este guia essencial para o projeto
```

## Funcionalidades

*   **Login Seguro:** Acesso restrito e protegido para garantir que apenas usuários autorizados possam gerenciar o sistema.
*   **Dashboard Abrangente:** Um painel de controle intuitivo que oferece uma visão consolidada das métricas e operações mais importantes.
*   **Gerenciamento de Créditos:** Funcionalidade dedicada para adicionar, monitorar e controlar créditos, essencial para sistemas baseados em consumo ou saldo.

## Execução Local


### Pré-requisitos

Certifique-se de que o Flutter SDK está devidamente instalado e configurado em sua máquina. Valide sua instalação com o comando:

```bash
flutter doctor
```

### Passos

1.  **Clone o Repositório:**:
    ```bash
    git clone https://github.com/Hermes-neptune/mobile_adm.git
    cd mobile_adm
    ```

2.  **Instale as Dependências:** Garanta que todas as bibliotecas necessárias estejam prontas para uso:
    ```bash
    flutter pub get
    ```

3.  **Execute o Aplicativo:** Conecte seu dispositivo (Android ou iOS) ou inicie um emulador/simulador e execute:
    ```bash
    flutter run
    ```
    Para uma experiência web (se configurada):
    ```bash
    flutter run -d chrome # ou seu navegador preferido
    ```

## Contribuição
 
1.  **Faça um Fork:** Crie sua própria cópia do repositório.
2.  **Crie uma Nova Branch:** Desenvolva suas funcionalidades em um ambiente isolado (`git checkout -b feature/sua-nova-feature`).
3.  **Realize Suas Alterações e Commit:** Implemente suas ideias e registre-as com mensagens claras e concisas (`git commit -m 'Implementa funcionalidade X com maestria'`).
4.  **Envie Suas Alterações:** Compartilhe seu trabalho (`git push origin feature/sua-nova-feature`).
5.  **Abra um Pull Request:** Proponha suas melhorias para integração ao projeto principal, descrevendo detalhadamente suas contribuições.

## Licença

Este projeto é distribuído sob a licença MIT License. Consulte o arquivo `LICENSE` para todos os detalhes e termos de uso.


