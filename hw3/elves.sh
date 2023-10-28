#!/usr/bin/bash
set -o errexit; set -o pipefail; set -o nounset

if [ $# -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 0
fi

file_in=$1
if ! [ -f "$file_in" ]; then
    echo "File $file_in doesn't exists. Exciting.."
    exit 0
fi

current_elf=1
current_calories=0
max_calorie_elf=1
max_calories=0
while read -r line; do
    if [ -z "$line" ]; then
        # in case of file starting with blank line
        # or there are multiple lines between each Elf's data
        if [ $current_calories -eq 0 ]; then
            continue
        else
            if [ $current_calories -gt $max_calories ]; then
                max_calorie_elf=$current_elf
                max_calories=$current_calories
            fi
            ((current_elf++))
            current_calories=0
            echo
            echo "new elf $current_elf, $current_calories"
        fi
    else
        echo $((line))
        current_calories=$((line + current_calories))
        echo "current calories: $current_calories"
    fi
done < "$file_in"

# check again in case the last elf carries the most calories
if [ $current_calories -gt $max_calories ]; then
    max_calorie_elf=$current_elf
    max_calories=$current_calories
fi

echo
echo "Number $max_calorie_elf elf carries the most, \
a total of $max_calories calories"