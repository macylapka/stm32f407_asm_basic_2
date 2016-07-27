.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.section  .text
.weak     _main              /* that's because of declaring it as an entry point */
.type     _main, %function  

_copy_data:
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, [r0]
    str r2, [r1]

_clear_registers:
    eor r0, r0
    eor r1, r1
    eor r2, r2

_test:
    ldr r0, =test
    ldr r0, [r0]
    b _test

_main:
    bl _copy_data
    bl _clear_registers
    bl _test
    
.size _main, . - _copy_data

.section .int_vector_table, "a", %progbits   /* interrupt table */
                                             /* "a" - tells that section is allocatable  */
                                             /* (see ld manual) */
                                             /* %progbits - tells that section contains data */
                                             /* (see gas manual) */

.data
    test: .word 0x0000BABE

.bss
    test2: .word

.section ._user_heap_stack

.type basic_vectors, %object

basic_vectors:
    .word   _estack            /* stack top address (declared in basic.ld) - the last SRAM address */
    .word   _main              /* the address of a reset handler */
    
    .size   basic_vectors, . - basic_vectors
