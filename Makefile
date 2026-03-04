setup:
	./setup.sh

clean:
	sudo mn -c

test:
	sudo mn --test pingall
