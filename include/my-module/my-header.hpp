#include "utils/macros.h"

#include <iostream>
#include <vector>
#include <execution>

struct MyHeader
{
    int                       getMember() { return member; }
    FORCE_DBG_GEN inline void untestedMemberFunction();
    FORCE_DBG_GEN inline int  testCpp17Feature();

private:
    static constexpr int computeMember() { return 42; }
    int                  member = computeMember();
};

inline void MyHeader::untestedMemberFunction()
{
    int a;
    std::cin >> a;
    if (a == 1)
        std::cout << "You just typed in 1\n";
}


inline int testCpp17Feature()
{
    // Test that CTAD, std::reduce, and execution policies compile (new in C++17)
    std::vector vec{1., 2., 3.};
    return std::reduce(std::execution::seq, cbegin(vec), cend(vec));
}
