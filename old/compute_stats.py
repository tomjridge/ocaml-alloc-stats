#!/usr/bin/env python


import csv

# maintain a dict, mapping allocation size to number of allocs
allocs = dict()

with open('queens.lookahead.dump') as csvfile:
    reader = csv.reader(csvfile, delimiter=' ')
    for row in reader:
        #print(', '.join(row))
        entry_type = row[0]
        if (entry_type == 'a' or entry_type == 'A'):
            sz = row[2]
            if sz in allocs:
                allocs[sz] = allocs[sz]+1
            else:
                allocs[sz] = 1

print(allocs)

# output:
# {'2': 33785, '4': 2060, '3': 2065, '5': 1965, '8': 94, '1': 95}
