HATop Testing Lab
=================

This directory provides a small testing lab for playing with
haproxy and nginx configurations, for when you want to see a real
system, but don't have enough unique content / configuration /
application code to pull something together.

It uses Docker and Docker Compose.  To run it:

    ./run

If you want to background the compose runs, tack on a `-d`:

    ./run -d

This configuration currently spins up N (default: 3) nginx
"application servers", each of which responds to a GET /index.html
with a numbered, distinguishable response payload.  Those are each
proxied, individually, on ports 884X, where X ranges from 1 to N.

An additional backend, on prot 8840, proxies all of the backends.

To change the number of instances spun up, set the `INSTANCES`
environment variable:

    INSTANCES=5 ./run -d

You shouldn't go above N=9, because of the naive port numbering
strategy (N is expected to be a single digit).
