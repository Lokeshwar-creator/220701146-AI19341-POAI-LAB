# Depth First Search (DFS) Implementation in Python

# Graph represented as an adjacency list
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

# Function to perform DFS
def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()  # To track visited nodes
    visited.add(start)
    print(start, end=" ")  # Print the current node
    for neighbor in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)  # Recursively visit unvisited neighbors

# Start DFS traversal from node 'A'
print("Depth First Search (DFS) starting from node 'A':")
dfs(graph, 'A')
