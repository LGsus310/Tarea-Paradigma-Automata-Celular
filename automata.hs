module Automata where
import Data.Bits (testBit)

data Automata = Automata{
    celdas :: [Bool],
    regla :: Int,
    generacion :: Int
    } deriving (Show)

--- Generacion Inicial ---
inicializar :: Int -> Int -> Automata 
inicializar ancho r = 
    Automata{
        celdas      = [i == ancho `div` 2 | i <- [0.. ancho-1]],
        regla       = r,
        generacion  = 0
    }

--- Aplicar Regla Wolfram a Vecindad --- 
reglaWolf :: Int -> Bool -> Bool -> Bool -> Bool
reglaWolf  r izquierda centro derecha = 
    testBit r indice 
    where
        indice = 
            4*fromEnum izquierda + 
            2*fromEnum centro + 
            fromEnum derecha

--- Obtener nueva generacion --- 
paso :: Automata -> Automata
paso (Automata cs r g) = Automata nuevasCeldas r (g + 1)
    where
        ancho = length cs

        nuevasCeldas =
            [ reglaWolf r
                (cs !! ((i - 1) `mod` ancho))
                (cs !! i)
                (cs !! ((i + 1) `mod` ancho))
            | i <- [0 .. ancho - 1]
            ]


-- Convertir las celulas a caracteres
mostrarCeldas :: [Bool] -> String
mostrarCeldas cs =
    map (\c -> if c then '#' else ' ') cs

-- Mostrar una generacion
mostrar :: Automata -> String
mostrar a =
    mostrarCeldas (celdas a)

-- Generar una lista de generaciones
simular :: Int -> Automata -> [Automata]
simular cantidad a =
    take cantidad (iterate paso a)            