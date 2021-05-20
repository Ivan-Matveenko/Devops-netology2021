#!/bin/bash
# display command line options

count=1
for param in "$@"; do
<<<<<<< HEAD
<<<<<<< HEAD
    echo "\$@ Parameter #$count = $param"
=======
    echo "Parameter: $param"
>>>>>>> 5fd70a1 (git-rebase 1)
=======
    echo "Next parameter: $param"
>>>>>>> 2258a61 (git-rebase 2)
    count=$(( $count + 1 ))
done

echo "====="