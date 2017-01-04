# Does not work for some reason
#REVISION = $(git describe --dirty --abbrev=6 --always --tags)

main:  
	@cd src; $(MAKE) $(MFLAGS)

clean:
	cd src; rm -f *.o *.M *.mod *.d *.il core *.html *.gcda *.gcno; cd ..
	rm -f bin/test.x

.PHONY: check
check: main
	@cd tests; ./runtests.sh ../bin/test.x
	@#@echo "Failed tests:"
	@#@grep "assertion failed" tests/mckernel_tests.log

.PHONY: doc
doc: 
	#@echo $(REVISION)  
	#@echo "PROJECT_NUMBER = "$(REVISION) >> ./src/doxygen.config
	$(DOXYGEN_PATH) ./src/doxygen.config

.PHONY: cleandoc
cleandoc:
	rm -rf ./doc/html

all: $(main) $(doc)
