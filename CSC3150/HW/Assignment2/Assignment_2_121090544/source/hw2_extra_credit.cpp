#include <iostream>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>
#include <termios.h>
#include <random>
#include <ncurses.h>
#include <vector>
#include <thread>
#include <mutex>
#include <condition_variable>

#define ROW 17
#define COLUMN 49
#define FREQ 10

int ISOVER = 0;
int ISQUIT = 0;

std::vector<int> walls = {2, 4, 6, 10, 12, 14};
std::vector<int> goals = {1, 3, 5, 11, 13, 15};

int kbhit(void);
class Dungeon
{
private:
    int height;
    int width;
    int colectionsGoalsCount = 0;
    std::mutex game_mutex;
    std::mutex cv_mutex;
    std::condition_variable adventurer_threshold_cv;
    std::vector<std::vector<char>> map;
    int thread_ids[6] = {2, 4, 6, 10, 12, 14};
    int thread_count = 0;
    int times_count = 0;
    struct Node
    {
        int x, y;
        Node(int _x, int _y) : x(_x), y(_y){};
        Node(){};
    } adventurer;

public:
    static Dungeon &getInstance()
    {
        static Dungeon instance;
        return instance;
    }
    void initialize_map()
    {
        /* Initialize the map and adventurer's starting position */
        int i, j;
        for (i = 0; i < ROW; ++i)
        {
            std::vector<char> tmp;
            for (j = 0; j < COLUMN; ++j)
                tmp.push_back(' ');
            map.push_back(tmp);
        }
        for (i = 1; i < ROW; ++i)
        {
            for (j = 0; j < COLUMN - 1; ++j)
                map[i][j] = ' ';
        }
        map[0][0] = map[0][COLUMN - 1] = map[ROW - 1][0] = map[ROW - 1][COLUMN - 1] = '+';
        for (j = 1; j < COLUMN - 1; ++j)
            map[ROW - 1][j] = map[0][j] = '-';
        for (j = 1; j < ROW - 1; ++j)
            map[j][0] = map[j][COLUMN - 1] = '|';
        adventurer = Node((ROW - 1) / 2, (COLUMN - 1) / 2);
        map[adventurer.x][adventurer.y] = '0';
        srand(time(NULL));
        int min = 0;
        int max = COLUMN - 1;
        for (int i = 0; i < 6; i++)
        {
            int len = 15;
            int range = rand() % (COLUMN - 2) + 1;
            /* generate the random length of each log */
            for (int j = range; j < len + range; j++)
            {
                int tmp = j > 47 ? j - 47 : j;
                map[walls[i]][tmp] = '=';
            }
        }
        for (int i = 0; i < 6; i++)
        {
            int pos = rand() % (COLUMN - 2) + 1;
            map[goals[i]][pos] = '$';
        }
        /* Print the map into screen */
        draw();
    }

    void draw()
    {
        // 使用 ANSI escape code 清屏
        erase();
        refresh(); // 确保 ncurses 的屏幕缓冲区被正确更新
        for (int i = 0; i < ROW; ++i)
        {
            if (map[i].size() > 0)
                mvaddnstr(i, 0, map[i].data(), map[i].size());
        }
        refresh(); // 再次调用 refresh 确保屏幕被正确刷新
    }
    /* check the game status after adventurer move */
    int check_status(int x, int y)
    {
        if (y >= COLUMN - 1 || y <= 0 || x <= 0 || x >= ROW - 1)
        {
            return -1; // -1 represent lose the game
        }
        else
        {
            if (map[x][y] == '$')
            {
                map[x][y] = ' ';
                return 1;
            }
            else if (map[x][y] == '=')
            {
                return -1;
            }
        }

        return 0;
    }

    /* move the adventurer after 7 thread walls move and check the game state */
    void adventurer_move(int t)
    {

        while (ISOVER == 0)
        {
            std::unique_lock<std::mutex> lock(game_mutex);

            /* wait for every wall and goal move */
            {
                adventurer_threshold_cv.wait(lock, [this]
                                             { return thread_count == 1; });
            }
            thread_count = 0;
            /* move the adventurer */
            if (kbhit())
            {
                char move = getchar();
                map[adventurer.x][adventurer.y] = ' ';
                int res;
                switch (move)
                {
                case 'w':
                case 'W':
                    adventurer.x--;
                    break;
                case 's':
                case 'S':
                    adventurer.x++;
                    break;
                case 'a':
                case 'A':
                    adventurer.y--;
                    break;
                case 'd':
                case 'D':
                    adventurer.y++;
                    break;
                case 'q':
                case 'Q':
                    ISQUIT = 1;
                    ISOVER = 1;
                }

                res = check_status(adventurer.x, adventurer.y);
                map[adventurer.x][adventurer.y] = '0';
                if (res == 1)
                {
                    if (++colectionsGoalsCount == goals.size())
                    {
                        ISOVER = 2;
                    }
                }
                else if (res == -1)
                {
                    ISOVER = 1;
                }
            }
            draw();
        }
    }

    void walls_and_goals_move(int t)
    {
        /* store the id of each thread */
        int my_id;
        while (ISOVER == 0)
        {
            usleep(10000);
            std::unique_lock<std::mutex> lock(game_mutex);
            // move right
            if (++times_count == FREQ)
            {
                for (auto my_id : thread_ids)
                {
                    if (((my_id) / 2) % 2 == 0)
                    {
                        for (int j = 1; j < COLUMN - 1; j++)
                        {
                            if (map[my_id][j] == '=')
                            {
                                int tmp = j == 1 ? 47 : j - 1;
                                if (map[my_id][tmp] == '0')
                                {
                                    ISOVER = -1;
                                    break;
                                }
                                map[my_id][tmp] = '=';
                                map[my_id][j] = ' ';
                            }
                        }
                    }
                    // move left
                    else
                    {
                        for (int j = COLUMN - 2; j > 0; j--)
                        {
                            if (map[my_id][j] == '=')
                            {
                                int tmp = j == 47 ? 1 : j + 1;
                                if (map[my_id][tmp] == '0')
                                {
                                    ISOVER = -1;
                                    break;
                                }
                                map[my_id][tmp] = '=';
                                map[my_id][j] = ' ';
                            }
                        }
                    }
                }

                for (int i = 0; i < 6; i++)
                {
                    for (int j = 1; j < COLUMN - 1; j++)
                    {
                        if (map[goals[i]][j] == '$')
                        {
                            if (rand() % 2)
                            { // move right
                                if (map[goals[i]][j == 47 ? 1 : j + 1] == '0')
                                {
                                    if (++colectionsGoalsCount == goals.size())
                                        ISOVER = 2;
                                }

                                else
                                    map[goals[i]][j == 47 ? 1 : j + 1] = '$';
                            }
                            else
                            { // move left
                                // map[goals[i]][j == 1 ? 47 : j - 1] = '$';
                                if (map[goals[i]][j == 1 ? 47 : j - 1] == '0')
                                {
                                    if (++colectionsGoalsCount == goals.size())
                                        ISOVER = 2;
                                }
                                else
                                    map[goals[i]][j == 1 ? 47 : j - 1] = '$';
                            }
                            map[goals[i]][j] = ' ';
                        }
                    }
                }
                times_count = 0;
            }
            thread_count += 1;

            if (thread_count == 1)
                adventurer_threshold_cv.notify_one();
        }
    }
};

/* Determine a keyboard is hit or not. If yes, return 1. If not, return 0 */
int kbhit(void)
{
    struct termios oldt, newt;
    int ch;
    int oldf;

    tcgetattr(STDIN_FILENO, &oldt);

    newt = oldt;
    newt.c_lflag &= ~(ICANON | ECHO);

    tcsetattr(STDIN_FILENO, TCSANOW, &newt);
    oldf = fcntl(STDIN_FILENO, F_GETFL, 0);

    fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

    ch = getchar();

    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
    fcntl(STDIN_FILENO, F_SETFL, oldf);

    if (ch != EOF)
    {
        ungetc(ch, stdin);
        return 1;
    }
    return 0;
}

void move_thread(int aa)
{
    Dungeon::getInstance().walls_and_goals_move(aa);
}

void adventurer_move_thread(int aa)
{
    Dungeon::getInstance().adventurer_move(aa);
}

int main(int argc, char *argv[])
{

    // Initialize ncurses
    initscr();
    cbreak();
    noecho();
    curs_set(0);
    keypad(stdscr, TRUE);
    // initialize_map();
    Dungeon::getInstance().initialize_map();

    /* Create pthreads for wood move and adventurer control. */

    std::thread threads[2];
    threads[0] = std::thread(move_thread, 100);
    threads[1] = std::thread(adventurer_move_thread, 100);

    for (int i = 0; i < 2; i++)
    {
        threads[i].join();
    }
    endwin();
    if (ISQUIT)
    {
        std::cout << "You Exit The Game." << std::endl;
    }
    else if (ISOVER == 2)
    {
        std::cout << "You Win The Game." << std::endl;
    }
    else
    {
        std::cout << "You Lose The Game." << std::endl;
    }

    return 0;
}