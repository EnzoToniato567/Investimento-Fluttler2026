# Investimento

Aplicativo Flutter de simulação de investimento, desenvolvido para calcular o montante acumulado com base em aportes mensais, tempo de aplicação e taxa de juros ao mês.

## Como o projeto funciona

O aplicativo foi desenvolvido em **Flutter** utilizando **Dart**.

Ao iniciar, o app abre uma tela principal com o título **Simulador de Investimento** e apresenta campos para o usuário informar:

- valor mensal para investir;
- número de meses;
- taxa de juros ao mês.

Depois de preencher os campos, o usuário pode clicar no botão **Calcular**. O sistema então realiza os cálculos e exibe:

- o **montante acumulado sem juros**;
- o **montante acumulado com juros compostos**.

Além disso, o resultado também aparece em uma janela de alerta (`AlertDialog`).

## Fórmulas utilizadas

Primeiro, o valor acumulado sem juros é calculado assim:

```dart
totalSemJuros = valorMensal * meses;
```

Quando a taxa de juros for igual a zero, o montante com juros será o mesmo valor do total sem juros:

```dart
montanteComJuros = totalSemJuros;
```

Caso exista taxa de juros, o cálculo do montante com juros compostos é feito com a fórmula:

```dart
montanteComJuros = valorMensal * ((pow(1 + i, meses) - 1) / i);
```

Onde:

- `valorMensal` = valor investido por mês;
- `meses` = quantidade de meses;
- `i` = taxa de juros mensal.

## Estrutura principal do código

- `main()` inicia o aplicativo com `MaterialApp`.
- `App` é o widget principal do tipo `StatefulWidget`.
- `_AppState` controla os valores digitados e executa os cálculos.
- `calcular()` realiza as contas do investimento.
- `alert()` mostra o resultado em uma caixa de diálogo.
- `build()` monta a interface com campos, botão e textos de resultado.

## Recursos visuais

O projeto utiliza uma imagem de fundo localizada em:

- `assets/background.jpg`

Essa imagem é aplicada no fundo da tela com um filtro de cor para melhorar a aparência da interface.

## Tecnologias usadas

- **VS Code**: editor utilizado para programar o projeto.
- **Flutter**: framework usado para criar a interface e a lógica do aplicativo.
- **Extensão Flutter**: extensão do VS Code para executar e depurar projetos Flutter.
- **Extensão Dart**: extensão do VS Code para suporte à linguagem Dart.

## Como executar o projeto

1. Instale o **Flutter SDK**.
2. Abra o projeto no **VS Code**.
3. Instale as extensões **Flutter** e **Dart**.
4. No terminal, execute (caso o background não funcione):

```bash
flutter pub get
```

5. Depois, rode o projeto com:

```bash
flutter run
```

## Objetivo

Este projeto tem como objetivo simular um investimento de forma simples, ajudando a visualizar o valor acumulado ao longo do tempo com e sem a aplicação de juros compostos.
