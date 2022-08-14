# Desafio Mobile2you

Este projeto foi realizado utilizando o *framework* **Flutter** juntamente com os recursos abaixo:

>Para consumir a API *The Movie DB* foi utilizado o package **DIO**;

>O projeto foi testado na plataforma desktop **Linux** com o package [DevicePreview](https://pub.dev/packages/device_preview) para testar diferentes tamanhos e formatos de tela;

>O projeto também foi testado em um *device* físico;

>Para a gerência de estado foi utilizado **Bloc** juntamente com **Cubit**.

&nbsp;

## Estruturação

Toda a condificação do projeto está na pasta **app**, que está estruturada por meio de módulos da seguinte forma:

>**core** possui os widgets que podem ser utilizados em qualquer local da aplicação;

>**Models** contém os modelos e representações do mundo real;

>**Modules** são as funcionalidades do sistemas separadas, cada uma possui a sua UI, controlador(cubit), estado e module para injeção de depedência;

>**repositories** corresponde a camada de dados, local onde é feita a conexão com a API;

>**services** contém as regras de negócio.

&nbsp;

## Branch *new-feature*

Este projeto tem uma branch chamada **new-feature** que contém uma implementação de lista infinita para a lista de filmes similares.

    A ideia desta implementação é, ao rolar ao final da lista de filmes, novos filmes similares apareceram em seguida, seguindo o endpoint "page" da API, no qual cada page possui 20 filmes, dessa forma, a cada nova chamada, 20 filmes similares são adicionados à lista.

    Infelizmente essa funcionalidade possui um bug, no qual o listener do ScrollController, colocado dentro do BlocConsumer, está sendo chamado antes de chegar ao final da lista, creio que isso seja alguma interação entre SliverAppBar/CustomScrollView e a ListView, mas infelizmente não consegui corrigir esse bug.
