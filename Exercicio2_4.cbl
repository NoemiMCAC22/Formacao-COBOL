      ******************************************************************
      * Author:Noemi Correa
      * Date:20220912
      * Purpose:Exercicio2_4
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. EXERCICIO2-4.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 NUM1         PIC    999.
       01 NUM2         PIC    999.
       01 SOMA         PIC    999.
       01 SUB          PIC    999.
       01 MULT         PIC    999.
       01 DIV          PIC     99.
       01 DIVISOR      PIC     99.
       01 QUOC         PIC    999.
       01 RESTO        PIC    999.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       INICIO-PROGRAMA.

            DISPLAY "Insira o primeiro número inteiro: ".
            ACCEPT NUM1.
            DISPLAY "Insira o segundo número inteiro: ".
            ACCEPT NUM2.
            COMPUTE SOMA = NUM1 + NUM2.
            DISPLAY "Soma = " NUM1"+"NUM2"= " SOMA.
            COMPUTE SUB = NUM1 - NUM2.
            DISPLAY "Subtração: " NUM1 " - " NUM2 " = " SUB.
            COMPUTE MULT= NUM1 * NUM2.
            DISPLAY "Multiplicação: " NUM1 " * " NUM2 " = " MULT.
            COMPUTE DIV = NUM1.
            DISPLAY "Dividendo: " DIV.
            COMPUTE DIVISOR = NUM2.
            DISPLAY "Divisor: " DIVISOR.
            COMPUTE QUOC = NUM1 / NUM2.
            DISPLAY "Quociente: " QUOC.
            COMPUTE RESTO =(QUOC * NUM2)-NUM1.
            DISPLAY "Resto: " RESTO.


            STOP RUN.

       END PROGRAM EXERCICIO2-4.
