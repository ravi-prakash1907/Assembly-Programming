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
_These are used for controlling and are mainly termed as Flags_

1. OF
2. DF
3. IF
4. TF
5. SF
6. ZF
7. AF
8. PF
9. CF



### Segment Registers
_These are generally pointers._

1. **CS:** (Code Seg.) Pointes the segment containing current programm
2. **DS:** (Data Seg.) Points segment where variables are defined (usually)
3. **ES:** Extra Segment Register (Programme defines its usage)
4. **SS:** Points the Segment containing the stack


<hr />

Assembly language is NOT case sensitive
## Declaration

#### Data Types:

1. _DB (Define Byte)_
2. _DW (Define Word)_
3. _DD (Define DoubleWord)_
4. _DQ (Define QuadWord)_

*Here Byte/Word etc referred to the size allocated*

**Syntax for Variables**
```
Var_Name    Type     Value

A           DB        10              // DB = Data Byte
Message     DB        'Hello!'
Var         DW        1122H           // DW = Data Word, so that larger (hex) value can be stored
Str         DB        "Hi",'$'        // '$' just works as string end (kinda \0)
StrTemp     DB        10,13,"Hi",'$'  // in 8086, 10,13 act for carriage return or kinda \n

```

#### Arrays

**Syntax**
```
a     DB    1h,2h,3Fh,7Fh     // its an array of hex values i.e. a = [1, 2, 3F, 7F] in hex(h)

b     DW     1111h,2222h,3333h
```

#### Duplicating data element(s)

**Syntax**

Keyword used for same is DUP and it's mainly used in the array
```
Var_Name      Type      <n: no_of_duplicacies> DUP(Data_to_be_Duplicated)


x   db    3 DUP(5)        // x  db  5,5,5
y   db    2 DUP(3,2)      // y  db  3,2,3,2

arr   DW     10 dup(?)    // An empty array with 10 initial val '0'
```
