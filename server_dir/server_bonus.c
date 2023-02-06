/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: victofer <victofer@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/29 11:04:38 by victofer          #+#    #+#             */
/*   Updated: 2022/11/21 19:17:19 by victofer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/libft.h"
#include <stdlib.h>

/*
When ctrl+c is press the server shows a message, wait 3 seconds,
it close itself and no more server.
*/
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
	sleep(1);
	kill (pid, 9);
}

/* SIGUSR1 -> 1
   SIGUSR2 -> 0
 */
void	handler(int signum, siginfo_t *info, void *s)
{
	static int	character;
	static int	bit;

	(void)info;
	(void)s;
	if (signum == SIGUSR1)
		character |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_putchar_fd(character, 1);
		bit = 0;
		character = 0;
		kill (info->si_pid, SIGUSR1);
	}
}

int	main(void)
{
	int					pid;
	struct sigaction	s_sigaction;

	s_sigaction.sa_sigaction = handler;
	s_sigaction.sa_flags = SA_SIGINFO;
	pid = (int)getpid();
	ft_putstr_fd("Server (bonus) pid: ", 1);
	ft_putnbr_fd(pid, 1);
	ft_putchar_fd(10, 1);
	sigaction(SIGUSR1, &s_sigaction, 0);
	sigaction(SIGUSR2, &s_sigaction, 0);
	ft_putchar_fd(10, 1);
	signal(SIGINT, bye_server);
	while (1)
	{
		pause();
	}
	return (0);
}
