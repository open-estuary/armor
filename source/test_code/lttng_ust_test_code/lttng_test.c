#include <stdio.h>
#include "lttng_test_tp.h"

int main(int argc, char *argv[])
{
    int x;

    puts("LTTNG Test app!\n");

    /*
     * The following getchar() call is only placed here for the purpose
     * of this demonstration, for pausing the application in order for
     * you to have time to list its events. It's not needed otherwise.
     */
    /* getchar(); */

    /*
     * A tracepoint() call. Arguments, as defined in lttng_test_tp.h:
     *
     *     1st: provider name (always)
     *     2nd: tracepoint name (always)
     *     3rd: my_integer_arg (first user-defined argument)
     *     4th: my_string_arg (second user-defined argument)
     *
     * Notice the provider and tracepoint names are NOT strings;
     * they are in fact parts of variables created by macros in
     * lttng_test_tp.h.
     */
    tracepoint(lttng_test, my_first_tracepoint, 23, "In lttng test app!");

    for (x = 0; x < argc; ++x) {
        tracepoint(lttng_test, my_first_tracepoint, x, argv[x]);
    }

    puts("Quitting now!");

    tracepoint(lttng_test, my_first_tracepoint, x * x, "x^2");

    return 0;
}

