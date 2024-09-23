#!/usr/bin/bash

proccess_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR==2' ../data/stats.txt
    awk "NR>=6 && NR<=${line_count}" ../data/stats.txt
}
cpu_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR==3' ../data/stats.txt
}
ram_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR>=4 && NR<=5' ../data/stats.txt
}
spec_ram_func() {
    free
}
