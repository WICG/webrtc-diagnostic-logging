all: index.html

index.html: index.bs
	bikeshed spec index.bs index.html

clean:
	rm -f index.html

watch:
	bikeshed watch index.bs index.html

.PHONY: all clean watch
