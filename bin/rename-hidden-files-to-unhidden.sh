
for i in .*; do
    eval "mv \"$i\" \"`echo "$i" | sed 's/^\.//g'`\""
done