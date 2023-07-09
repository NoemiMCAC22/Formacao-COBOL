      ******************************************************************
      * Author:Noemi Correa
      * Date:23/09/2022
      * Purpose:Programa Gestão de Vendas 7_A
      * Tectonics: cobc
      ******************************************************************
      *Escreva a DATA DIVISION de um programa de gestão de vendas que
      *aceite como um input um ficheiro de registos O programa deve
      *produzir um output impresso. São ainda necessárias duas variáveis
      *intermédias, uma para conter a importância total sem IVA e outra
      *para indicar se ainda existem ou não registos para ler no
      *ficheirode input
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       PROGRAM-ID. GESTAO_VENDAS.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       INPUT-OUTPUT SECTION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       FILE-CONTROL.
           SELECT VENDAS ASSIGN TO
           'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\vendas.txt'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-FS.

           SELECT VENDASTEMP ASSIGN TO
        'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\vendastemp.txt'
           ORGANIZATION IS SEQUENTIAL.

           SELECT VENDASOUT ASSIGN TO
         'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\vendasout.txt'
           ORGANIZATION IS SEQUENTIAL.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       FILE SECTION.
      *------------------------------------
       FD VENDAS.
           01 VENDAS-DADOS.
               03 NOME-ARTIGO              PIC X(34) VALUES SPACES.
               03 QUANT-ARTIGO             PIC 9(03) VALUE ZEROS.
               03 UNIT-ARTIGO              PIC 9(05)V9(02) VALUE ZEROS.
               03 IVA-ARTIGO               PIC 9(02)  VALUES ZEROS.
               03 TOTALIVA-ARTIGO          PIC 9(05)V9(02) VALUE ZEROS.
               03 TOTALSIVA-ARTIGO         PIC 9(05)V9(02) VALUE ZEROS.
               03 TOTAL-ARTIGO             PIC 9(05)V9(02) VALUE ZEROS.



       SD VENDASTEMP.
           01 VENDASTEMP-DADOS.
               03 TEMP-NOME-ARTIGO         PIC X(34)  VALUES SPACES.
               03 TEMP-QUANT-ARTIGO        PIC 9(03) VALUE ZEROS.
               03 TEMP-UNIT-ARTIGO         PIC 9(05)V9(02) VALUE ZEROS.
               03 TEMP-IVA-ARTIGO          PIC 9(02)  VALUE ZEROS.
               03 TEMP-TOTALIVA-ARTIGO     PIC 9(05)V9(02) VALUE ZEROS.
               03 TEMP-TOTALSIVA-ARTIGO    PIC 9(05)V9(02) VALUE ZEROS.
               03 TEMP-TOTAL-ARTIGO        PIC 9(05)V9(02) VALUE ZEROS.

       FD VENDASOUT.
           01 VENDASOUT-DADOS.
               03 OUT-NOME-ARTIGO         PIC X(34)  VALUES SPACES.
               03 OUT-QUANT-ARTIGO        PIC 9(03) VALUE ZEROS.
               03 OUT-UNIT-ARTIGO         PIC 9(05)V9(02) VALUE ZEROS.
               03 OUT-IVA-ARTIGO          PIC 9(02)  VALUES ZEROS.
               03 OUT-TOTALIVA-ARTIGO     PIC 9(05)V9(02) VALUE ZEROS.
               03 OUT-TOTALSIVA-ARTIGO    PIC 9(05)V9(02) VALUE ZEROS.
               03 OUT-TOTAL-ARTIGO        PIC 9(05)V9(02) VALUE ZEROS.

       WORKING-STORAGE SECTION.
       77 WS-FS                                     PIC 99.
       77 WS-ENDOFFILEVENDASOUT                     PIC 99.
       77 OPCAO                                     PIC 9.
           01 WS-DADOSVENDAS.
               03 WS-NOME-ARTIGO         PIC X(34)  VALUES SPACES.
               03 WS-QUANT-ARTIGO        PIC 9(03) VALUE ZEROS.
               03 WS-UNIT-ARTIGO         PIC 9(05)V9(02) VALUE ZEROS.
               03 WS-IVA-ARTIGO          PIC 9(02)  VALUES ZEROS.
               03 WS-TOTALIVA-ARTIGO     PIC 9(05)V9(02) VALUE ZEROS.
               03 WS-TOTALSIVA-ARTIGO    PIC 9(05)V9(02) VALUE ZEROS.
               03 WS-TOTAL-ARTIGO        PIC 9(05)V9(02) VALUE ZEROS.

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY " 1 - INSERIR DADOS DOS ARTIGOS".
           DISPLAY " 2 - LISTAR DADOS".
           DISPLAY " 3 - FINALIZAR".
           ACCEPT OPCAO.
           DISPLAY '------------------------------- '

               IF OPCAO = "1"
               PERFORM INSERIR-DADOS.

               IF OPCAO = "2"
               PERFORM PRINCIPAL.


               IF OPCAO = "3"
               PERFORM STOP_PROGRAMA.



       STOP_PROGRAMA.
           STOP RUN.

       INSERIR-DADOS.

       DISPLAY'-------GESTAO DE VENDAS-------'.

       SET WS-FS                           TO 0.
       SET WS-ENDOFFILEVENDASOUT           TO 0.

       OPEN EXTEND VENDAS.

       IF WS-FS EQUAL 35 THEN
           OPEN OUTPUT VENDAS
       END-IF.

       IF WS-FS EQUAL ZEROS
           DISPLAY 'NOME DO ARTIGO: '
           ACCEPT NOME-ARTIGO
           DISPLAY 'QUANTIDADE: '
           ACCEPT QUANT-ARTIGO
           DISPLAY 'VALOR UNITARIO: '
           ACCEPT UNIT-ARTIGO
           DISPLAY 'TAXA DE IVA APLICAVEL: '
           ACCEPT IVA-ARTIGO


           WRITE VENDAS-DADOS
       IF WS-FS NOT EQUAL ZEROS
           DISPLAY 'NÃO FOI POSSÍVEL REGISTAR DADOS'
           DISPLAY 'FILE STATUS: ' WS-FS

       ELSE
           DISPLAY 'DADOS REGISTADO COM SUCESSO'
       END-IF
           ELSE
           DISPLAY 'ERRO AO CRIAR O ARQUIVO'
           DISPLAY 'FILE STATUS: ' WS-FS
           END-IF

       CLOSE VENDAS.
       GO TO INICIO.

       PRINCIPAL.
           SORT VENDASTEMP
           ON ASCENDING KEY
                            TEMP-QUANT-ARTIGO
                            TEMP-UNIT-ARTIGO
                            TEMP-IVA-ARTIGO
                            TEMP-TOTALIVA-ARTIGO
                            TEMP-TOTALSIVA-ARTIGO
                            TEMP-TOTAL-ARTIGO
           USING VENDAS
           GIVING VENDASOUT

           DISPLAY ' '
           DISPLAY '----DADOS INSERIDOS----'
           OPEN INPUT VENDASOUT.

       PERFORM UNTIL WS-ENDOFFILEVENDASOUT EQUAL 1
           READ VENDASOUT INTO WS-DADOSVENDAS
           AT END
           MOVE 1 TO WS-ENDOFFILEVENDASOUT
           NOT AT END
       COMPUTE WS-TOTALSIVA-ARTIGO = (WS-QUANT-ARTIGO * WS-UNIT-ARTIGO)
       COMPUTE
        WS-TOTALIVA-ARTIGO = ((WS-TOTALSIVA-ARTIGO * WS-IVA-ARTIGO)/100)
       COMPUTE
       WS-TOTAL-ARTIGO = WS-TOTALIVA-ARTIGO + WS-TOTALSIVA-ARTIGO

           DISPLAY 'NOME DO ARTIGO: ' WS-NOME-ARTIGO
                   ' QUANTIDADE: ' WS-QUANT-ARTIGO
                   ' VALOR UNITARIO: ' WS-UNIT-ARTIGO
                   ' TAXA DE IVA APLICAVEL: ' WS-IVA-ARTIGO
                   ' VALOR TOTAL SEM IVA: ' WS-TOTALSIVA-ARTIGO
                   ' VALOR TOTAL DO ARTIGO: ' WS-TOTAL-ARTIGO


           END-READ
       END-PERFORM.
       GOBACK.
       CLOSE VENDASOUT.
       ENCERRAR.

       STOP RUN.

       END PROGRAM GESTAO_VENDAS.
