#!/bin/bash
source config.sh
rm qt1.rcc
rcc -binary qt1.qrc -o qt1.rcc
LD_LIBRARY_PATH=$HSQT_PATH/qws/bin/ ghc -package-db $HSQT_PATH/.cabal-sandbox/x86_64-linux-ghc-7.8.4-packages.conf.d/ -I$HSQT_PATH/qws/include -lqtc_core  -L$HSQT_PATH/qws/bin -lqtc_gui -lqtc_script -lqtc_network  -lqtc_opengl -lqtc_tools qt1.hs
