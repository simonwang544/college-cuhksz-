
#include <utility>
#include <string>
#include <sys/mman.h>
#include <unistd.h>  
#include <stdio.h>
#include <queue>
#include <vector>
#include <iostream>
#include <cstring>
#include <fstream>
#include <sys/mman.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <assert.h>


class Graph {
public:
    int v_cnt; // number of vertex
    int e_cnt;
    int *edge; // edges
    int *edge_weights;
    int *vertex; // v_i's neighbor is in edge[ vertex[i], vertex[i+1]-1]
    int task2_iteration=10;
    Graph() {
        v_cnt = 0;
        e_cnt = 0;
        edge = nullptr;
        vertex = nullptr;
        
    }

    ~Graph() {
        if (edge!=NULL)
            delete[] edge;
        if (edge_weights!=NULL)
            delete[] edge_weights;
        if (vertex!=NULL)
            delete[] vertex;
    }

    void bfs(const std::string &path);

    int map_global_graph(const std::string &path);

    void free_map(int &fd);

    void load_global_graph(const std::string &path);

    void get_edge_index(int v, int& l, int& r) const;

    void write_answer(int* data, int len, const std::string &path);

private:
};
void parent_process(const std::string &path, const std::string &output_path, Graph &g);
void child_process(const std::string &path, const std::string &output_path, Graph &g);


void produce(int *weights, int len, Graph &g) {
    for (int i=0; i<len; i++) {
        int l,r;
        g.get_edge_index(i,l,r);
        for (int j=l;j<r;j++) {
            weights[i+1]+=g.edge_weights[j];
        }
    }
}

void consume(int *weights, int len, Graph &g) {
    for (int i=0; i<len; i++) {
        int l,r;
        g.get_edge_index(i,l,r);
        weights[i+1] += 1;
    }
}


void Task1_1() {
    Graph g;
    std::string Task1_path("g1");
    g.load_global_graph(Task1_path);
    
    std::string Task1_output_path("Task1_1.output");
    g.bfs(Task1_output_path);
}

void Task1_2() {
    Graph g;
    std::string Task2_path("g2");
    int fd;
    fd = g.map_global_graph(Task2_path);
    std::string Task2_output_path("Task1_2.output");
    g.bfs(Task2_output_path);
    g.free_map(fd);
    
}
void Task1() {
    // Task 1.1
    Task1_1();
    printf("============\n");
    printf("Task1.1 Done\n");
    printf("============\n");
    // Task 1.2
    Task1_2();
    printf("============\n");
    printf("Task1.2 Done\n");
    printf("============\n");
}
