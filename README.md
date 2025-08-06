# PBMC Clustering Analysis

This project analyzes Peripheral Blood Mononuclear Cells (PBMCs) isolated from **Citrate-Treated Cell Preparation Tubes (CPT)** using 10x Genomics' **3' v3.1 Chemistry** platform. The analysis includes UMAP (Uniform Manifold Approximation and Projection) visualization of cell clusters and identification of cluster-specific marker genes via differential expression.

## Project Structure

'''plaintext
PBMC_UMAP_Clustering/
├── data/
│   └── analysis/
│       ├── clustering/
│       │   ├── graphclust/
│       │   ├── kmeans_2_clusters/
│       │   ├── kmeans_3_clusters/
│       │   └── ... (other kmeans cluster folders)
│       ├── diffexp/
│       │   ├── graphclust/
│       │   ├── kmeans_2_clusters/
│       │   └── ... (other kmeans cluster folders)
│       ├── pca/
│       │   └── 10_components/
│       ├── tsne/
│       │   └── 2_components/
│       └── umap/
│           └── 2_components/
└── scripts/

## Data source

The data is obtained from **10x Genomics**:  
**PBMCs from Citrate-Treated Cell Preparation Tubes (3' v3.1 Chemistry)**  
[Dataset Link](https://www.10xgenomics.com/datasets/pbmcs-3p_citrate_cpt-3-1-standard)

## Requirements

**R (version 4.0 or higher recommended)**
- R packages:
  ```r
  install.packages(c("ggplot2", "dplyr"))
- R-Studio is recommended for visualization

## How to Run the Analysis
1. Prepare Data
-Extract analysis folder from 3p_Citrate_CPT_analysis.tar. which contains projection.csv, clusters.csv, and differential_expression.csv  
-Place these files inside the data/ directory.

2. Run with RStudio (Recommended)
-Open scripts/umap_clustering_analysis.R.
-Set the working directory to the project root.
-Run the script fully or in sections.
-UMAP plots will appear in the Plots panel.
-Top marker genes for clusters will be printed in the console.

## Expected Output
-UMAP Plot: Visualization of PBMC clusters colored by cluster identity.
-Top Marker Genes: Lists of top 10 marker genes per cluster based on adjusted p-values.

## Result Interpretation
The UMAP plot reveals the cellular heterogeneity of PBMCs, clustering distinct immune cell populations. Marker gene analysis helps identify key genes driving each cluster's identity, facilitating understanding of immune cell types and functions.

## Acknowledgements
-Thanks to 10x Genomics for providing the dataset.
-Tools used: R, ggplot2, dplyr.