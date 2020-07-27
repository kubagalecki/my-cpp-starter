#!/bin/sh -l

echo "Starting CI build..."
mkdir build
cd build
cmake ../tests
make -j4
echo "Running tests..."
./tests && TEST_STATUS=true || TEST_STATUS=false
$TEST_STATUS || echo "Tests failed. Delaying exit until after code coverage is reported"
echo "Generating code coverage report..."
gcovr -x -r .. -e ../tests/src -o codecov.xml
echo "Uploading report to Codecov..."
bash -c "bash <(curl -s https://codecov.io/bash) -t $CODECOV_TOKEN"
$TEST_STATUS && echo "All tests passed. Good job! Finishing..." && exit 0 || echo "Some tests failed. I'm going to crash now. Goodbye." && exit 1
