
INPUTS1=$1
INPUTS2=$2

# Get only the text
cat $INPUTS1 | awk '{split($0,a,"___"); print a[5]}' > temp.txt
cat $INPUTS2 | awk '{split($0,a,"___"); print a[5]}' > temp2.txt

# Tokenize with moses tokenizer (assuming english). Note tokenized bleu is normally not what you want
./bin/tokenizer.perl -l en < temp.txt > temp.tok
./bin/tokenizer.perl -l en < temp2.txt > temp2.tok

# TODO: Train a truecaser model? Use a pretrained truecase? Truecase?


# TODO: Decide what the "correct" files are? line in a file?
CORRECT=temp2.tok #TODO
PROPOSED=temp.tok #TODO


# Get BLEU scores
./bin/multi-bleu.perl -lc $CORRECT < $PROPOSED | grep 'BLEU' | awk '{print (substr($3, 1, length($3)-1)); split($4,a,"/"); print a[1]; print a[2]; print a[3]; print a[4];}' #-lc means lowercase
# Prints BLEU
# Prints 1-grams
# Prints 2-grams
# Prints 3-grams
# Prints 4-grams

# Get Meteor scores
java -Xmx2G -jar ./bin/meteor-1.5/meteor-1.5.jar $PROPOSED $CORRECT | grep 'Final score' | awk '{print $3}'
# Prints Meteor score

# Get Doc2Vec scores
python score_doc2vec.py $PROPOSED
#TODO: Vector output formatting


