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

16-bit Registers

1. **AX:** Accumulator Register (Devided into AH/AL i.e. 8-bit each)
2. **BX:** Base Address Register (Devided into BH/BL i.e. 8-bit each)
3. **CX:** Count Register (Devided into CH/CL i.e. 8-bit each)
4. **DX:** Data Register (Devided into DH/DL i.e. 8-bit each)
5. **SI:** Source Index Register
6. **DI:** Destination Index Register
7. **BP:** Base Pointer
8. **SP:** Stack Pointer


### Control Registers
_Yet to be updated_



### Segment Registers
_These are generally pointers._

1. **CS:** (Code Seg.) Pointes the segment containing current programm
2. **DS:** (Data Seg.) Points segment where variables are defined (usually)
3. **ES:** Extra Segment Register (Programme defines its usage)
4. **SS:** Points the Segment containing the stack


<hr />

## Data Types:

1. DB (Define Byte)
2. DW (Define Word)
3. DD (Define DoubleWord)
4. DQ (Define QuadWord)
**Here Byte/Word etc referred to the size allocated**

**Declaration Syntax**
```
Var_Name    Type     Value

A           DB        10          // DB = Data Byte
Message     DB        'Hello!'
Var         DW        1122H       // DW = Data Word, so that larger (hex) value can be stored
Str         DB        "Hi",'$'    // '$' just works as string end (kinda \0)
StrTemp     DB        10,13,"Hi",'$'  // in 8086, 10,13 act for carriage return or kinda \n

```
