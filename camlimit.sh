#!/bin/bash
mysql  --database=ccio --execute='select count(*) from ccio.Monitors\G'
mysql  --database=ccio --execute='DELETE p FROM ccio.Monitors p LEFT JOIN (SELECT mid FROM ccio.Monitors ORDER BY mid DESC LIMIT 4) p2 USING(mid) WHERE p2.mid IS NULL;'
mysql  --database=ccio --execute='select count(*) from ccio.Monitors\G'
