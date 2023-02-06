/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: victofer <victofer@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/29 11:47:17 by victofer          #+#    #+#             */
/*   Updated: 2022/11/21 19:18:36 by victofer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/libft.h"

void	ft_send(char *str, int pid)
{
	static int	bit;
	static int	i;

	i = 0;
	while (str[i])
	{
		bit = 0;
		while (bit < 8)
		{
			if ((str[i] & (0x01 << bit)) != 0)
				kill(pid, SIGUSR1);
			else
				kill(pid, SIGUSR2);
			usleep(100);
			bit++;
		}
		i++;
	}
}

int	check_correct_args(int argc)
{
	if (argc != 3)
	{
		ft_putstr_fd("Error. Incorrect number of arguments\n", 1);
		return (0);
	}
	return (1);
}

int	main(int argc, char **argv)
{
	int		pid;
	int		i;

	i = -1;
	if (!check_correct_args(argc))
		return (0);
	pid = ft_atoi(argv[1]);
	ft_send(argv[2], pid);
	ft_send("\n", pid);
	return (0);
}
