{-# OPTIONS -fglasgow-exts #-}

module Main where


import Qtc.Classes.Qccs
import Qtc.Classes.Core
import Qtc.Classes.Gui
import Qtc.Core.Base
import Qtc.Core.QIODevice
import Qtc.Enums.Core.QIODevice
import Qtc.Core.QFile
import Qtc.Gui.Base
import Qtc.Gui.QApplication
import Qtc.Gui.QWidget
import Qtc.Core.QTextStream
import Qtc.ClassTypes.Tools
import Qtc.Tools.QUiLoader
import Qtc.Tools.QUiLoader_h
import Qtc.Classes.Script

main = do
  app <- qApplication ()
  rok <- registerResource "qt0.rcc"
  loader <- qUiLoader ()
  uifile <- qFile ":/main.ui"
  ui <- load loader uifile
  close uifile ()
  qshow ui ()
  ok <- qApplicationExec ()
  return ()
