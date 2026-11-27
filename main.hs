module Main where

import Automata
import System.Environment (getArgs)
import Text.Read (readMaybe)

main :: IO ()
main = do
    args <- getArgs

    case args of
        [rStr, anchoStr, generacionesStr] ->
            case (readMaybe rStr, readMaybe anchoStr, readMaybe generacionesStr) of

                (Just r, Just ancho, Just cantidad)
                    | r >= 0 && r <= 255
                    && ancho > 0
                    && cantidad > 0 -> do

                        let automataInicial = inicializar ancho r
                            generaciones = simular cantidad automataInicial

                        mapM_ (putStrLn . mostrar) generaciones

                    | otherwise ->
                        putStrLn "Error: argumentos fuera de rango."

                _ ->
                    putStrLn "Error: los argumentos deben ser numeros enteros."

        _ ->
            putStrLn "Uso: ./prog <regla> <ancho> <generaciones>"