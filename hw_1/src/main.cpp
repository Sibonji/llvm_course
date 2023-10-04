#include "main.hpp"

void create_arr(int *life_arr, int arr_len)
{
    for (int i = 0; i < arr_len; i++)
    {
        for (int j = 0; j < arr_len; j++)
        {
            life_arr[i * arr_len + j] = rand() % 2;
        }
    }
    
    life_arr[0] = life_arr[(arr_len - 1)*arr_len - 2];
    life_arr[arr_len - 1] = life_arr[arr_len * (arr_len - 2) + 1];
    life_arr[(arr_len) * (arr_len - 1)] = life_arr[arr_len * 2 - 2];
    life_arr[arr_len * arr_len - 1] = life_arr[arr_len + 1];
    
    for (int j = 1; j < arr_len-1; j++)
    {
        life_arr[j] = life_arr[arr_len * (arr_len - 2) + j];
        life_arr[arr_len * (arr_len -1) + j] = life_arr[arr_len + j];
    }
    
    for (int i = 1; i < arr_len-1; i++)
    {
        life_arr[i * arr_len] = life_arr[i * arr_len + (arr_len-2)];
        life_arr[i * arr_len + (arr_len - 1)] = life_arr[i * arr_len + 1];
    }

    return;
}

void fill_pixels_with_arr(int *life_arr, int *pixels_ptr, int len)
{
    for (int i = 1; i < len-1; i++)
    {
        for (int j = 1; j < len-1; j++)
        {
            if (life_arr[i * len + j] == 0)
            {
                *pixels_ptr=0x00000000;
                pixels_ptr += 1;
            }
            else
            {
                *pixels_ptr=0x00FFFFFF;
                pixels_ptr += 1;
            }
        }
    }
}

void save_first_gen(int * life_arr, int * mytemp_arr, int len)
{
    for (int i = 0; i < len; i++)
    {
        for (int j = 0; j < len; j++)
        {
            mytemp_arr[i * len+j] = life_arr[i * len + j];
        }
    }
}

void save_new_gen(int * life_arr, int * mytemp_arr, int len)
{
    for (int i = 1; i < len - 1; i++)
    {
        for (int j = 1; j < len - 1; j++)
        {
            int sum = life_arr[i*len + j - 1] +	life_arr[i * len + j + 1] + life_arr[(i - 1) * len + j] + life_arr[(i + 1) * len + j] + 
            life_arr[(i - 1) * len + j - 1] + life_arr[(i - 1) * len + j + 1] + life_arr[(i + 1) * len + j - 1] + life_arr[(i + 1) * len + j + 1];
            
            if (sum == 3)
            {
                mytemp_arr[i * len + j] = 1;
            }
            else if (sum == 2 && life_arr[i * len + j] == 1)
            {
                mytemp_arr[i * len + j] = 1;
            }
            else
            {
                mytemp_arr[i * len + j] = 0;
            }
        }
    }
    
    mytemp_arr[0] = mytemp_arr[(len - 1) * len - 2];
    mytemp_arr[len - 1] = mytemp_arr[len * (len - 2) + 1];
    mytemp_arr[len * (len - 1)] = mytemp_arr[len * 2 - 2];
    mytemp_arr[len * len - 1] = mytemp_arr[len + 1];
    
    for (int j = 1; j < len - 1; j++)
    {
        mytemp_arr[j] = mytemp_arr[len * (len - 2) + j];
        mytemp_arr[len * (len - 1) + j] = mytemp_arr[len + j];
    }
    
    for (int i = 1; i < len - 1; i++)
    {
        mytemp_arr[i * len] = mytemp_arr[i * len + (len - 2)];
        mytemp_arr[i * len + (len - 1)] = mytemp_arr[i * len + 1];
    }
    
    for (int i = 0; i < len; i++)
    {
        for (int j = 0; j < len; j++)
        {
            life_arr[i * len + j] = mytemp_arr[i * len + j];
        }
    }
}

int main(int argc, const char * argv[]) {
    srand(time(NULL));

    int arr_base_len = 400;                
    int arr_len = arr_base_len + 2;
    int arr [arr_len][arr_len];  
    int temp_arr[arr_len][arr_len];
    int key = rand() % 100;

    srand(key);
    
    SDL_Window *display_ptr;
    SDL_Surface *window_ptr;
    
    std::string windowTitle = "Game of Life, Key: ";
    windowTitle += std::to_string(key);
    
    int err = SDL_Init(SDL_INIT_VIDEO);

    if (err == -1){
        std::cout << "There was an error";
        exit(-1);
    }
    
    display_ptr = SDL_CreateWindow(windowTitle.c_str(), SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, arr_base_len, arr_base_len, SDL_WINDOW_SHOWN);

    if (display_ptr == NULL)
    {
        std::cout << "There was a problem setting the display";
        exit(-1);
    }
    
    window_ptr = SDL_GetWindowSurface(display_ptr);
    int *pixels_ptr = (int *)window_ptr->pixels;
    
    create_arr(&arr[0][0], arr_len);
    save_first_gen(&arr[0][0], &temp_arr[0][0], arr_len);
    fill_pixels_with_arr(&arr[0][0], pixels_ptr, arr_len);
    SDL_UpdateWindowSurface(display_ptr);
    
    SDL_Event event;
    bool running = true;
    
    while (running)
    {
        running = loop(running, &arr[0][0], &temp_arr[0][0], arr_len, pixels_ptr, display_ptr, event);
    }
    
    
    SDL_Quit();
    
    return 0;
}