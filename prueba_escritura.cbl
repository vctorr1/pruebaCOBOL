      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-FILE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUTPUT-FILE ASSIGN TO "prueba.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.
       DATA DIVISION.
       FILE SECTION.
       FD OUTPUT-FILE.
       01 OUTPUT-LINE PIC X(50).
       WORKING-STORAGE SECTION.
       01 WS-MESSAGE PIC X(50) VALUE "Prueba de escritura".
       01 WS-FILE-STATUS PIC X(2).
       01 WS-DISPLAY-MESSAGE PIC X(100).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN OUTPUT OUTPUT-FILE
           IF WS-FILE-STATUS = "00"
               MOVE WS-MESSAGE TO OUTPUT-LINE
               WRITE OUTPUT-LINE
               CLOSE OUTPUT-FILE
               IF WS-FILE-STATUS = "00"
                   MOVE "La operación se ha realizado con éxito."
                       TO WS-DISPLAY-MESSAGE
               ELSE
                   MOVE "Error al cerrar el archivo."
                       TO WS-DISPLAY-MESSAGE
               END-IF
           ELSE
               MOVE "Error al abrir el archivo." TO WS-DISPLAY-MESSAGE
           END-IF.
           DISPLAY WS-DISPLAY-MESSAGE.
           STOP RUN.
