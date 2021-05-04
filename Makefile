##
## EPITECH PROJECT, 2020
## pong
## File description:
## Makefile
##

PRJ	=	109titration

all	:
	cp 109titration.py $(PRJ)
	chmod +x $(PRJ)

clean	:
	rm $(PRJ)

fclean	:	clean

re	:	all