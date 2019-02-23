
mkdir -p ./bin
cd bin
# Get Moses Tokenizer
wget https://raw.githubusercontent.com/moses-smt/mosesdecoder/master/scripts/tokenizer/tokenizer.perl
wget https://raw.githubusercontent.com/moses-smt/mosesdecoder/master/scripts/tokenizer/detokenizer.perl
chmod +x tokenizer.perl
chmod +x detokenizer.perl
mkdir -p ../share/nonbreaking_prefixes/
cd ../share/nonbreaking_prefixes/
wget https://raw.githubusercontent.com/moses-smt/mosesdecoder/master/scripts/share/nonbreaking_prefixes/nonbreaking_prefix.en
chmod +x nonbreaking_prefix.en
cd ../../bin

# Get BLEU scorer
wget https://raw.githubusercontent.com/moses-smt/mosesdecoder/master/scripts/generic/multi-bleu.perl
chmod +x multi-bleu.perl


## Get METEOR scorer
#wget https://www.cs.cmu.edu/~alavie/METEOR/download/meteor-1.5.tar.gz
#gunzip meteor-1.5.tar.gz
#tar -xvf meteor-1.5.tar

# Gensim (Topic Models and Word2Vec)
conda install -y -c conda-forge gensim

