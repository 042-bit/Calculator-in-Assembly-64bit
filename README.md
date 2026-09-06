# Calculator-in-Assembly-64bit

> [!Warning]
> Calculator can calc only numbers between 0x00 to 0xFFF ( 4095 )


> [!Note]
> Below are the operators that can be used in the second argument.




# OPERATORS                        
|operators | Function |
| ---      | ---      |
|    +     |   ADD    |
|    -     |   SUB    |
|    *     |   MUL    | 
|    /     |  DIV     |




 # TABLE OF ARGS
 |   ARG       | Possible contents               |
 | ---         | ---                             |
 |    ARG1     |   number 0x00 - 0xFFF           |
 |    ARG2     |   operator from table operators |
 |    ARG3     |   number 0x00 - 0xFFF           |




> [!Note]
> file must be compiled below we have a compilation linux command




# Nasm to object compile
```console
nasm -f elf64 program.asm -o program.o
```



# Linker to executable
```console
ld program.o -o program
```
