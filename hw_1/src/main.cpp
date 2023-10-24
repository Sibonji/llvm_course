#include "main.hpp"

static SDL_Window *display_ptr;
static int *pixels_ptr;

void update_window() {
    SDL_Delay(10);
    SDL_UpdateWindowSurface(display_ptr);

    SDL_Event event;
    if (SDL_PollEvent(&event) && event.type == SDL_QUIT)
        SDL_Quit();
}

int sim_rand() {
    return rand();
}

void fill_pixels_with_arr(int *life_arr)
{
    int* save_ptr = pixels_ptr;
    for (int i = 1; i < arr_len-1; i++)
    {
        for (int j = 1; j < arr_len-1; j++)
        {
            if (life_arr[i * arr_len + j] == 0)
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
    pixels_ptr = save_ptr;
}

int main(int argc, const char * argv[]) {
    srand(time(NULL));

    
    int key = rand() % 100;

    srand(key);

    std::string windowTitle = "Game of Life, Key: ";
    windowTitle += std::to_string(key);
    
    int err = SDL_Init(SDL_INIT_VIDEO);

    if (err == -1){
        std::cout << "There was an error";
        exit(-1);
    }
    
    display_ptr = SDL_CreateWindow(windowTitle.c_str(), SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, array_base_len, array_base_len, SDL_WINDOW_SHOWN);

    if (display_ptr == NULL)
    {
        std::cout << "There was a problem setting the display";
        exit(-1);
    }
    
    SDL_Surface *window_ptr;
    window_ptr = SDL_GetWindowSurface(display_ptr);
    pixels_ptr = (int *)window_ptr->pixels;
    
    SDL_Event event;
    
    app();

    while (SDL_PollEvent (&event) != 0)
    {
        if (event.type == SDL_QUIT)
        {
            SDL_Quit();
        }
    }
    
    
    SDL_Quit();
    
    return 0;
}