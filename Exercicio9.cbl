      ******************************************************************
      * Author:Noemi Correa
      * Date:07/10/2022
      * Purpose:Exercício 9 - INSPECT
      * Tectonics: cobc
      ******************************************************************
       PROGRAM-ID. EXERCICIO9_INSPECT.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       INPUT-OUTPUT SECTION.
      *-----------------------
       FILE-CONTROL.
           SELECT POEMA ASSIGN TO
           'D:\UFCD\UFCD 0808 - Programação COBOL\Tarefas\poema.txt'
           ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
       FILE SECTION.

       FD POEMA.
       01 WS-POEMA                 PIC X(800).

      *------------------------------------

       WORKING-STORAGE SECTION.

       01 WS-CONTADORES.
           03 WS-CONT-1                PIC 9999.
           03 WS-CONT-2                PIC 9999.
           03 WS-CONT-3                PIC 9999.
           03 WS-CONT-4                PIC 9999.
           03 WS-CONT-5                PIC 9999.
           03 WS-CONT-6                PIC 9999.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       OPEN INPUT POEMA.

       READ POEMA.

       DISPLAY WS-POEMA

      *****ALTERAR TODA AS LETRAS 'E' POR UMA LETRA À VOSSA ESCOLHA*****

       INITIALIZE WS-CONTADORES

       DISPLAY ' '
       DISPLAY 'TROCAR [E] POR [M]: '
       INSPECT WS-POEMA REPLACING ALL 'E' BY 'M'
       DISPLAY WS-POEMA

      ***********CONTAR TODOS AS LETRAS DO TEXTO************************
       INITIALIZE WS-CONTADORES

       INSPECT WS-POEMA TALLYING WS-CONT-1 FOR CHARACTERS

       DISPLAY ' '
       DISPLAY 'QUANTIDADE DE LETRAS NO TEXTO: 'WS-CONT-1

      ***CONTAR QUANTAS PALAVRAS "ESPERANÇAS" ESTÃO PRESENTES NO TEXTO***

       INITIALIZE WS-CONTADORES

       INSPECT WS-POEMA TALLYING WS-CONT-2 FOR ALL 'esperancas'

       DISPLAY ' '
       DISPLAY 'QUANTIDADE DE PALAVRA ESPERANCAS TEXTO: 'WS-CONT-2

      ****ALTERAR AS DUAS ULTIMAS FRASES PRESENTES NO TEXTO DE ORDEM****

       INITIALIZE WS-CONTADORES


       DISPLAY ' '
       DISPLAY 'ALTERAR AS DUAS ULTIMAS FRASES PRESENTES NO TEXTO'
       'DE ORDEM'

       INSPECT WS-POEMA REPLACING ALL

       'Quando vim a ter esperancas, ja nao sabia ter esperancas.'

                               BY
       'Quando vim a olhar para a vida, perdera o sentido da vida',
       'Quando vim a olhar para a vida, perdera o sentido da vida'
                               BY
       'Quando vim a ter esperancas, ja nao sabia ter esperancas.'



       DISPLAY ' '
       DISPLAY 'NOVA FRASE: ' WS-POEMA

      *********ALTERAR TODO O CONJUNTO DE 'SA' POR 'ZA'*****************

       INITIALIZE WS-CONTADORES
       DISPLAY' '
       DISPLAY 'TROCAR [sa] POR [za]: '
           INSPECT WS-POEMA REPLACING ALL 'sa' BY 'za'
           DISPLAY ' '
           DISPLAY WS-POEMA
           DISPLAY 'POR NOEMI CORREA'

           STOP RUN.
       END PROGRAM EXERCICIO9_INSPECT.
