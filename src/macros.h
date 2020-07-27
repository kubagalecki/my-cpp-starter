// FORCE_DBG_GEN is a function attribute which forces code generation in non-optimized builds
// It's used to force gcov to correctly report uninvoked functions (i.e. 0% code coverage)
#ifdef __GNUC__
    #ifndef __OPTIMIZE__
        #define FORCE_DBG_GEN __attribute__ ((used))
    #else
        #define FORCE_DBG_GEN // in optimized builds do nothing
    #endif
#else
    #define FORCE_DBG_GEN
    #pragma message ( "Code coverage from compilers other than gcc may be inaccurate" )
#endif

