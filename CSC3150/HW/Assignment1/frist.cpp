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
    // Mapping shared memory
    ipc_fd = open(ipc_path.c_str(), O_RDWR);
    int* weights = (int*)mmap(NULL, (g.v_cnt + 1) * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
    assert(weights != MAP_FAILED);
    memset(weights, 0, (g.v_cnt + 1) * sizeof(int));
        for (int i = 0; i < 5; ++i) { // Adjusted to 10 for 10 iterations
        // Parent process performs its task before forking the child process
        parent_process(ipc_path, output_parent_path, g);
        
        pid_t pid = fork();
        if (pid == 0) {
            // Child process
            child_process(ipc_path, output_child_path, g);
            munmap(weights, (g.v_cnt + 1) * sizeof(int)); // Cleanup in child
            exit(0);
        } else if (pid > 0) {
            // Parent process waits for child to finish
            wait(NULL);
        } else {
            // Fork failed
            perror("fork");
            exit(EXIT_FAILURE);
        }
    }
    
    // Cleanup in parent
    munmap(weights, (g.v_cnt + 1) * sizeof(int));
    close(ipc_fd);

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
    int* weights = (int*)mmap(NULL, (g.v_cnt + 1) * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
    assert(weights != MAP_FAILED);
    
    for (int i = 0; i < g.task2_iteration; ++i) {
        produce(weights, g.v_cnt, g);
        sleep(1); // Simulate work and allow child process to run
    }

    munmap(weights, (g.v_cnt + 1) * sizeof(int));
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
    int* weights = (int*)mmap(NULL, (g.v_cnt + 1) * sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, ipc_fd, 0);
    assert(weights != MAP_FAILED);

    for (int i = 0; i < g.task2_iteration; ++i) {
        consume(weights, g.v_cnt, g);
        sleep(1); // Simulate work and allow parent process to run
    }

    munmap(weights, (g.v_cnt + 1) * sizeof(int));
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