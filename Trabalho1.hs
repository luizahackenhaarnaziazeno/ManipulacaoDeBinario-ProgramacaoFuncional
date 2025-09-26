{-
Trabalho 1 - Programação Funcional
Data: 26/09/2025
Integrantes: Gabrielle Guarani da Silva e Luiza Hackenhaar Naziazeno.
-}
{-
1. Definir uma função recursiva que recebe um número binário (interpretado como número inteiro sem sinal) e
retorna o valor equivalente em decimal. 𝑏𝑖𝑛2𝑑𝑒𝑐 ∷ [ 𝐼𝑛𝑡 ] → 𝐼𝑛𝑡
-}

bin2dec :: [Int] -> Int
bin2dec [] = 0
-- Multiplica o primeiro bit pela potência correspondente à sua posição
bin2dec (x:xs) = x * (2 ^length xs) + bin2dec xs

{-
2. Definir uma função recursiva que recebe um número decimal inteiro não-negativo, um número de bits
desejado e retorna o valor equivalente em binário (interpretado como número inteiro sem sinal) com o
número de bits informado. Por exemplo, 𝑑𝑒𝑐2𝑏𝑖𝑛 2 8 deve retornar [0,0,0,0,0,0,1,0]. 𝑑𝑒𝑐2𝑏𝑖𝑛 ∷ 𝐼𝑛𝑡 → 𝐼𝑛𝑡 → [𝐼𝑛𝑡]
-}

dec2bin :: Int -> Int -> [Int]
dec2bin _ 0 = []
dec2bin n b
  -- Verifica se o bit mais significativo da posição atual deve ser 1
  | n >= 2 ^ (b - 1) = 1 : dec2bin (n - 2 ^ (b - 1)) (b - 1)
  | otherwise        = 0 : dec2bin n (b - 1)

{-
3. Definir uma função recursiva que recebe um número decimal inteiro, um número de bits desejado e retorna
o valor equivalente em binário na representação de complemento de dois com o número de bits informado.
Por exemplo, 𝑑𝑒𝑐2𝑏𝑖𝑛𝑐𝑜𝑚𝑝𝑙 (−2) 8 deve retornar [1,1,1,1,1,1,1,0] 𝑑𝑒𝑐2𝑏𝑖𝑛𝑐𝑜𝑚𝑝𝑙 ∷ 𝐼𝑛𝑡 → 𝐼𝑛𝑡 → [𝐼𝑛𝑡]
-}

dec2bincompl :: Int -> Int -> [Int]
dec2bincompl n bits = dec2bin valor bits
  where
    m = 2 ^ bits
    -- Para números negativos, soma com o módulo para obter representação em complemento de dois
    valor = if n < 0 then m + n else n

{-
4. Definir uma função recursiva que recebe um número fracionário decimal por parâmetro e devolve um
número binário de ponto fixo de 32 bits. O número binário de ponto fixo dever ser representado por uma
tupla com dois números binários tal que a parte inteira deve estar na representação de complemento de
dois com 16 bits e a parte fracionária deve estar na representação de binário fracionado com 16 bits. Você
deve definir uma forma adequada de representar o resultado caso o número decimal estoure a
representação. Por exemplo, 𝑓𝑟𝑎𝑐2𝑏𝑖𝑛 (−8.5) deve retornar
([1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0], [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]). 𝑓𝑟𝑎𝑐2𝑏𝑖𝑛 ∷ 𝐷𝑜𝑢𝑏𝑙𝑒 → ([𝐼𝑛𝑡], [𝐼𝑛𝑡])
-}

frac2bin :: Double -> ([Int], [Int])
frac2bin x
  -- Overflow: retorna todos os bits 1 para indicar erro
  | x >= limite || x < -limite = (replicate 16 1, replicate 16 1)
  | otherwise = (dec2bincompl intPart 16, frac2binAux fracPart 16)
  where
    limite = 32768.0 -- 2^15, limite para 16 bits com sinal
    
    -- Separa parte inteira e fracionária
    intPart = extrairParteInteira x
    fracPart = extrairParteFracionaria x intPart
    
    -- Extrai parte inteira contando quantas unidades cabem no número
    extrairParteInteira :: Double -> Int
    extrairParteInteira y
      | y >= 0 = contarInteiros y 0
      | otherwise = -(contarInteiros (negarDouble y) 0)
    
    -- Conta quantas unidades inteiras cabem no número
    contarInteiros :: Double -> Int -> Int
    contarInteiros y acc
      | y < 1.0 = acc
      | otherwise = contarInteiros (y - 1.0) (acc + 1)
    
    -- Subtrai a parte inteira para obter apenas a parte fracionária
    extrairParteFracionaria :: Double -> Int -> Double
    extrairParteFracionaria original parteInt
      | original >= 0 = original - intParaDouble parteInt
      | otherwise = negarDouble original - intParaDouble (negarInt parteInt)
    
    -- Converte Int para Double
    intParaDouble :: Int -> Double
    intParaDouble n
      | n == 0 = 0.0
      | n > 0 = 1.0 + intParaDouble (n - 1)
      | otherwise = -1.0 + intParaDouble (n + 1)
    
    -- Nega Double e Int
    negarDouble :: Double -> Double
    negarDouble y = 0.0 - y
     
    negarInt :: Int -> Int
    negarInt n = 0 - n
    
    -- Converte parte fracionária usando multiplicação por 2 sucessiva
    frac2binAux :: Double -> Int -> [Int]
    frac2binAux _ 0 = []
    frac2binAux f b
      | f <= 0    = replicate b 0
      -- Se >= 0.5, o bit atual é 1 e subtrai 0.5 antes de continuar
      | f >= 0.5  = 1 : frac2binAux ((f - 0.5) * 2) (b - 1)
      | otherwise = 0 : frac2binAux (f * 2) (b - 1)