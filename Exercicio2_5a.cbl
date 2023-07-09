       ******************************************************************
      * Author:Noemi Correa
      * Date:20220912
      * Purpose:Exercicio2_5
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. EXERCICIO2-5.
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
       01 DATA-UTIL           PIC    X(8).
       01 NOME-UTIL           PIC  X(25).
       01 IDADE-UTIL          PIC     99.
       01 ANO-SERV            PIC     99.
       01 FILHOS              PIC     99.
       01 BONUS-5E            PIC IS  99V99.
       01 BONUS-10E           PIC IS  99V99.
       01 BONUS-20E           PIC IS  99V99.
       01 BONUS-25E           PIC IS  99V99.
       01 BONUS-75E           PIC IS  99V99.
       01 BONUS-FINAL         PIC IS  99V99.

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.

           INICIO-PROGRAMA.
            DISPLAY "Data: "
            ACCEPT DATA-UTIL.
            DISPLAY "Nome: "
            ACCEPT NOME-UTIL.

            IDADE.
            DISPLAY "Idade: "
            ACCEPT IDADE-UTIL.
            IF IDADE-UTIL < 18 OR IDADE-UTIL > 65
                DISPLAY "Não é elegível ao recebimento do bónus!"
                GO TO IDADE.
            ANO.
            DISPLAY "Anos de serviço: "
            ACCEPT ANO-SERV.
            IF ANO-SERV > IDADE-UTIL
                DISPLAY "O tempo de serviço superior a idade!"
                GO TO ANO.

            DISPLAY "Nº de Filhos: "
            ACCEPT FILHOS.

       CALCULAR-BONUS.

           IF IDADE-UTIL > 45 THEN
               COMPUTE BONUS-5E = (IDADE-UTIL - 45 ) * 5.
               DISPLAY BONUS-5E.

           IF ANO-SERV <= 10 THEN
              COMPUTE BONUS-10E = ANO-SERV * 10
              DISPLAY BONUS-10E
           ELSE
               COMPUTE BONUS-20E = BONUS-10E + ((ANO-SERV - 10) * 20).
               DISPLAY BONUS-20E.
           IF FILHOS <= 3 THEN
               COMPUTE BONUS-25E = 25 * FILHOS
               DISPLAY BONUS-25E
           ELSE
               COMPUTE BONUS-75E = 75
               DISPLAY BONUS-75E
           END-IF.

           COMPUTE BONUS-FINAL = BONUS-5E + BONUS-10E + BONUS-20E +
           BONUS-25E + BONUS-75E.
           DISPLAY "Bónus a Receber: " BONUS-FINAL "€".

            STOP RUN.

       END PROGRAM EXERCICIO2-5.
