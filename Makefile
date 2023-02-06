# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: victofer <victofer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/15 10:38:55 by victofer          #+#    #+#              #
#    Updated: 2023/02/06 11:07:20 by victofer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror
NAME = minitalk

SRC = client_dir/client.c server_dir/server.c
SRC_BONUS = client_dir/client_bonus.c server_dir/server_bonus.c
OBJS = $(SRC:.c = .o)

GREEN=\033[0;32m
RED=\033[0;31m
BLUE=\033[0;34m
YELLOW = \033[0;93m
MAGENTA = \033[0;95m
END=\033[0m


all: nice_text makelibs $(NAME)

$(NAME): $(OBJS)
	@echo "$(YELLOW)0---------- COMPILING -----------0$(END)"
	@ar -rc $(NAME) $(OBJS)
	@$(CC) $(CFLAGS) libft/libft.a server_dir/server.c -o server
	@$(CC) $(CFLAGS) libft/libft.a client_dir/client.c -o client
	@echo "$(YELLOW)| $(GREEN)Minitalk compiled successfully $(YELLOW)|$(END)"
	@echo "$(YELLOW)|          $(GREEN)server created $(YELLOW)       |$(END)"
	@echo "$(YELLOW)|          $(GREEN)client crated $(YELLOW)        |$(END)"
	@echo "$(YELLOW)0--------------------------------0$(END)"

nice_text:
	@echo "$(YELLOW)"
	@echo "MM    MM IIIII NN   NN IIIII TTTTTTT   AAA   LL      KK  KK"
	@echo "MMM  MMM  III  NNN  NN  III    TTT    AAAAA  LL      KK KK  "
	@echo "MM MM MM  III  NN N NN  III    TTT   AA   AA LL      KKKK"
	@echo "MM    MM  III  NN  NNN  III    TTT   AAAAAAA LL      KK KK"
	@echo "MM    MM IIIII NN   NN IIIII   TTT   AA   AA LLLLLLL KK  KK"
	@echo " "

makelibs:
	@echo ""
	@echo "$(YELLOW)0------ COMPILING LIBS -------0$(END)"
	@make -C ./libft all
	@echo "$(YELLOW)|       $(GREEN)Libft compiled        $(YELLOW)|"
	@echo "$(YELLOW)0-----------------------------0 $(END)"
	@echo "$(END)"


bonus: all
	@echo "$(YELLOW)0----------- COMPILING BONUS -----------0$(END)"
	@$(CC) $(CFLAGS) libft/libft.a server_dir/server_bonus.c -o server_bonus
	@$(CC) $(CFLAGS) libft/libft.a client_dir/client_bonus.c -o client_bonus
	@echo "$(YELLOW)| $(GREEN)Minitalk (Bonus) compiled succesfully $(YELLOW)|$(END)"
	@echo "$(YELLOW)|          $(GREEN)server_bonus created $(YELLOW)        |$(END)"
	@echo "$(YELLOW)|          $(GREEN)client_bonus crated $(YELLOW)         |$(END)"
	@echo "$(YELLOW)0---------------------------------------0$(END)"

clean:
	@echo "$(YELLOW)------------- CLEANING --------------$(END)"
	@cd libft && make clean
	@rm -rf server_dir/server.o
	@rm -rf cllient_dir/client.o
	@rm -rf server_dir/server_bonus.o
	@rm -rf cllient_dir/client_bonus.o
	@rm -rf ./minitalk
	@rm -rf *.dSYM
	@echo "$(YELLOW)| $(MAGENTA)Everything from minitalk cleaned  $(YELLOW)|$(END)"
	@echo "$(YELLOW)-------------------------------------$(END)"
	
fclean: clean
	@rm -rf server	
	@rm -rf client
	@rm -rf server_bonus	
	@rm -rf client_bonus

.PHONY: clean fclean all re