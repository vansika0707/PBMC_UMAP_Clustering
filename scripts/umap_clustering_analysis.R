# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set relative paths to data files
umap_path <- "data/analysis/projection.csv"
clusters_path <- "data/analysis/clusters.csv"
de_path <- "data/analysis/differential_expression.csv"

# Load data
umap <- read.csv(umap_path)
clusters <- read.csv(clusters_path)
de <- read.csv(de_path)

# Merge UMAP coordinates and cluster labels by 'Barcode'
data <- merge(umap, clusters, by = "Barcode")

# Plot UMAP colored by cluster
ggplot(data, aes(x = UMAP.1, y = UMAP.2, color = factor(Cluster))) +
  geom_point(size = 1.2, alpha = 0.9) +
  theme_minimal() +
  labs(
    title = "UMAP Projection of PBMC Clusters",
    x = "UMAP 1",
    y = "UMAP 2",
    color = "Cluster"
  ) +
  theme(plot.title = element_text(hjust = 0.5))

# Function to get top marker genes for a cluster
get_top_markers <- function(de_df, cluster_num, top_n = 10) {
  cluster_log2fc <- paste0("Cluster.", cluster_num, ".Log2.fold.change")
  cluster_pval <- paste0("Cluster.", cluster_num, ".Adjusted.p.value")
  
  de_df %>%
    select(Feature.Name, all_of(cluster_log2fc), all_of(cluster_pval)) %>%
    arrange(!!sym(cluster_pval)) %>%
    slice_head(n = top_n)
}

# Get top 10 marker genes for clusters 
top_cluster1 <- get_top_markers(de, 1)
top_cluster2 <- get_top_markers(de, 2)
top_cluster3 <- get_top_markers(de, 3)
top_cluster4 <- get_top_markers(de, 4)
top_cluster5 <- get_top_markers(de, 5)
top_cluster6 <- get_top_markers(de, 6)
top_cluster7 <- get_top_markers(de, 7)
top_cluster8 <- get_top_markers(de, 8)

# Print top markers for each cluster
print("Top 10 marker genes for Cluster 1:")
print(top_cluster1)

print("Top 10 marker genes for Cluster 2:")
print(top_cluster2)

print("Top 10 marker genes for Cluster 3:")
print(top_cluster3)

print("Top 10 marker genes for Cluster 4:")
print(top_cluster4)

print("Top 10 marker genes for Cluster 5:")
print(top_cluster5)

print("Top 10 marker genes for Cluster 6:")
print(top_cluster6)

print("Top 10 marker genes for Cluster 7:")
print(top_cluster7)

print("Top 10 marker genes for Cluster 8:")
print(top_cluster8)
