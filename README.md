loadtest_tools
==============

Some basic tools I use during Adhearsion load testing

### cputrack/ramtrack
Used to get CPU and RAM data during a load test. These rely on the Linux variants of top,
so you may need to adjust these to get the proper data on OSX, BSD, or other UNIX variants.

### arrayer/grapher
These ruby scripts can be used to convert data collected from cputrack and ramtrack into data suitable
for consumption by Google Charts (a 2-dimensional array, for more info, see the Google Charts documentation).
These will be made more flexible in the future, but for now, modification of these scripts may be required for use.
