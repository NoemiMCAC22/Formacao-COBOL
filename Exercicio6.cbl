      ******************************************************************
      * Author:Noemi Correa
      * Date:22/09/2022
      * Purpose:Programa Fatura
      * Tectonics: cobc
      ******************************************************************
      *Programa que vai receber os dados para uma fatura e a fará a
      * impressão desses dados ordenado no ecrã!
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       PROGRAM-ID.FATURA_CLIENTE.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *----------------------
       FILE-CONTROL.
           SELECT FATURA ASSIGN TO
       'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\fatura.txt'
       ORGANIZATION SEQUENTIAL.
           SELECT FATURATEMP ASSIGN TO
       'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\faturatemp.txt'
           ORGANIZATION SEQUENTIAL.
           SELECT FATURAOUT ASSIGN TO
       'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\faturaout.txt'
           ORGANIZATION SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.

       FD FATURA.
           01 FAT-DADOS.
               03 COD-PRODUTO                        PIC 9(03).
               03 DESC-PRODUTO                       PIC X(20).
               03 PREC-PRODUTO                       PIC 99V99.
               03 QUANT-PRODUTO                      PIC 9(05).
               03 TOTAL-PRODUTO                      PIC 99V99.

       SD FATURATEMP.
           01 FATURATEMP-DADOS.
               03 TEMP-COD-PRODUTO                   PIC 9(03).
               03 TEMP-DESC-PRODUTO                  PIC X(20).
               03 TEMP-PREC-PRODUTO                  PIC 99V99.
               03 TEMP-QUANT-PRODUTO                 PIC 9(05).
               03 TEMP-TOTAL-PRODUTO                 PIC 99V99.

       FD FATURAOUT.
           01 FATURAOUT-DADOS.
               03 OUT-COD-PRODUTO                   PIC 9(03).
               03 OUT-DESC-PRODUTO                  PIC X(20).
               03 OUT-PREC-PRODUTO                  PIC 99V99.
               03 OUT-QUANT-PRODUTO                 PIC 9(05).
               03 OUT-TOTAL-PRODUTO                 PIC 99V99.

       01 FATURA-CSV                                PIC X(28).

       WORKING-STORAGE SECTION.
       77 WS-FS                                     PIC 99.
       77 WS-ENDOFFILEFATURAOUT                     PIC 99.
           01 WS-DADOSFAT.
               03 WS-COD-PRODUTO                    PIC 9(03).
               03 WS-DESC-PRODUTO                   PIC X(20).
               03 WS-PREC-PRODUTO                   PIC 99V99.
               03 WS-QUANT-PRODUTO                  PIC 9(05).
               03 WS-TOTAL-PRODUTO                  PIC 99V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       DISPLAY'-------DADOS FATURA-------'.

       SET WS-FS               TO 0.
       OPEN EXTEND FATURA

       IF WS-FS EQUAL 35 THEN

       OPEN OUTPUT FATURA
       END-IF.
       MOVE 'I'                TO WS-ENDOFFILEFATURAOUT
       IF WS-FS EQUAL ZEROS
       PERFORM UNTIL WS-ENDOFFILEFATURAOUT = 'F' OR 'f'
           DISPLAY 'INSIRA O CODIGO DO PRODUTO: '
           ACCEPT COD-PRODUTO
           DISPLAY 'INSIRA OS DADOS DO PRODUTO: '
           ACCEPT DESC-PRODUTO
           DISPLAY 'INSIRA O VALOR DO PRODUTO: '
           ACCEPT PREC-PRODUTO
           DISPLAY 'INSIRA A QUANTIDADE DO PRODUTO: '
           ACCEPT QUANT-PRODUTO
           COMPUTE TOTAL-PRODUTO = PREC-PRODUTO * QUANT-PRODUTO
           ACCEPT TOTAL-PRODUTO

           MOVE WS-FS TO WS-ENDOFFILEFATURAOUT

           WRITE FAT-DADOS

           DISPLAY 'DADOS DE FATURA INSERIDO COM SUCESSO'

           DISPLAY 'APERTE  <F> PARA FINALIZAR '
           ACCEPT WS-ENDOFFILEFATURAOUT

       END-PERFORM.

       CLOSE FATURA.


       0-PRINCIPAL.
           SORT FATURATEMP
           ON ASCENDING KEY
                            TEMP-COD-PRODUTO
                            TEMP-DESC-PRODUTO
                            TEMP-PREC-PRODUTO
                            TEMP-QUANT-PRODUTO
                            TEMP-TOTAL-PRODUTO
           USING FATURA
           GIVING FATURAOUT

           DISPLAY ' '
           DISPLAY '----DADOS SEQUENCIAL DA FATURA----'
           OPEN INPUT FATURAOUT.

       PERFORM UNTIL WS-ENDOFFILEFATURAOUT EQUAL 1
           READ FATURAOUT INTO WS-DADOSFAT
           AT END
           MOVE 1 TO WS-ENDOFFILEFATURAOUT
           NOT AT END
           DISPLAY 'CODIGO PRODUTO: ' WS-COD-PRODUTO
                   ' DADOS PRODUTO: ' WS-DESC-PRODUTO
                   ' VALOR PRODUTO: ' WS-PREC-PRODUTO
                   ' QUANTIDADE DO PRODUTO: 'WS-QUANT-PRODUTO
                   ' VALOR TOTAL: 'WS-TOTAL-PRODUTO


           END-READ
       END-PERFORM.
       GOBACK.
       CLOSE FATURAOUT.

       STOP RUN.

       END PROGRAM FATURA_CLIENTE.
