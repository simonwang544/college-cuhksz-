#include "graph.h"


// You are NOT suggested to change this function
void Graph::get_edge_index(int v, int& l, int& r) const
{
    l = vertex[v];
    r = vertex[v+1];
}

// You are NOT suggested to change this function
void Graph::bfs(const std::string &path) {
    std::vector<int> bfs_sequence;
    bool *visited = new bool[v_cnt];
    for (int i=0;i<v_cnt;i++) visited[i]=false;
    std::queue<int> q;
    for (int i=0; i<v_cnt; i++) {
        if(!visited[i]){
            q.push(i);
            visited[i]=true;
        }
        while(!q.empty()) {
            int v = q.front();
            q.pop();
            bfs_sequence.push_back(v);
            int l,r;
            get_edge_index(v,l,r);
            for (int j=l;j<r;j++) {
                if (visited[edge[j]]) continue;
                q.push(edge[j]);
                visited[edge[j]] = true;
            }
        }
    }
    delete[] visited;
    assert(bfs_sequence.size()==v_cnt);
    write_answer(bfs_sequence.data(),bfs_sequence.size(),path);
}

// Task 1.1: Load Application Data(binary) into memory for further computation
// This should be available for small test case.
void Graph::load_global_graph(const std::string &path) {
    // Format of graph.size:
    // |V|:Number of Nodes(4 Bytes), |E|:Number of Relations(4 Bytes)
    // Format of graph:
    // Prefix of Node's edge List (|V|* 4 Bytes), Relations (|E|* 4 Bytes), Relation weights(|E|* 4 Bytes)

    // Your Task:
    // Allocate memory space for vertex, edge, weights.
    // Load necessary information into from files.
    std::string graph_size(path);
    graph_size.append(".size");
    
    // Answer:
    std::ifstream size_file(graph_size, std::ios::binary);
    if (!size_file) {
        throw std::runtime_error("Cannot open size file.");
    }

    size_file.read(reinterpret_cast<char*>(&v_cnt), sizeof(v_cnt));
    size_file.read(reinterpret_cast<char*>(&e_cnt), sizeof(e_cnt));

    if (size_file.fail()) {
        throw std::runtime_error("Error reading size file.");
    }

    vertex = new(std::nothrow) int[v_cnt + 1];
    edge = new(std::nothrow) int[e_cnt];
    edge_weights = new(std::nothrow) int[e_cnt];

    if (!vertex || !edge || !edge_weights) {
        throw std::bad_alloc();
    }

    std::ifstream graph_file(path, std::ios::binary);
    if (!graph_file) {
        throw std::runtime_error("Cannot open graph file.");
    }

    graph_file.read(reinterpret_cast<char*>(vertex), sizeof(int) * (v_cnt + 1));
    graph_file.read(reinterpret_cast<char*>(edge), sizeof(int) * e_cnt);
    graph_file.read(reinterpret_cast<char*>(edge_weights), sizeof(int) * e_cnt);

    if (graph_file.fail()) {
        throw std::runtime_error("Error reading graph file.");
    }
    // Answer
    
    for (int i=0;i < v_cnt;i++) {
        assert(vertex[i]<vertex[i+1]);
    }
    assert(vertex[v_cnt]==e_cnt);
    for (int i=0;i < e_cnt; i++) {
        assert(edge[i] < v_cnt);
        assert(edge[i] >= 0);
    }
}


// Task 1.2: Map Application Data(binary) into virtual memory space for further computation
// This should be available for both small and large test cases.
int Graph::map_global_graph(const std::string &path) {
    int fd=0;
    // Format of graph.size:
    // |V|:Number of Nodes(4 Bytes), |E|:Number of Relations(4 Bytes)
    // Format of graph:
    // Prefix of Node's edge List (|V|* 4 Bytes), Relations (|E|* 4 Bytes), Relation weights(|E|* 4 Bytes)

    // Your Task:
    // Manage virtual memory space for vertex, edge, weights.
    // Map information from files to virtual space correctly.
    // You want to return the file descriptor for further unmap.
    std::string graph_size(path);
    graph_size.append(".size");

    
    // Answer:
    
        int fd_graph_size = open(graph_size.c_str(), O_RDONLY);
    if (fd_graph_size < 0) {
        std::cerr << "Failed to open size file: " << graph_size << std::endl;
        return -1; // Failure in opening the size file
    }

    // Read the number of vertices and edges from the size file
    read(fd_graph_size, &v_cnt, sizeof(v_cnt));
    read(fd_graph_size, &e_cnt, sizeof(e_cnt));
    close(fd_graph_size);

    // Open the main graph data file
    fd = open(path.c_str(), O_RDONLY);
    if (fd < 0) {
        std::cerr << "Failed to open graph file: " << path << std::endl;
        close(fd_graph_size); // Ensure the size file descriptor is closed
        return -1; // Failure in opening the graph file
    }

    // Map the graph data file into virtual memory
    size_t map_size = (v_cnt + 1 + e_cnt * 2) * sizeof(int); // Total size in bytes to map
    void *map = mmap(nullptr, map_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
    if (map == MAP_FAILED) {
        std::cerr << "Memory mapping failed." << std::endl;
        close(fd);
        return -1; // Failure in memory mapping
    }

    // Close the size file as it's no longer needed
    close(fd);

    // Assign pointers
    vertex = static_cast<int*>(map); // Vertex array starts at the beginning of the mapped area
    edge = vertex + v_cnt + 1; // Edge array starts right after the vertex array ends
    edge_weights = edge + e_cnt; // Edge weights array starts right after the edge array ends

    return 0;

    
    // Answer
    for (int i=0;i < v_cnt;i++) {
        assert(vertex[i]<vertex[i+1]);
    }
    assert(vertex[v_cnt]==e_cnt);
    for (int i=0;i < e_cnt; i++) {
        
        assert(edge[i] < v_cnt);
        assert(edge[i] >= 0);
    }
    return fd;
    
}

// Task 1.2: Together with map, you need to handle unmap
// Correctly set all pointers
void Graph::free_map(int &fd){

    // Answer:
       size_t size = (v_cnt + 1) * sizeof(int) + 2 * e_cnt * sizeof(int);
        munmap(vertex, size);
        vertex = nullptr;
        edge = nullptr;
        edge_weights = nullptr;
        if (fd != 0) {
        close(fd);
        fd = 0;
        }
    // Answer
}

// Task 1: Write application answer back to target file as a binary.
void Graph::write_answer(int *data, int len, const std::string &path) {

    // Answer:
    std::ofstream out_file(path, std::ios::binary);
    if (!out_file) {
        throw std::runtime_error("Cannot open output file.");
    }

    out_file.write(reinterpret_cast<const char*>(data), len * sizeof(int));
    if (out_file.fail()) {
        throw std::runtime_error("Error writing to output file.");
    }
    // Answer
}

// Task2: Process Inter-Communication
void Task2() {
    Graph g;
    int fd;
    fd = g.map_global_graph("g2");
    std::string ipc_path("ipc_file");
    // Creating inter process communication file if there is not.
    int ipc_fd = open(ipc_path.c_str(),O_RDWR| O_CREAT,0777);
    lseek (ipc_fd, (g.v_cnt+1)*sizeof(int)-1, SEEK_SET);
    write (ipc_fd, "", 1);
    close(ipc_fd);
    std::string output_parent_path("Task2_parent.output");
    std::string output_child_path("Task2_child.output");
    // process control

    // Answer:

    for (int i = 0; i < 5; ++i) {
        // No need to re-declare ipc_fd here, so the declaration line is removed.
        // Generate dynamic file names for this iteration
        std::string iterated_output_parent_path = "Task2_parent.output_" + std::to_string(i);
        std::string iterated_output_child_path = "Task2_child.output_" + std::to_string(i);

        // Call parent_process with iterated file name
        parent_process(ipc_path, iterated_output_parent_path, g);

        // Call child_process with iterated file name
        child_process(ipc_path, iterated_output_child_path, g);
    }
    // Answer
}

// Task2: Process Inter-Communication with control
void parent_process(const std::string &path, const std::string &output_path, Graph &g) {
    int pid = getpid();
    printf("parent proc %d is producing\n",pid);
    std::string my_proc(output_path);
    my_proc.append("_parent.pid");
    g.write_answer(&pid,1,my_proc);
    
    // Answer:
    int ipc_fd = open(path.c_str(), O_RDWR);
    int* shared_mem = (int*)mmap(NULL, (g.v_cnt + 2) * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
    assert(shared_mem != MAP_FAILED);

    // 等待子进程完成其操作
    while (shared_mem[0] != 0) {
        // 忙等待，不做任何操作
    }

    produce(shared_mem + 1, g.v_cnt, g); // 执行produce操作

    shared_mem[0] = 1; // 设置标记变量，表明父进程已完成操作，子进程可以开始

    munmap(shared_mem, (g.v_cnt + 2) * sizeof(int));
    close(ipc_fd);
  
    // Answer
    printf("parent end\n");
    return;
}

// Task2: Process Inter-Communication with control
void child_process(const std::string &ipc_path, const std::string &output_path, Graph &g) {
    int pid = getpid();
    printf("child proc %d is consuming\n",pid);
    std::string my_child_proc(output_path);
    my_child_proc.append("_child.pid");
    g.write_answer(&pid,1,my_child_proc);
    // Answer:
    int ipc_fd = open(ipc_path.c_str(), O_RDWR);
    int* shared_mem = (int*)mmap(NULL, (g.v_cnt + 2) * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
    assert(shared_mem != MAP_FAILED);

    // 等待父进程完成其操作
    while (shared_mem[0] != 1) {
        // 忙等待，不做任何操作
    }

    consume(shared_mem + 1, g.v_cnt, g); // 执行consume操作

    shared_mem[0] = 0; // 重置标记变量，让父进程知道子进程已完成

    munmap(shared_mem, (g.v_cnt + 2) * sizeof(int));
    close(ipc_fd);
    // Answer
    printf("child end\n");
    return;
}

int main() {
    Task1();
    Task2();
    printf("============\n");
    printf("Task2 Done\n");
    printf("============\n");
    return 0;
}