mkdir build
cd build
cmake ../tests/
make -j8
./tests
gcovr -r .. -e ../tests/src
