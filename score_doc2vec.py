from gensim.models.doc2vec import Doc2Vec, TaggedDocument
from gensim.test.utils import get_tmpfile
import sys

# Load model
fname = get_tmpfile("my_doc2vec_model")
model = Doc2Vec.load(fname)

# Score each sentence
with open(sys.argv[1]) as f:
  for line in f:
    line = line.rstrip("\n")
    words = line.split(" ")
    #vector = model.infer_vector(["eps", "time"])
    vector = model.infer_vector(words)
    print(vector)

