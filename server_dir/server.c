/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: victofer <victofer@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/29 11:04:38 by victofer          #+#    #+#             */
/*   Updated: 2022/11/21 19:17:12 by victofer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/libft.h"
#include <stdlib.h>

static void	bye_server(int signum)
{
	int		pid;

	signum = 9;
	pid = getpid();
	ft_putchar_fd(10, 1);
	ft_putstr_fd("Server closed", 1);
	ft_putchar_fd(10, 1);
	sleep(1);
	ft_putstr_fd("Bye", 1);
	ft_putchar_fd(10, 1);
	ft_putchar_fd(10, 1);
	sleep(1);
	kill (pid, 9);
}

void	signal_handler(int signum)
{
	static int	character;
	static int	bit;

	if (signum == SIGUSR1)
		character |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_putchar_fd(character, 1);
		bit = 0;
		character = 0;
	}
}

int	main(void)
{
	int					pid;

	pid = (int)getpid();
	ft_putstr_fd("Server pid: ", 1);
	ft_putnbr_fd(pid, 1);
	ft_putchar_fd(10, 1);
	signal(SIGUSR1, signal_handler);
	signal(SIGUSR2, signal_handler);
	ft_putchar_fd(10, 1);
	signal(SIGINT, bye_server);
	while (1)
	{
	}
	return (0);
}
