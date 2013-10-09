#!/bin/sh

if [-d bin]; then
	rm -f "bin/*.*"
else
	mkdir bin
fi

if [-d obj]; then
	rm -f "obj/*.*"
else
	mkdir obj
fi

cd src

echo "Cleaning up..."
rm -f "../bin/*.*"

echo "Compiling..."
fpc -FE../bin/ -ogame -FU../obj/ -Sd -XX main.dpr

cd ../bin

./game
