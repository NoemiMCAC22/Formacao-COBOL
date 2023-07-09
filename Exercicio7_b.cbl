      ******************************************************************
      * Author:Noemi Correa
      * Date:23/09/2022
      * Purpose:Registo de Vendas Livraria - 7_B
      * Tectonics: cobc
      ******************************************************************
      *Escreva um programa para processar um ficheiro de registo de
      *vendas de uma livraria. O programa deve calcular o montante
      *facturado por livro (não se esqueça de adicionar IVA a 5%),
      *imprimindo em cada linha, a seguinte informação: ISBN, número de
      *unidades vendidas, preço, desconto, valor facturado, e um campo
      *de observações. É ainda necessário verificar que o carácter de
      *controlo do ISBN é realmente um dígito ou a letra X.
      *Caso contrário, o programa deve inscrever no campo de observações
      *uma mensagem de erro apropriada
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       PROGRAM-ID. VENDAS_LIBR.
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
           SELECT LIVROS ASSIGN TO
           'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\livros.txt'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-FS.

           SELECT LIVROSTEMP ASSIGN TO
           'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\livros.txt'
           ORGANIZATION IS SEQUENTIAL.

           SELECT LIVROSOUT ASSIGN TO
           'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\livros.txt'
           ORGANIZATION IS SEQUENTIAL.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       FILE SECTION.
      *------------------------------------
       FD LIVROS.
           01 LIVROS-REG.
               03 LIVROS-TITULO             PIC X(80) VALUES SPACES.
               03 LIVROS-AUTOR              PIC X(30) VALUES SPACES.
               03 LIVROS-EDITO              PIC X(20) VALUES SPACES.
               03 ISBN.
                   05 COD-IDENT             PIC 9(05).
                   05 COD-PAIS              PIC 9(03).
                   05 COD-EDITO             PIC 9(02).
                   05 COD-LIVRO             PIC 9(04).
                   05 COD-CONTRO            PIC X(05).
               03 LIVROS-UNID               PIC 9(04).
               03 LIVROS-VALOR              PIC 99V99.
               03 LIVROS-DESC               PIC 9(02).
               03 LIVRO-TOTAL               PIC 99V99.
               03 VALOR-TOTAL               PIC 99V99.
               03 VALOR-FINAL               PIC 99V99.
               03 LIVROS-OBS                PIC X(80).

       SD LIVROSTEMP.
           01 LIVROSTEMP-REG.
               03 TEMP-LIVRO-TITULO         PIC X(80) VALUES SPACES.
               03 TEMP-LIVRO-AUTOR          PIC X(30) VALUES SPACES.
               03 TEMP-LIVRO-EDITO          PIC X(20) VALUES SPACES.
               03 TEMP-ISBN.
                   05 TEMP-COD-IDENT        PIC 9(05).
                   05 TEMP-COD-PAIS         PIC 9(03).
                   05 TEMP-COD-EDITO        PIC 9(02).
                   05 TEMP-COD-LIVRO        PIC 9(04).
                   05 TEMP-COD-CONTRO       PIC X(05).
               03 TEMP-LIVRO-UNID           PIC 9(04).
               03 TEMP-LIVRO-VALOR          PIC 99V99.
               03 TEMP-LIVRO-DESC           PIC 9(02).
               03 TEMP-LIVRO-TOTAL          PIC 99V99.
               03 TEMP-VALOR-TOTAL          PIC 99V99.
               03 TEMP-VALOR-FINAL          PIC 99V99.
               03 TEMP-LIVROS-OBS           PIC X(80).

       FD LIVROSOUT.
           01 LIVROSOUT-REG.
               03 OUT-LIVRO-TITULO          PIC X(80) VALUES SPACES.
               03 OUT-LIVRO-AUTOR           PIC X(30) VALUES SPACES.
               03 OUT-LIVRO-EDITO           PIC X(20) VALUES SPACES.
               03 OUT-ISBN.
                   05 OUT-COD-IDENT         PIC 9(05).
                   05 OUT-COD-PAIS          PIC 9(03).
                   05 OUT-COD-EDITO         PIC 9(02).
                   05 OUT-COD-LIVRO         PIC 9(04).
                   05 OUT-COD-CONTRO        PIC X(05).
               03 OUT-LIVRO-UNID            PIC 9(04).
               03 OUT-LIVRO-VALOR           PIC 99V99.
               03 OUT-LIVRO-DESC            PIC 9(02).
               03 OUT-LIVRO-TOTAL           PIC 99V99.
               03 OUT-VALOR-TOTAL           PIC 99V99.
               03 OUT-VALOR-FINAL           PIC 99V99.
               03 OUT-LIVROS-OBS            PIC X(80).

       WORKING-STORAGE SECTION.
       77 OPCAO                             PIC  9.
       77 WS-FS                             PIC 99.
       77 WS-ENDOFFILELIVROSOUT             PIC 99.
           01 WS-LIVROSDADOS.
               03 WS-LIVRO-TITULO           PIC X(80) VALUES SPACES.
               03 WS-LIVRO-AUTOR            PIC X(30) VALUES SPACES.
               03 WS-LIVRO-EDITO            PIC X(20) VALUES SPACES.
               03 WS-ISBN.
                   05 WS-COD-IDENT          PIC 9(05).
                   05 WS-COD-PAIS           PIC 9(03).
                   05 WS-COD-EDITO          PIC 9(02).
                   05 WS-COD-LIVRO          PIC 9(04).
                   05 WS-COD-CONTRO         PIC X(05).
               03 WS-LIVRO-UNID             PIC 9(04).
               03 WS-LIVRO-VALOR            PIC 99V99.
               03 WS-LIVRO-DESC             PIC 9(02).
               03 WS-LIVRO-TOTAL            PIC 99V99.
               03 WS-VALOR-TOTAL            PIC 99V99.
               03 WS-VALOR-FINAL            PIC 99V99.
               03 WS-LIVROS-OBS             PIC X(80).

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "--------------------------------"
           DISPLAY " 1 - REGISTAR LIVRO".
           DISPLAY " 2 - LIVROS REGISTADOS".
           DISPLAY " 3 - FINALIZAR".
           ACCEPT OPCAO.
           DISPLAY "---------------------------------"

               IF OPCAO = "1"
               PERFORM REG-LIVROS.

               IF OPCAO = "2"
               PERFORM PRINCIPAL.

               IF OPCAO = "3"
               PERFORM STOP_PROGRAMA.



       STOP_PROGRAMA.
           STOP RUN.

       REG-LIVROS.
           DISPLAY'-------//REGISTO DE LIVROS//-------'.

       SET WS-FS                           TO 0.
       SET WS-ENDOFFILELIVROSOUT           TO 0.

       OPEN EXTEND LIVROS.

       IF WS-FS EQUAL 35 THEN
           OPEN OUTPUT LIVROS
       END-IF.

       IF WS-FS EQUAL ZEROS
           DISPLAY 'TITULO: '
           ACCEPT LIVROS-TITULO
           DISPLAY 'AUTOR: '
           ACCEPT LIVROS-AUTOR
           DISPLAY 'EDITORA: '
           ACCEPT LIVROS-UNID
           DISPLAY 'NUMERO IDENTIFICACAO: '
           ACCEPT COD-IDENT
           DISPLAY 'CODIGO PAIS: '
           ACCEPT COD-PAIS
           DISPLAY 'CODIGO EDITORA: '
           ACCEPT COD-EDITO
           DISPLAY 'CODIGO DO LIVRO: '
           ACCEPT COD-LIVRO
           DISPLAY 'QUANTIDADE DE LIVRO VENDIDO: '
           ACCEPT LIVROS-UNID
           DISPLAY 'VALOR DO LIVRO: '
           ACCEPT LIVROS-VALOR
           DISPLAY 'DESCONTO DADO: '
           ACCEPT LIVROS-DESC
           DISPLAY 'OBSERVACOES: '
           ACCEPT LIVROS-OBS
           DISPLAY 'CARACTER DE CONTROLO ISBN: '
               ACCEPT COD-CONTRO
               IF COD-CONTRO <> 'X'
                DISPLAY ' CARACTER INSERIDO INVALIDO! INSIRA NOVAMENTE.'
                 GO TO INICIO
               ELSE
               ACCEPT COD-CONTRO
               END-IF



           WRITE LIVROS-REG
       IF WS-FS NOT EQUAL ZEROS
           DISPLAY 'NÃO FOI POSSÍVEL REGISTAR O LIVRO'
           DISPLAY 'FILE STATUS: ' WS-FS

       ELSE
           DISPLAY 'LIVRO REGISTADO COM SUCESSO'
       END-IF
           ELSE
           DISPLAY 'ERRO AO CRIAR O ARQUIVO'
           DISPLAY 'FILE STATUS: ' WS-FS
           END-IF

       CLOSE LIVROS.
       GO TO INICIO.

       PRINCIPAL.
           SORT LIVROSTEMP
           ON ASCENDING KEY
                            TEMP-COD-IDENT
                            TEMP-COD-CONTRO
                            TEMP-COD-LIVRO
                            TEMP-LIVRO-TITULO
                            TEMP-LIVRO-AUTOR
                            TEMP-LIVRO-EDITO

           USING LIVROS
           GIVING LIVROSOUT

           DISPLAY ' '
           DISPLAY '------//DADOS INSERIDOS//------'
           OPEN INPUT LIVROSOUT.

       PERFORM UNTIL WS-ENDOFFILELIVROSOUT EQUAL 1
           READ LIVROSOUT INTO WS-LIVROSDADOS
           AT END
           MOVE 1 TO WS-ENDOFFILELIVROSOUT
           NOT AT END



       COMPUTE
        WS-LIVRO-TOTAL = (( WS-LIVRO-VALOR * 0,05) + WS-LIVRO-VALOR)

       COMPUTE
        WS-VALOR-TOTAL = WS-LIVRO-TOTAL *( WS-LIVRO-DESC /100)

       COMPUTE WS-VALOR-FINAL = WS-LIVRO-TOTAL - WS-VALOR-TOTAL

           DISPLAY 'ISBN: ' WS-COD-IDENT
                   ' NUMERO DE UNIDADES VENDIDAS: ' WS-LIVRO-UNID
                   ' PRECO: ' WS-LIVRO-VALOR
                   ' DESCONTO: ' WS-LIVRO-DESC
                   ' VALOR FATURADO POR LIVRO: ' WS-VALOR-FINAL
                   ' OBSERVACOES: ' WS-LIVROS-OBS


           END-READ
       END-PERFORM.
       GOBACK.
       CLOSE LIVROSOUT.
       ENCERRAR.

       STOP RUN.

       END PROGRAM VENDAS_LIBR.
