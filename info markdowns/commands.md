# Few basic Commonds and there Syntax

### DUP
_Covered in the basics.md_

### MOV
Syntax:
```
MOV     Destination, Source
```
There are following _operand_ restrictions for **MOV**:
> MOV   REG,  MEMORY
> MOV   MEMORY,  REG
> MOV   REG,  REG
> MOV   MEMORY, IMMIDIATE
> MOV   REG, IMMIDIATE
>
> "MOV   MEMORY, MEMORY"  is  NOT  allowed!!

IMMIDIATE is a constant value  eg. 7, 1- etc.
MEMORY is represented in []  eg. [ BX ] , [ BX + SI ] + Displacement

Displacement can be defined as per the requirement

**Examples for MOV**
```
MOV     AX,  BX           //  REG, REG
MOV     [BX],  AX         //  MEM, REG
MOV     AX,  [BX]         //  REG, MEM
MOV     [BX+SI],  10      //  MEM, IMMIDIATE
MOV     AX,  5            //  REG, IMMIDIATE
```

### ADD, SUB, INC, DEC
**Examples for THESE 4**
```
ADD/SUB   REG,  REG


ADD     AX,  BX       //  Adds REG, REG
SUB     AX,  BX       //  SUBTRACTS REG, REG
INC     DI            //  INCREMENTS VALUE BY 1
DEC     DI            //  DECREASES VALUE BY 1
```

# Interrupts (INT)
_Here we'll deal with S/W Interrupts_

 **_27 Different interrupts are reserved for the DOS operations_**
 We can use/assign 224 interrupts out of 256
```
INT   VALUE  //  Here VALUE varries b/w 0 to 255 (0H to 0ffH)_


INT   10H
INT   21H
```
