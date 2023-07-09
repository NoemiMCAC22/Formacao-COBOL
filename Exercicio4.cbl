      ******************************************************************
      * Author:Noemi Correa
      * Date:19/09/2022
      * Purpose:Leitura de uma base de dados.
      * Tectonics: cobc
      ******************************************************************

       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. READ_2.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       FILE-CONTROL.
      *-----------------------
       SELECT INVENTARIO ASSIGN TO
       'D:\UFCD\UFCD 0808 - Programação COBOL\Programas\inventario.txt'
       ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD INVENTARIO.
       01 INVENTARIO-FILE.
           03 COD-ROUPA     PIC 9(05).
           03 NOM-PRODUTO   PIC A(17).
           03 QNT-PRODUTO   PIC X(03).
       WORKING-STORAGE SECTION.
       01 WS-DADOS         PIC X(25) VALUE SPACES.
       01 FILLER REDEFINES WS-DADOS.
           03 WS-COD-ROUPA       PIC 9(05).
           03 WS-NOM-PRODUTO     PIC A(17).
           03 WS-QNT-PRODUTO     PIC X(03).
       77 WS-ENDOFILLE             PIC A  VALUE SPACES.

       PROCEDURE DIVISION.
           MAIN-PROCEDURE.

               OPEN INPUT INVENTARIO.
               PERFORM UNTIL WS-ENDOFILLE= 'F'
                   READ INVENTARIO INTO WS-DADOS
                   AT END MOVE 'F' TO WS-ENDOFILLE
                   NOT AT END
       DISPLAY WS-COD-ROUPA" - "WS-NOM-PRODUTO"- em estoque "
                           WS-QNT-PRODUTO

                   END-READ
               END-PERFORM.
       CLOSE INVENTARIO.
       STOP RUN.
       END PROGRAM READ_2.
