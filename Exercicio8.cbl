      ******************************************************************
      * Author:Noemi Correa
      * Date:29/09/2022
      * Purpose:Exercicio - Strings
      * Tectonics: cobc
      ******************************************************************
       PROGRAM-ID. DADOS_FUNCIONARIOS.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       FILE SECTION.
      *------------------------------------
       WORKING-STORAGE SECTION.
       77 WS-STRING                  PIC X(1000) VALUE SPACES.
       77 WS-DISPLAY                 PIC X(170) VALUE SPACES.

       01 WS-DADOS-FUNC.
           03 WS-NOME                PIC X(020) VALUE SPACES.
           03 WS-DATA-NASC           PIC X(012) VALUE SPACES.
           03 WS-CATEGORIA           PIC X(018) VALUE SPACES.
           03 WS-SECCAO              PIC X(020) VALUE SPACES.
           03 WS-HORARIO-ENTRA       PIC X(018) VALUE SPACES.
           03 WS-HORARIO-SAI         PIC X(018) VALUE SPACES.
           03 WS-HORARIO-ALMOCO      PIC X(025) VALUE SPACES.
           03 WS-TOTAL-HORA          PIC X(018) VALUE SPACES.
           03 WS-REMUN               PIC X(020) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 'FERNANDA SOUZA'             TO WS-NOME
           MOVE '29/09/1991 '                TO WS-DATA-NASC
           MOVE ' ASSISTENTE '               TO WS-CATEGORIA
           MOVE 'RECURSOS HUMANOS '          TO WS-SECCAO
           MOVE 'REMUNERACAO: 950EUR'        TO WS-REMUN
           MOVE 'ENTRADA: 08H00'             TO WS-HORARIO-ENTRA
           MOVE 'SAIDA: 17H00'               TO WS-HORARIO-SAI
           MOVE 'ALOMOCO: 12H30 AS 14H00 '   TO WS-HORARIO-ALMOCO
           MOVE '40H SEMANAIS '              TO WS-TOTAL-HORA



       INITIALISE WS-DISPLAY
           STRING WS-DADOS-FUNC
               DELIMITED BY SIZE INTO WS-DISPLAY
           END-STRING.

       DISPLAY 'DADOS FUNCIONARIOS: ' WS-DISPLAY.

          STOP RUN.
       END PROGRAM DADOS_FUNCIONARIOS.
