HSerializedBuffer�� EventHandler�� Cursor�� ModTime��   8��EventHandler�� 	UndoStack�� 	RedoStack��   '��TEStack�� Top�� Size   *��Element�� Value�� Next��   B��	TextEvent�� C�� 	EventType Deltas�� Time��   Z��Cursor�� Loc�� LastVisualX CurSelection�� OrigSelection�� Num   ��Loc�� X Y   ��[2]buffer.Loc�� ��  ��[]buffer.Delta�� ��  0��Delta�� Text
 Start�� End��   ��Time��   �)��      �ifrom pytamaro.it import rettangolo, nero, rosso, verde, sopra, sovrapponi, settore_circolare, visualizza_grafica, grafica_vuota

posso_passare = 1

larghezza_semaforo = 40
lunghezza_semaforo = 120

background = rettangolo(larghezza_semaforo, lunghezza_semaforo, nero)

semaforo = grafica_vuota()

if posso_passare == 1:
    lista_colori=[nero, nero, verde]
    for colore in lista_colori:
        cerchio = settore_circolare(18, 360, colore)
        semaforo = sovrapponi(background, cerchio)

elif posso_passare == 2:
    lista_colori=[nero, giallo, nero]
    for colore in lista_colori:
        cerchio = settore_circolare(18, 360, colore)
        semaforo = sovrapponi(background, cerchio)

else: 
    lista_colori=[rosso, nero, nero]
    for colore in lista_colori:
        cerchio = settore_circolare(18, 360, colore)
        semaforo = sovrapponi(background, cerchio) d6     ��
�.ω( x       ¨      ��
�4h@ x       ¨      ��
�+.� x       b6    ��
�
��� x 