from gensim.models.doc2vec import Doc2Vec, TaggedDocument
from gensim.test.utils import get_tmpfile
import sys

#READ in texts to make documents
common_texts = []
for i in range(1, len(sys.argv)):
  document = sys.argv[i]
  words = []
  #TODO: First word is ___
  with open(document) as f:
    for line in f:
      line = line.rstrip("\n")
      words = words + line.split(" ")
    common_texts.append(words)  
    #print(words)
#print(common_texts)



documents = [TaggedDocument(doc, [i]) for i, doc in enumerate(common_texts)]

# TODO: vector_size, window size
#model = Doc2Vec(documents, vector_size=5, window=2, min_count=1, workers=4)
model = Doc2Vec(documents, vector_size=30, window=2, min_count=1, workers=4)

# Save model
fname = get_tmpfile("my_doc2vec_model")
model.save(fname)



