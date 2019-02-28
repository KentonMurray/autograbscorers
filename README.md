Some scripts to generate scores (careful, they are brittle). Run this from the directory you want to work in.

Requirements:
Java (should be fine ... CRC)
conda (also should be fine ...CRC)

WARNING: get_tools.sh will use your conda base env and change things... OR YOUR PYTHON!?!?!

First, run ./get_tools.sh. This will create a directory bin, and get the scripts you need in it.

Second, train doc2vec on whole corpus (python train_doc2vec.py file1 file2 file3....)

Third, run get_scores.sh:

./get_scores.sh Z-26eyME6Co.txt Z4iYSMMMycQ.txt

Note that this is not symmetric, switching the two inputs' orders will change the scores.

Scores in order of printing:
BLEU
1-gram Overlap
2-gram Overlap
3-gram Overlap
4-gram Overlap
METEOR (crashes if they are of different line sizes)
Doc2Vec (Large Vector)

TODO: Nate, I need to understand how you want the inputs passed in
