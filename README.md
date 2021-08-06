# Single linked list

compile: `cc sll.c -o sll -ggdb3`

valgrind:
```
==117284== Memcheck, a memory error detector
==117284== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==117284== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
==117284== Command: ./sll
==117284== 
Linked list empty
Linked list empty
Linked list empty
Linked list empty
Found in 0
Out of range
Out of range
Out of range
Data not found
22
5
3
==117284== 
==117284== HEAP SUMMARY:
==117284==     in use at exit: 0 bytes in 0 blocks
==117284==   total heap usage: 11 allocs, 11 frees, 1,184 bytes allocated
==117284== 
==117284== All heap blocks were freed -- no leaks are possible
==117284== 
==117284== For lists of detected and suppressed errors, rerun with: -s
==117284== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```