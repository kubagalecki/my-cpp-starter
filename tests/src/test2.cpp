#include "catch2/catch.hpp"
#include "my-lib.hpp"

TEST_CASE("A test that should fail", "[test]")
{
    MyHeader a;
    CHECK(a.getMember() == 43);
}

