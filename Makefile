all: index.html

index.html: index.bs
	curl https://www.w3.org/publications/spec-generator/ -F type=bikeshed-spec -F file=@index.bs  > index.html

check: index.bs
	curl https://www.w3.org/publications/spec-generator/ -F type=bikeshed-spec -F file=@index.bs -F output=err

distcheck: index.bs
	curl https://www.w3.org/publications/spec-generator/ -F type=bikeshed-spec -F file=@index.bs -F output=err