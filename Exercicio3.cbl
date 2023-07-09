      ******************************************************************
      * Author:Noemi Correa
      * Date:20220916
      * Purpose:Exercicio3
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       AUTHOR. NOEMI CORREA.
       INSTALLATION. CONTAS GAS LDA.
       PROGRAM-ID. CONSUMO-GAS.
       DATE-WRITTEN. 01 JANEIRO 2022.
       DATE-COMPILED. 01 DEZEMBRO 2022.
       SECURITY. PRIVADO.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      * Esse programa imprime as respectivas faturas referente ao mês
      *  do no corrente.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *-----------------------
       SOURCE-COMPUTER.
           NEXTSTATION.
      *-----------------------
       OBJECT-COMPUTER.
          CORREA-PC.
      *-----------------------
       INPUT-OUTPUT SECTION.
         FILE-CONTROL.
            SELECT FICH-FATURA-ANO
               ASSIGN TO DISK.
            SELECT FICH-FATURA-MES
               ASSIGN TO DISK.
