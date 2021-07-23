HOME = ./
DATA = $(HOME).data/
WP = $(DATA)wordpress/
WPCONFIG = srcs/wordpress/wp-config.php

ADM = $(DATA)adminer/
ADMFILE = srcs/adminer/adminer.php

start: $(WP) $(ADM)
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

$(DATA):
	mkdir -p $(DATA)

$(WP): $(DATA) $(WPCONFIG)
	mkdir -p $(WP)
	cp $(WPCONFIG) $(WP)
	tar xf srcs/wordpress/wordpress.tar.gz --strip-components 1 -C $(WP)

$(ADM): $(DATA) $(ADMFILE)
	mkdir -p $(ADM)
	cp $(ADMFILE) $(ADM)

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	rm -rf $(DATA)
	docker-compose -f srcs/docker-compose.yml down
