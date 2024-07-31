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
    
    
    // Answer
}

// Task 1: Write application answer back to target file as a binary.
void Graph::write_answer(int *data, int len, const std::string &path) {

    // Answer:
    
    
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