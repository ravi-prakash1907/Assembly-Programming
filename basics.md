## Categorization of Registers
Registers are a type of computer memory used to quickly accept, store, and transfer data and instructions that are being used immediately by the CPU

### Processor Registers (3)

> General Registers
>    * Data Registers
>    * Pointer Registers
>    * Index Registers
>
> Control Registers \
> Segment Registers
>
> *There are TEN 32-bit and SIX 16-bit Processor Registers*

## AS per the 8086 CPU:

### General Purpose Registers
_Here any kind of data is stored_
```
16-bit Registers

1. AX: Accumulator Register (Devided into AH/AL i.e. 8-bit each)
2. BX: Base Address Register (Devided into BH/BL i.e. 8-bit each)
3. CX: Count Register (Devided into CH/CL i.e. 8-bit each)
4. DX: Data Register (Devided into DH/DL i.e. 8-bit each)
5. SI: Source Index Register
6. DI: Destination Index Register
7. BP: Base Pointer
8. SP: Stack Pointer
```

### Control Registers
```

```

### Segment Registers
These are generally pointers.
```
1. CS: (Code Seg.) Pointes the segment containing current programm
2. DS: (Data Seg.) Points segment where variables are defined (usually)
3. ES: Extra Segment Register (Programme defines its usage)
4. SS: Points the Segment containing the stack
```
