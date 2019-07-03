## Few basic Commonds and there Syntax

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
