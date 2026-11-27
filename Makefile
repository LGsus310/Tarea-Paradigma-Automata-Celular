GHC = ghc
TARGET = prog

all:
	$(GHC) -o $(TARGET) main.hs

clean:
	rm -f $(TARGET) *.hi *.o