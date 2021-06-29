{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import System.Environment
import qualified Data.ByteString.Lazy as B
import Data.List
import Data.Aeson
import Data.Aeson.Types
import Data.HashMap.Strict
import GHC.Generics
import Data.Text

data NodePkg = Entry
    {
        name :: String,
        version :: String,
        scripts :: HashMap Text Text
    } deriving Generic

instance FromJSON NodePkg
instance ToJSON NodePkg

main = do
    args <- getArgs
    case args of
        []      -> decodePkg "/home/alfie/.una/plugins/nodepkg/testpkg.json"
        (x:_)   -> decodePkg x

decodePkg path = do
    print path
    jsonFile <- B.readFile path
    case decode jsonFile :: Maybe NodePkg of
        Nothing -> print "Error parsing JSON"
        Just m  -> do
            putStr "📜 Scripts: "
            putStrLn (Data.List.intercalate " | " (Prelude.map (displayLink) ((toList . scripts) m)))
            return ()

displayLink m = "\x1B]8;;" ++ (unpack . snd) m ++ "\a" ++ (unpack . fst) m ++ "\x1B]8;;\a"