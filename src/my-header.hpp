#include <iostream>

struct MyHeader
{
   int getMember() { return member; }
   inline void untestedMemberFunction();

private:
    static constexpr int computeMember() {     return 42;    }
    int member = computeMember();
};

inline void MyHeader::untestedMemberFunction()
{
    int a;
    std::cin >> a;
    if (a == 1)
        std::cout << "You just typed in 1\n";
}

