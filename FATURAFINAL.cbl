      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
        IDENTIFICATION DIVISION.
       PROGRAM-ID. LER_ORDENAR.
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT FATURAS ASSIGN TO
           'C:/Users/oeira/Downloads/FATURAS.txt'
           ORGANIZATION  SEQUENTIAL.
           SELECT FATURASTEMP ASSIGN TO
           'C:/Users/oeira/Downloads/FATURASTEMP.txt'
           ORGANIZATION  SEQUENTIAL.
           SELECT FATURASOUT ASSIGN TO
            'C:/Users/oeira/Downloads/FATURASOUT.txt'
           ORGANIZATION SEQUENTIAL.
           DATA DIVISION.
           FILE SECTION.
       FD FATURAS.
             01 REG-PRODUTO.
               03 ID-PRODUTO          PIC  9(03).
               03 NOME-PRODUTO        PIC  X(28).
               03 QUANT-PRODUTO       PIC  9(05).
               03 PRECO-PRODUTO       PIC  99V99.
               03 VALOR-TOTAL         PIC  99V99.

           SD FATURASTEMP.
            01 FATURASTEMP-DADOS.
               03 TEMP-ID-PRODUTO          PIC  9(03).
               03 TEMP-NOME-PRODUTO        PIC  X(28).
               03 TEMP-QUANT-PRODUTO       PIC  9(05).
               03 TEMP-PRECO-PRODUTO       PIC  99V99.
               03 TEMP-VALOR-TOTAL         PIC  99V99.



           FD  FATURASOUT.
           01 FATURASOUT-DADOS.
               03 OUT-ID-PRODUTO          PIC  9(03).
               03 OUT-NOME-PRODUTO        PIC  X(28).
               03 OUT-QUANT-PRODUTO       PIC  9(05).
               03 OUT-PRECO-PRODUTO       PIC  99V99.
               03 OUT-VALOR-TOTAL         PIC  99V99.

       WORKING-STORAGE SECTION.
       77 WS-FS                           PIC 99.

       77 WS-ENDOFFILEFATURASOUT              PIC 99.
          01 WS-DADOSOUT.
               03 WS-ID-PRODUTO          PIC  9(03).
               03 WS-NOME-PRODUTO        PIC  X(28).
               03 WS-QUANT-PRODUTO       PIC  9(05).
               03 WS-PRECO-PRODUTO       PIC  99V99.
               03 WS-VALOR-TOTAL         PIC  99V99.

       PROCEDURE DIVISION.
       0-PRINCIPAL.
           SORT FATURASTEMP
           ON ASCENDING KEY TEMP-ID-PRODUTO
                            TEMP-NOME-PRODUTO
                            TEMP-QUANT-PRODUTO
                            TEMP-PRECO-PRODUTO
                            TEMP-VALOR-TOTAL
           USING FATURAS
           GIVING FATURASOUT

           DISPLAY" "
           DISPLAY"*********LISTA ORDENADA DOS PRODUTOS**********"
           OPEN INPUT FATURASOUT.
              PERFORM UNTIL WS-ENDOFFILEFATURASOUT NOT EQUAL 1
              READ FATURASOUT INTO WS-DADOSOUT
              AT END
              MOVE 1 TO WS-ENDOFFILEFATURASOUT
              NOT AT END
           COMPUTE WS-VALOR-TOTAL = WS-PRECO-PRODUTO * WS-QUANT-PRODUTO
                DISPLAY" CODIGO DO PRODUTO: " WS-ID-PRODUTO
                       " NOME PRODUTO: " WS-NOME-PRODUTO
                       " QUANTIDADE DO PRODUTO: " WS-QUANT-PRODUTO
                       " PRECO DO PRODUTO: " WS-PRECO-PRODUTO
                       " VALOR TOTAL DE FATURA: " WS-VALOR-TOTAL
            END-READ
            END-PERFORM
            CLOSE FATURASOUT


            STOP RUN.
       END PROGRAM LER_ORDENAR.
