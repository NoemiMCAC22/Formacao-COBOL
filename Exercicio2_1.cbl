      ******************************************************************
      * Author:Noemi Correa
      * Date:20220912
      * Purpose:Exercicio2_1
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. EXERCICIO2-1.
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
       01 MINUTOS-ALUNO          PIC  9999.
       01 HORAS-FINAL            PIC 99V99.

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       INICIO.
            DISPLAY "Quantos minutos pretende estudar por dia? ".
            ACCEPT MINUTOS-ALUNO.
            COMPUTE HORAS-FINAL = MINUTOS-ALUNO * 90 / 60.
            DISPLAY "Em 90 dias você terá estudado " HORAS-FINAL" horas".
            STOP RUN.
      ** add other procedures here
       END PROGRAM EXERCICIO2-1.
