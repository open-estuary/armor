#!/bin/bash

lttng create

lttng enable-event --userspace lttng_test:my_first_tracepoint

lttng start

./lttng_test lttng userspace 

lttng stop

lttng view

#lttng destroy 









