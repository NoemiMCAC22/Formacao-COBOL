      ******************************************************************
      * Author:Noemi Correa
      * Date:20220912
      * Purpose:Exercicio2_2
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. EXERCICIO2-2.
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
       01 ANO-NASCIMENTO       PIC    9999.
       01 ANO-ATUAL            PIC    9999.
       01 IDADE-ANOS           PIC    9999.
       01 IDADE-MESES          PIC    9999.
       01 IDADE-DIAS           PIC 9999999.
       01 IDADE-SEMANAS        PIC 9999999.

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       INICIO-PROGRAMA.

            DISPLAY "Insira seu ano de nascimento: ".
            ACCEPT ANO-NASCIMENTO.
            DISPLAY "Insira o ano atual que se encontra: ".
            ACCEPT ANO-ATUAL.
            COMPUTE IDADE-ANOS = ANO-ATUAL - ANO-NASCIMENTO.
            DISPLAY "Você tem " IDADE-ANOS " anos.".
            COMPUTE IDADE-MESES = IDADE-ANOS * 12.
            DISPLAY "Você tem atualmente " IDADE-MESES " meses".
            COMPUTE IDADE-DIAS = IDADE-MESES * 30.
            DISPLAY "Você tem atualmente " IDADE-DIAS " dias".
            COMPUTE IDADE-SEMANAS = IDADE-MESES * 4.
            DISPLAY "E tem " IDADE-SEMANAS " semanas.".
            STOP RUN.

       END PROGRAM EXERCICIO2-2.
