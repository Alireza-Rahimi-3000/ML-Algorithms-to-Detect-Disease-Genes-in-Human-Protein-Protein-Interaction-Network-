# Discovering disease-genes in human protein–protein interaction network 

Our goals here are: 
1. Understanding importance of protein–protein interaction network in human genome. 
2. Implement MATALB code to identify disease-genes in human genome. 

What is protein-protein interaction? Why is that important? 

While ~20K genes have been identified in human genome, we do not know exactly what they all do. But, we know a gene usually encodes a protein which contains the instructions for making proteins, so, in the literature we map genes to its corresponding proteins. To determining the function of a protein proceeds experimental techniques are expensive, time-consuming, error-prone and labor intensive, so computational methods were used. In this regards we can use features such as: three-dimensional structure (first, second and Tertiary structures), sequence similarity with other known proteins, domain information and base it on high-throughput experiments for interactions. So, PPI can lead us to identify the function such as role of unknown genes in disease. 
Proteins can interact in number of ways such as Pathways, a cascade of interactions, for example A -> B -> C. The protein-protein interaction (PPI) network is represented by an undirected graph with nodes representing the genes and edges representing the mapped interactions of the proteins encoded by the genes. 

Data description: 

Human protein interaction data (PPI) is downloaded from the Human Protein Reference Database (HPRD). The current PPI dataset contains limited interactions between proteins among a total of 13,035 human proteins. In order to simplify this homework, adjacent list is given as txt file. Here, we give you six disease classes as positive class for evaluating classification algorithm. These six disease classes are: cardiovascular disease, endocrine disease, cancer disease, metabolic disease, neurological disease, and ophthalmological. Attachment files are listed below. 
•	HUMAN_PPI_AdjacentList_gene.txt includes interactor’s Gene symbols 
•	PositiveGeneName.txt includes disease gene symbols 

To discover disease-genes in human protein–protein interaction network do the following steps: 
Our Tasks: 

1- The positive set in ‘PositiveGeneName.txt’ consists of all confirmed disease genes, while the rest of genes in ‘HUMAN_PPI_AdjacentList_gene.txt’ set are considered as negative genes. 

2- Build a protein interaction network 𝐺=(𝑉,𝐸) where 𝑉 represents the set of vertices (proteins) and 𝐸 denotes all edges (detected pairwise interactions between proteins). G can be represented as its matrix format, i.e. 𝑊= [𝑤𝑖𝑗] where 𝑤𝑖𝑗= 1 if the corresponding protein pair (𝑣𝑖,𝑗)∈ 𝐸; 0 otherwise1. 

3- Extract following topological feature from G. As an additional work you can extract more features in order to improve performance2. Normalize and zero mean the topological measures were computed for each node in the PPIs network and each feature vector.

4- To overcome imbalance problem and avoid bias in sampling, implement sample reduction methods (like Tomeklink).  

5- Use proper classification algorithm to classify positive and negative genes.

6- Evaluate precision, Recall and F-measure.

7- In the complete network, calculating direct neighbors all genes have on average.

