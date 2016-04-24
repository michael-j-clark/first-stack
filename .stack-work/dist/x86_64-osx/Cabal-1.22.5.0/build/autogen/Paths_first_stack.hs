module Paths_first_stack (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/michaelclark/src/haskell/first-stack/.stack-work/install/x86_64-osx/lts-5.13/7.10.3/bin"
libdir     = "/Users/michaelclark/src/haskell/first-stack/.stack-work/install/x86_64-osx/lts-5.13/7.10.3/lib/x86_64-osx-ghc-7.10.3/first-stack-0.1.0.0-4mAE1SkOcSJIFbkDYjGriV"
datadir    = "/Users/michaelclark/src/haskell/first-stack/.stack-work/install/x86_64-osx/lts-5.13/7.10.3/share/x86_64-osx-ghc-7.10.3/first-stack-0.1.0.0"
libexecdir = "/Users/michaelclark/src/haskell/first-stack/.stack-work/install/x86_64-osx/lts-5.13/7.10.3/libexec"
sysconfdir = "/Users/michaelclark/src/haskell/first-stack/.stack-work/install/x86_64-osx/lts-5.13/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "first_stack_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "first_stack_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "first_stack_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "first_stack_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "first_stack_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
