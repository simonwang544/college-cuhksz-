#include <iostream>
#include <vector>
#include<list>
#include<queue>
using namespace std;
typedef pair<long long, double> ver;
long long infinite = 100000000050;
class Graph
{
    public:
        list<pair<long long,double> > *l;

        long long getall(){
            return all_num;
        }
        
        long long getstr(){
            return str_num;
        }
        
        void make_new_edge(long long u, long long v, long long k, long long wei, long long i)
        {
            list<pair<long long,double> >::iterator iter;
            double wei1 = wei / 2.0;
            l[i+str_num].push_back(pair<long long,double>(v, wei1));
            l[all_num-1-i].push_back(pair<long long,double>(u, wei1));
            l[v].push_back(pair<long long,double>(all_num-1-i, wei1));
            l[u].push_back(pair<long long,double>(i + str_num, wei1));

            for (iter = l[u].begin(); iter != l[u].end(); ++iter){
                if (all_num - 1 - i != iter->first){
                    if(iter->second == k*wei1){
                        l[all_num - 1 - i].push_back(pair<long long,double>(iter->first, (k-1)*wei1));
                    }
                }
                if (all_num - 1 - iter->first + str_num != str_num + i){
                    if(k*iter->second == wei1){
                        l[all_num - 1 - iter->first + str_num].push_back(pair<long long,double>(str_num + i, (k-1)*iter->second));
                    }
                }
            }
            for (iter = l[v].begin(); iter != l[v].end(); ++iter){
                if (i+str_num != iter->first ){
                    if(iter->second == k*wei1){
                        l[i+str_num].push_back(pair<long long,double>(iter->first, (k-1)*wei1));
                    }
                }
                if (all_num - 1 - iter->first + str_num != all_num - 1 - i){
                    if (k*iter->second == wei1){
                        l[all_num - 1 - iter->first + str_num].push_back(pair<long long,double>(all_num - 1 - i, (k - 1)*iter->second));
                    } 
                }
            }
        }
        Graph(long long vn, long long en){
            this->str_num = vn;
            this->all_num = vn + 2*en;
            this->l = new list<ver> [all_num];
        }
        
private:
    long long all_num;
    long long str_num;
};

void dijkstra(Graph g)
{
    long long v1;
    double w1;
    long long sma;
    vector<double> spr(g.getall(), infinite);
    priority_queue<ver, vector<ver>, greater<ver> > heap_queue;
    heap_queue.push(pair<long long,double>(0, 0));
    spr[0] = 0;
    while (!heap_queue.empty()){
        sma = heap_queue.top().second;
        heap_queue.pop();
        list<pair<long long, double> >::iterator iter1;
        for (iter1 = g.l[sma].begin(); iter1 != g.l[sma].end(); ++iter1){
            v1 = iter1->first;
            w1 = iter1->second;
            if (spr[v1] > spr[sma]+ w1){
                spr[v1] = spr[sma] + w1;
                heap_queue.push(pair<long long,double>(spr[v1], v1)); 
            }
        }
    }
    for (long long i = 0; i < g.getstr(); i++){//不放这就超时咯
        if (spr[i] != infinite){
            cout << spr[i] << " ";
        } else {
            cout << -1 << " ";
        }
    }
    cout << endl;
}
int main()
{
    long long n, m, k;
    long long u, v, w;
    cin >> n >> m >> k;
    Graph a(n, m);
    for (long long i = 0; i < m; i++)
    {
        cin >> u >> v >> w;
        a.make_new_edge(u-1, v-1, k, w, i);
    }
    dijkstra(a);
}