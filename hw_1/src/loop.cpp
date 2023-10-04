#include "main.hpp"

bool loop (bool running, int *arr, int *temp_arr, int arr_len, int* pixels_ptr, SDL_Window* display_ptr, SDL_Event event) {
    while (SDL_PollEvent (&event) != 0)
    {
        if (event.type == SDL_QUIT)
        {
            running = false;
        }
    }
    
    //Update array and store "next generation" in temp_arr
    save_new_gen(arr, temp_arr, arr_len);
    fill_pixels_with_arr(arr, pixels_ptr, arr_len);
    SDL_Delay(10);
    SDL_UpdateWindowSurface(display_ptr);

    return running;
}