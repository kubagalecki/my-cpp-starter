mkdir build
cd build
cmake ../tests
make -j4
./tests && TEST_STATUS=true || TEST_STATUS=false
gcovr -x -r .. -e ../tests/src
bash <(curl -s https://codecov.io/bash) -t $CODECOV_TOKEN
$TEST_STATUS && exit 0 || exit 1
