#!/bin/sh

cd /web/cpandeps`cat dev_build`.cantrell.org.uk/db
wget -q -O 02packages http://cpan.org/modules/02packages.details.txt.gz &&
mv 02packages 02packages.details.txt.gz

wget -q http://perl.grango.org/cpanstats.db.gz &&
gzip -d cpanstats.db.gz && (
  ../optimisedb.pl;
  cp cpantestresults cpantestresults.previous;
  mv cpanstats.db cpantestresults
)

rm cpanstats.db.gz >/dev/null 2>/dev/null