#!/usr/bin/awk -f

BEGIN {
    FS = ","
    sum = 0
    count = 0
}

NR > 1 {
    sum += $3
    count++
}

END {
    avg = sum / count
    printf "Rata-rata kelembaban: %.1f\n", avg
}
