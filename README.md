<div align="center">

# Programação Funcional - Manipulação de Binários
## Objetivo do Projeto
O objetivo deste trabalho é consolidar o conhecimento sobre conceitos e construção de funções recursivas na linguagem Haskell. O projeto consiste na implementação de diversas funções matemáticas para a manipulação de "valores binários". Em toda a aplicação, os números binários são armazenados e processados como listas de inteiros, contendo apenas zeros e uns (tipo `[Int]`).

## Funções Implementadas

O projeto conta com quatro funções principais:

* **`bin2dec :: [Int] -> Int`**
    * Recebe um número binário (interpretado como inteiro sem sinal) e retorna o valor equivalente em decimal.
* **`dec2bin :: Int -> Int -> [Int]`**
    * Recebe um número decimal inteiro não-negativo e um número de bits, retornando o valor binário sem sinal correspondente.
* **`dec2bincompl :: Int -> Int -> [Int]`**
    * Converte um número decimal inteiro para a representação binária em complemento de dois, utilizando estritamente o número de bits informado.
* **`frac2bin :: Double -> ([Int], [Int])`**
    * Recebe um número fracionário decimal e devolve uma tupla representando um número binário de ponto fixo de 32 bits. A tupla divide-se em parte inteira (complemento de dois com 16 bits) e parte fracionária (binário fracionado com 16 bits).

---

## Avaliação e Feedback desse Projeto
O projeto foi avaliado nos critérios de funcionamento, corretude matemática e aplicação de recursividade. Abaixo está o registro detalhado dos acertos e dos pontos de melhoria apontados na correção:

### Função 1 (`bin2dec`): 2,5 / 2,5 (100%)
* **Status:** Excelente.
* **Feedback:** Definição e funcionamento corretos. Ótimo uso de recursividade e apresentação do exemplo de chamada.

### Função 2 (`dec2bin`): 2,4 / 2,5 (96%)
* **Status:** Funcional, com pequenos desvios matemáticos em cenários de limite.
* **Feedback:** A lógica aplica uma "saturação" (retornando todos os bits em `1`) em caso de *overflow*. Como o enunciado pedia "o valor equivalente em binário com o número de bits informado", isso gera imprecisão matemática. 
    * *Exemplo de falha:* `dec2bin 16 4` retorna `[1,1,1,1]` (que é 15 em decimal, não 16). 

### Função 3 (`dec2bincompl`): 2,05 / 2,5 (82%)
* **Status:** Funcional para números dentro do limite representável, porém sem rejeição de entradas inválidas.
* **Feedback:** A função falha ao não lançar erro ou rejeitar a entrada quando o valor excede a capacidade de representação para o número de bits `b` (ou seja, fora da faixa `[-2^(b-1) .. 2^(b-1)-1]`).
    * *Testes que falharam:*
        * Valores acima do limite positivo (ex: `8` para 4 bits, `128` para 8 bits).
        * Valores abaixo do limite negativo (ex: `-9` para 4 bits, `-129` para 8 bits).
        * Tratamento de parâmetro inválido de bits (ex: `bits <= 0`).

### Função 4 (`frac2bin`): 2,05 / 2,5 (82%)
* **Status:** Lógica de recursão fracionária correta, mas falha no tratamento exato de *overflow*.
* **Feedback:** O enunciado exige a definição de uma forma adequada para representar o resultado caso o número estoure a capacidade da tupla. A validação de limite atual falhou exatamente nos limites da fronteira de 16 bits com sinal.
    * *Testes que falharam:* A função não acusou corretamente o erro nas chamadas de `32768.0` (um acima do limite positivo) e `-32768.0` (um abaixo do menor limite negativo).

# Autoras:

| [<img loading="lazy" src="https://avatars.githubusercontent.com/u/142232479?v=4" width=115><br><sub>Luiza Hackenhaar Naziazeno</sub>](https://github.com/luizahackenhaarnaziazeno) | [<img loading="lazy" src="https://avatars.githubusercontent.com/u/142234602?v=4" width=115><br><sub>Gabrielle Guarani Da Silva</sub>](https://github.com/gguarani) |
| :---: | :---: |
