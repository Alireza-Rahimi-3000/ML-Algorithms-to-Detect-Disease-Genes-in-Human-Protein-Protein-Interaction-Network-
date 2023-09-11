# ML Algorithms to Detect Disease-Genes in Human Protein–Protein Interaction Network 

Our point of view on this project

* Understanding significance of protein–protein interaction organizes in human genome.
* Implement MATALB code to identify disease-genes in human genome.

# Interpret of Data Structure 

Human protein interaction data (PPI) is downloaded from the Human Protein Reference Database (HPRD). The current PPI dataset contains limited interactions between proteins among a total of 14,931 human proteins. In order to simplify this homework, adjacent list is given as txt file. Here, we give you six disease classes as positive class for evaluating classification algorithm. These Four disease classes are: cardiovascular disease, endocrine disease, cancer disease, metabolic disease, neurological disease, and ophthalmological. Attachment files are listed below. 
* HUMAN_PPI_AdjacentList_gene.txt includes interactor’s Gene symbols 
* PositiveGeneName.txt includes disease gene symbols

# The following steps are used to identify disease genes in the Human Protein–protein Interaction Network: 

* The positive set in ‘PositiveGeneName.txt’ consists of all confirmed disease genes, while the rest of genes in ‘HUMAN_PPI_AdjacentList_gene.txt’ set are considered as negative genes. 
* Build a protein interaction network 𝐺= (𝑉, 𝐸) where 𝑉 represents the set of vertices (proteins) and E denotes all edges (detected pairwise interactions between proteins). G can be represented as its matrix format, i.e., 𝑊= [𝑤𝑖𝑗] where 𝑤𝑖𝑗= 1 if the corresponding protein pair (𝑣𝑖, 𝑗) ∈ 𝐸; 0 otherwise1. 
* Extract following topological feature from G. As an additional work you can extract more features in order to improve performance4. Normalize and zero mean the topological measures were computed for each node in the PPIs network and each feature vector. 
* To overcome imbalance problem and avoid bias in sampling, implement sample reduction methods (like Tomek link).


