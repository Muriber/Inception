# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bjimenez <bjimenez@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/19 10:56:49 by bjimenez          #+#    #+#              #
#    Updated: 2023/09/25 11:51:20 by bjimenez         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:	load

load:	
		@ mkdir -p /home/${USER}/data/mariadb_volume
		@ mkdir -p /home/${USER}/data/wp_volume
		@ docker-compose -f srcs/docker-compose.yml up -d --build

stop:	
		@ if [ $$(docker ps -a -q | wc -l) -eq 0 ]; then \
			echo "There are no containers to stop...\n"; \
		else \
			echo "Stopping Containers ... \n"; \
			docker stop $$(docker ps -a -q); \
		fi

clean:	stop
		@ if [ $$(docker ps -a -q | wc -l) -eq 0 ]; then \
			echo "There are no containers to remove...\n"; \
		else \
			echo "Removing Containers and network... \n"; \
			docker-compose -f srcs/docker-compose.yml down -v; \
			docker system prune -f; \
		fi

fclean:	clean
		@if [ $$(docker images -a -q | wc -l) -gt 0 ]; then\
			echo "Removing Images ... \n";\
			docker rmi -f $$(docker images -q);\
		else\
			echo "There are no images to remove...\n";\
		fi
		@if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then\
			echo "Removing volumes...\n";\
			docker volume rm $$(docker volume ls -q); \
		else \
			echo "There are no volumes to remove...\n";\
		fi
		@if ! [ -f /home/${USER}/data/wp_volume ]; then\
			sudo rm -rf /home/${USER}/data/wp_volume;\
		fi
		@if ! [ -f /home/${USER}/data/wp_volume ]; then\
			sudo rm -rf /home/${USER}/data/mariadb_volume;\
		fi
.PHONY: stop clean fclean load all