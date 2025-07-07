# Desafio RGR

## Participante

- Diego F. S. Souza

## Resumo

Esse README contém instruções de como rodar a aplicação mobile do desafio da RGR.

### Branches
O projeto contém uma para executar a aplicação:

- [main](https://github.com/diegoferss/desafio-rgr/tree/main) - O projeto foi feito utilizando o package bloc para gerenciamento de estado, reatividade e lidar com interações do usuário.

## Pré-requisitos

Antes de começar, verifique se você atende aos seguintes requisitos:

* Você instalou o `Flutter`.

## Instalação

Para instalar a aplicação, siga estas etapas:

Clone o projeto:
```
git clone https://github.com/diegoferss/desafio-rgr.git
```

ou

```
git@github.com:diegoferss/desafio-rgr.git
```

Instale as depêndencias:
```
flutter pub get
```

## Execução

Rodando a aplicação:

```
flutter run
```

## Estrutura do projeto

```
root/
├── assets/ -> Contém as imagens utilizadas pela aplicação
├── lib/ -> Código da aplicação
│   ├── adapters/ -> Arquivos para transformação de dados
│   ├── features/ -> Funcionalidades de aplicação
│   │   ├── home/ -> Funcionalidade específica da aplicação
│   │   │   ├── di/ -> Injeção de dependências da funcionalidade
│   │   │   │   └── home_module.dart
│   │   │   ├── use_cases/ -> Casos de uso específicos da funcionalidade
│   │   │   │   └── login_with_email_and_password.dart
│   │   │   ├──bloc/ -> Gerenciador de estado e interações do usuário da funcionalidade
|   |   |   |   └── home_view_state.dart
|   |   |   |   └── home_view_event.dart
|   |   |   |   └── home_bloc.dart
│   │   │   └── home_view.dart
│   ├── router/ Configuração das rotas
│   ├── l10n/ -> Internacionalização da aplicação 
│   ├── support/ -> Arquivos de suporte para aplicação
│   │   ├── components/ -> Componentes comuns da aplicação
│   │   ├── enums/ Enums compartilhados pela aplicação
│   │   ├── extensions/ Extensão de tipos para fornecer novas ações
│   │   ├── services/ Definição de serviços da minha aplicação
│   │   ├── styles/ Estilos, temas, fontes e cores padrões da aplicação
│   │   ├── utils/ Arquivos voltados para utilidades no geral da aplicação
│   └── main.dart
├── pubspec.yaml
└── README.md
```
