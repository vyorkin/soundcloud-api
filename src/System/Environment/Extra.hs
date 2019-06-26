module System.Environment.Extra
  ( withDef
  , withDefRead
  ) where

import System.Environment (lookupEnv)

-- | Return the value of the environment variable @var@, or @def@ if there is no such value.
withDef :: MonadIO m => String -> String -> m String
withDef var def = liftIO $ fromMaybe def <$> lookupEnv var

-- | Almost the same as 'withDef', but attempts to parse a value using the
-- 'Read' instance first. Returns the @def@ in case of failure.
withDefRead :: Read a => String -> a -> IO a
withDefRead var def = do
  ret <- runMaybeT $ do
    value <- MaybeT $ lookupEnv var
    MaybeT $ pure $ readMaybe value
  return $ fromMaybe def ret
