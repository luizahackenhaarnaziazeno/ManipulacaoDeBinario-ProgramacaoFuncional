-- funções recursivas em Haskell.
-- um número binário é armazenado como uma lista de zeros e uns. 
-- 
--Função que devem ser feitas:
{-
--Definir uma função recursiva que recebe um número binário (interpretado como número inteiro sem sinal) e 
--retorna o valor equivalente em decimal.
bin2dec :: [Int] -> Int

--Definir uma função recursiva que recebe um número decimal inteiro não-negativo, um número de bits 
--desejado e retorna o valor equivalente em binário (interpretado como número inteiro sem sinal) com o 
--número de bits informado.
-- Por exemplo:
bin2dec 2 8
-- Retorna [0,0,0,0,0,0,1,0].

dec2bin :: Int -> Int -> [Int]

-- Definir uma função recursiva que recebe um número decimal inteiro, um número de bits desejado e retorna 
--o valor equivalente em binário na representação de complemento de dois com o número de bits informado.
--Por exemplo:
𝑑𝑒𝑐2𝑏𝑖𝑛𝑐𝑜𝑚𝑝𝑙 (−2) 8 
-- Retorna [1,1,1,1,1,1,1,0] 
𝑑𝑒𝑐2𝑏𝑖𝑛𝑐𝑜𝑚𝑝𝑙 ∷ 𝐼𝑛𝑡 → 𝐼𝑛𝑡 → [Int]

--Definir uma função recursiva que recebe um número fracionário decimal por parâmetro e devolve um 
--número binário de ponto fixo de 32 bits. O número binário de ponto fixo dever ser representado por uma 
--tupla com dois números binários tal que a parte inteira deve estar na representação de complemento de 
--dois com 16 bits e a parte fracionária deve estar na representação de binário fracionado com 16 bits. Você 
--deve definir uma forma adequada de representar o resultado caso o número decimal estoure a 
--representação. 
--Por exemplo:
frac2bin (-8.5)
-- Retorna ([1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0],[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
𝑓𝑟𝑎𝑐2𝑏𝑖𝑛 ∷ 𝐷𝑜𝑢𝑏𝑙𝑒 → ([𝐼𝑛𝑡],[𝐼𝑛𝑡])

}-