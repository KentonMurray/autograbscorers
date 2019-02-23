
INPUTS=$1

# Get only the text
cat $INPUTS | awk '{split($0,a,"___"); print a[5]}' > temp.txt

# Tokenize with moses tokenizer (assuming english)
./bin/tokenizer.perl -l en < temp.txt > temp.tok

# TODO: Train a truecaser model? Use a pretrained truecase? Truecase?


# TODO: Decide what the "correct" files are? line in a file?
CORRECT=temp.tok #TODO
PROPOSED=temp.tok #TODO


# Get BLEU scores
./bin/multi-bleu.perl -lc $CORRECT < $PROPOSED #-lc means lowercase
#TODO: Split BLEU, 1/2/3/4-gram scores?

# Get Meteor scores
java -Xmx2G -jar ./bin/meteor-1.5/meteor-1.5.jar $PROPOSED $CORRECT | grep 'Final score' | awk '{print $3}'

