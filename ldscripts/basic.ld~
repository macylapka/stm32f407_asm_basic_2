INCLUDE stm32f407.memory

ENTRY(_main)

SECTIONS 
{  
    .int_vector_table : 
    {
        *(.int_vector_table)
    } >REGION_INT_VECTORS
  
    .text : 
    {
        *(.text)
    } >REGION_TEXT

    /* used by the startup to initialize data */
    _sidata = .;

    /* Initialized data sections goes into RAM, load LMA copy after code */
    .data : AT ( _sidata )
    {
        . = ALIGN(4);
        _sdata = .;        /* create a global symbol at data start */
        *(.data)           /* .data sections */
        *(.data*)          /* .data* sections */

        . = ALIGN(4);
        _edata = .;        /* define a global symbol at data end */
    } >RAM

    /* Uninitialized data section */
    . = ALIGN(4);
    .bss :
    {
        /* This is used by the startup in order to initialize the .bss secion */
        _sbss = .;         /* define a global symbol at bss start */
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        _ebss = .;         /* define a global symbol at bss end */
        __bss_end__ = _ebss;
    } >REGION_UNINIT_DATA

    /* User_heap_stack section, used to check that there is enough RAM left */
    ._user_heap_stack :
    {
      . = ALIGN(4);
      PROVIDE ( end = . );
      PROVIDE ( _end = . );
      PROVIDE ( __end__ = . );
      . = . + _Min_Heap_Size;
      . = . + _Min_Stack_Size;
      . = ALIGN(4);
    } >RAM
}

