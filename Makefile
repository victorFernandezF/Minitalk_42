# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: victofer <victofer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/15 10:38:55 by victofer          #+#    #+#              #
#    Updated: 2022/11/18 11:01:35 by victofer         ###   ########.fr        #
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

$(NAME): $(OBJS)
	@echo "$(YELLOW)----------- COMPILING ------------$(END)"
	@make -sC ./libft
	@ar -rc $(NAME) $(OBJS)
	@$(CC) $(CFLAGS) libft/libft.a server_dir/server.c -o server
	@$(CC) $(CFLAGS) libft/libft.a client_dir/client.c -o client
	@echo "$(YELLOW)| $(GREEN)Minitalk compiled successfully $(YELLOW)|$(END)"
	@echo "$(YELLOW)----------------------------------$(END)"
	
all: $(NAME)

re: fclean all

bonus: all
	@echo "$(YELLOW)------------ COMPILING BONUS ------------$(END)"
	@$(CC) $(CFLAGS) libft/libft.a server_dir/server_bonus.c -o server_bonus
	@$(CC) $(CFLAGS) libft/libft.a client_dir/client_bonus.c -o client_bonus
	@echo "$(YELLOW)| $(GREEN)Minitalk (Bonus) compiled succesfully $(YELLOW)|$(END)"
	@echo "$(YELLOW)-----------------------------------------$(END)"

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