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
       01 DATA-UTIL           PIC   X(8).
       01 NOME-UTIL           PIC  X(25).
       01 IDADE-UTIL          PIC     99.
       01 ANO-SERV            PIC     99.
       01 FILHOS              PIC     99.
       01 BONUS-FINAL         PIC     9(05) VALUE ZEROS.

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
               COMPUTE BONUS-FINAL = (IDADE-UTIL - 45 ) * 5.


           IF ANO-SERV > 10 THEN
               COMPUTE BONUS-FINAL = BONUS-FINAL + (10 * 10) +
               ((ANO-SERV - 10)* 20)

           ELSE
               COMPUTE BONUS-FINAL = ANO-SERV * 10.

           IF FILHOS > 3 THEN
               COMPUTE BONUS-FINAL =  BONUS-FINAL + 75

           ELSE
               COMPUTE BONUS-FINAL = BONUS-FINAL + ( FILHOS * 25)

           END-IF.

           DISPLAY "Bónus a Receber: " BONUS-FINAL "€".

            STOP RUN.

       END PROGRAM EXERCICIO2-5.
