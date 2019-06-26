{-# LANGUAGE RecordWildCards #-}

module SoundCloud.Config
  ( Environment (..)
  , Config (..)
  , load
  ) where

import System.Environment (lookupEnv)
import System.Environment.Extra (withDef, withDefRead)

-- | Runtime environment.
data Environment = Development | Production

-- | Application config.
data Config = Config
  { cfgPort :: !Int
  -- ^ Port number
  , cfgDbHost :: !String
  -- ^ DB host
  , cfgDbPort :: !Int
  -- ^ DB port
  , cfgDbName :: !String
  -- ^ DB name
  , cfgDbUser :: !String
  -- ^ DB user
  , cfgDbPassword :: !(Maybe String)
  } deriving (Eq, Show)

load :: Environment -> IO Config
load env = do
  cfgPort <- "PORT" `withDefRead` 3000
  cfgDbHost <- "DB_HOST" `withDef` "locahost"
  cfgDbPort <- "DB_PORT" `withDefRead` 5432
  cfgDbName <- "DB_NAME" `withDef` "soundcloud"
  cfgDbUser <- "DB_USER" `withDef` "postgres"
  cfgDbPassword <- lookupEnv "DB_PASSWORD"
  return $ Config {..}
