# Processador Monociclo MyRISC

Este é o repositório do projeto de desenvolvimento de um processador monociclo chamado **MyRISC**, criado como parte da disciplina de Organização e Arquitetura de Computadores 2 (OAC 2) na **Universidade Federal do Vale do São Francisco (UNIVASF)**. O projeto foi desenvolvido com a orientação e auxílio do professor da disciplina: **Max Santana Rolemberg Farias**.

## Sobre o Projeto

O processador MyRISC foi projetado para ser simples e funcional, implementando um conjunto reduzido de instruções em arquitetura RISC. A implementação foi realizada em **VHDL**, e o projeto pode ser facilmente compilado e simulado na plataforma **EDA Playground**.

## Como Executar

Para compilar e simular o projeto, siga estas etapas:

1. Acesse o site [adaPlayground](https://www.adaplayground.com/).
2. Baixe os arquivos do processador monociclo MyRISC disponíveis neste repositório.
3. No EDA Playground, faça o upload dos arquivos `.vhdl` do processador.
4. Configure os sinais de entrada e saída para simulação.
5. Execute a simulação e observe os resultados das ondas **EPWave**.

### Estrutura do Projeto

O projeto inclui os seguintes arquivos principais:

#### Arquivos de Componentes do Processador
- **`design.vhd`**: Descrição principal do processador.
- **`mux232.vhd`**: Multiplexador com duas entradas.
- **`rreg32.vhd`**: Registro de 32 bits.
- **`adder32.vhd`**: Somador de 32 bits.
- **`rom.vhd`**: Memória somente leitura (ROM).
- **`fetch.vhd`**: Unidade de busca de instruções.
- **`control.vhd`**: Unidade de controle.
- **`registers.vhd`**: Banco de registradores.
- **`decode.vhd`**: Unidade de decodificação.
- **`ram.vhd`**: Memória RAM.
- **`alucontrol.vhd`**: Controle da ALU.
- **`alu.vhd`**: Unidade Lógica e Aritmética (ALU).
- **`memoryAccess.vhd`**: Unidade de acesso à memória.
- **`writeBack.vhd`**: Unidade de escrita de volta.
- **`execute.vhd`**: Unidade de execução.
- **`mux35.vhd`**: Multiplexador com 3 entradas.
- **`ImmSll.vhd`**: Deslocador lógico imediato.

#### Exemplos e Testes
- **`exemplo1_sala.out`**
- **`exemploBNE_sala.out`**
- **`exemploJAL-JR_sala.out`**

Esses exemplos são usados para validar as instruções implementadas no processador.

## Simplicidade do Tutorial

O processo é simples:
- Faça o upload dos arquivos em um compilador VHDL como o EDA Playground.
- Configure as entradas e selecione os exemplos para testes.
- Rode a simulação e analise os resultados.

## Datapath do processador MyRISC - Monocliclo
![image](https://github.com/user-attachments/assets/5ff47dbb-240a-4e10-bc2b-239ded3032a4)

## Simulação

A simulação abaixo foi feito com o arquivo "exemploBNE_sala.out" na plataforma EDA Playground e ele representa o teste do BNE no processador Monociclo - MyRISC
![image](https://github.com/user-attachments/assets/95eba7b8-c138-4791-8441-2dc9249ce2ac)

## Contribuições

O projeto foi desenvolvido com o suporte do professor Max Santana Rolemberg Farias e em colaboração com os alunos da disciplina. Sugestões de melhorias e extensões são bem-vindas!

## Licença

Este projeto está sob a licença MIT.

Desenvolvido com dedicação pela turma de OAC 2 da UNIVASF.
