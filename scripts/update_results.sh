#!/bin/sh
psql -U osm -d deletedways -c "insert into remapathonresults values (current_timestamp, (select count(1) from deletedways WHERE likelyremapped = false AND tags->'highway' IN ('motorway','motorway_link','trunk','trunk_link','primary','primary_link','secondary','secondary_link','tertiary') AND remappedflag < 3), (select count(1) from deletedways WHERE likelyremapped = false AND tags->'highway' IN ('motorway','motorway_link','trunk','trunk_link','primary','primary_link','secondary','secondary_link','tertiary', 'residential') AND remappedflag < 3), (select count(1) from deletedways WHERE likelyremapped = false AND tags?'highway' AND remappedflag < 3), (select count(1) from deletedways WHERE likelyremapped = false AND remappedflag < 3));"