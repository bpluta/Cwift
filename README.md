# Cwift

Cwift is a C-like subset of Swift language. It comes along with Cwift compiler which is is used to compile its code to x86_64 NASM Assembly.

## Currently supported tokens
- Types: `Int`, `Double`, `Bool`
- Declarations: `let`, `var`, `func`
- Loop blocks: `while`
- Conditional blocks: `if` `else` `else if` `? :`
- Boolean operators: `==`, `!=`, `!`, `>`, `>=`, `<`, `<=`, `&&`, `||`
- Bitwise operators: `&`, `|`, `^`
- Mathematical operators: `+`, `-`, `*`, `/`, `%`
- Comments: `//`

## Useful info
Cwift language is pretty much like Swift however it has some implementation differences - the most important ones are:
- It does not have automatic type classification so you always have to specify types of your declarations
- There is no heap memory allocation - everything is kept on stack
- There are no external named parameters for function calls

Cwift has just one internal function implemented - `print` for printing its content on standard output (it uses `printf` from `libc` under the hood but it is limited for printing only `Int` and `Double` types).

## Building
The project relies on Antlr4. In order to add this dependency please follow up instructions from [Antlr repository](https://github.com/antlr/antlr4/blob/master/doc/swift-target.md).

## Usage
The compiler reads Cwift code a from file and compiles it into Assembly code. After that you can use gcc to compile it to an executable.

Sample script for compilation using `nasm` and `gcc`

    #/bin/sh
    nasm -f macho64 -g $1 && gcc -fno-pie out.o -o out && ./out

It takes name of file with Cwift compiler output code as parameter, compiles it to `out` binary and runs it.

Example: `./compile.sh cwift_output_file`

  ### Example
  Sample code written in Cwift:

    func factorial(n: Int) -> Int {
        var result: Int = 1
        var i: Int = 0
        while (i<n) {
            i = i+1
            result = result*i
        }
        return result
    }

    var i: Int = 1

    while (i < 15) {
        print(factorial(i))
        i = i+1
    }

Here is the output Assembly code the Cwift code above is compiled to:
  <details>
    <summary>Output code</summary>


        extern _printf

        section .data
        fmt_i: db "%ld",10,0
        fmt_f: db "%lf",10,0

        section .text
        global _main

        _main:
        push rbp
        mov rbp, rsp
        sub rsp, 16
        mov rax, 1
        push rax
        lea rax, [rbp-8]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        .L2:
        mov rax, 15
        push rax
        mov rax, qword [rbp-8]
        push rax
        pop rsi
        pop rdi
        cmp rdi, rsi
        jbe .L2_C1_skip
        mov rax, 0
        jmp .L2_C1_exit
        .L2_C1_skip:
        mov rax, 1
        .L2_C1_exit:
        mov rdi, rax
        cmp rdi, 0
        jne .L2_end
        mov rax, qword [rbp-8]
        push rax
        push 16
        call factorial
        add rsp, 16
        push rax
        mov rdi, fmt_i
        pop rsi
        call _printf
        mov rax, 1
        push rax
        mov rax, qword [rbp-8]
        push rax
        pop rdi
        pop rsi
        add rdi, rsi
        mov rax, rdi
        push rax
        lea rax, [rbp-8]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        jmp .L2
        .L2_end:
        ._main_ret:
        add rsp, 16
        pop rbp
        ret

        factorial:
        push rbp
        mov rbp, rsp
        sub rsp, 16
        mov rax, 1
        push rax
        lea rax, [rbp-8]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        mov rax, 0
        push rax
        lea rax, [rbp-16]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        .L1:
        mov rdi, qword [rbp+16]
        mov rax, qword [rbp+rdi+24]
        push rax
        mov rax, qword [rbp-16]
        push rax
        pop rsi
        pop rdi
        cmp rdi, rsi
        jbe .L1_C1_skip
        mov rax, 0
        jmp .L1_C1_exit
        .L1_C1_skip:
        mov rax, 1
        .L1_C1_exit:
        mov rdi, rax
        cmp rdi, 0
        jne .L1_end
        mov rax, 1
        push rax
        mov rax, qword [rbp-16]
        push rax
        pop rdi
        pop rsi
        add rdi, rsi
        mov rax, rdi
        push rax
        lea rax, [rbp-16]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        mov rax, qword [rbp-16]
        push rax
        mov rax, qword [rbp-8]
        push rax
        pop rdi
        pop rsi
        imul rdi, rsi
        mov rax, rdi
        push rax
        lea rax, [rbp-8]
        push rax
        pop rdi
        pop rsi
        mov qword [rdi], rsi
        mov rax, rdi
        jmp .L1
        .L1_end:
        mov rax, qword [rbp-8]
        push rax
        pop rax
        jmp .factorial_ret
        .factorial_ret:
        add rsp, 16
        pop rbp
        ret

  </details>
