#!/bin/sh -l

echo "Starting CI build..."
mkdir build
cd build
cmake ../tests
make -j4
echo "Running tests..."
./tests && TEST_STATUS=true || TEST_STATUS=false
$TEST_STATUS || echo "Tests failed. Delaying error until after code coverage is reported"
echo "Generating code coverage report and uploading to Codecov"
export CODECOV_TOKEN=$INPUT_CODECOV_TOKEN
curl -s https://codecov.io/bash | bash -g "../tests/src/" -p "../"
$TEST_STATUS && echo "All tests passed. Good job! Finishing..." && exit 0 || echo "Some tests failed. I'm going to crash now. Goodbye." && exit 1
