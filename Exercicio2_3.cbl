      ******************************************************************
      * Author:Noemi Correa
      * Date:20220912
      * Purpose:Exercicio2_3
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. EXERCICIO2-3.
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
       01 NUMERO-UTIL         PIC 9999.
       01 NUMERO-SEG          PIC 9999.
       01 NUMERO-ANT          PIC 9999.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       INICIO-PROGRAMA.

            DISPLAY "Insira um n�mero inteiro: ".
            ACCEPT NUMERO-UTIL.
            COMPUTE NUMERO-SEG = NUMERO-UTIL + 1.
            COMPUTE NUMERO-ANT = NUMERO-UTIL - 1.
            DISPLAY "O n�mero anterior ao inserido �: " NUMERO-ANT.
            DISPLAY "O n�mero seguinte ao inserido �: " NUMERO-SEG.
       STOP RUN.
       END PROGRAM EXERCICIO2-3.
