#!/usr/bin/awk -f

BEGIN {
    FS = ","
    max_temp = -999
}

NR > 1 {
    if ($2 > max_temp) {
        max_temp = $2
    }
}

END {
    printf "Suhu maksimum: %.1f\n", max_temp
}
