{-# OPTIONS -fglasgow-exts #-}

module Main where


import Qtc.Classes.Qccs
import Qtc.Classes.Core
import Qtc.Classes.Gui
import Qtc.Core.Base
import Qtc.Core.QIODevice
import Qtc.Enums.Core.QIODevice
import Qtc.Core.QFile
import Qtc.ClassTypes.Gui
import Qtc.Gui.Base
import Qtc.Gui.QApplication
import Qtc.Gui.QLineEdit
import Qtc.Gui.QWidget
import Qtc.Core.QTextStream
import Qtc.ClassTypes.Tools
import Qtc.Tools.QUiLoader
import Qtc.Tools.QUiLoader_h
import Qtc.Classes.Script

connect_actions ui = do
  ui <- qSubClass $ qCast_QWidget ui
  btn <- findChild ui ("<QPushButton*>", "pushButton")
  line <- findChild ui ("<QLineEdit*>", "lineEdit")
  connectSlot btn "clicked()" ui "pushButtonClicked()" $ btnClicked line

btnClicked :: QLineEdit String -> QWidget () -> IO ()
btnClicked line w = do
  setText line "lol"
  return ()

main = do
  app <- qApplication ()
  rok <- registerResource "qt1.rcc"
  loader <- qUiLoader ()
  uifile <- qFile ":/main.ui"
  ui <- load loader uifile
  close uifile ()

  connect_actions ui

  qshow ui ()
  ok <- qApplicationExec ()
  return ()
