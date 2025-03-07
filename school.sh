#!/bin/babsh

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f7 | { sum=0; count=0; while read val; do sum=$((sum + val)); count=$((count + 1)); done; echo "Average TotalAssessedValue: $((sum / count))"; }
