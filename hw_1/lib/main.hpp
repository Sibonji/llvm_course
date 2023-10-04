#pragma once

#include <SDL2/SDL.h>
#include <stdio.h>
#include <string>
#include <iostream>
#include <sstream>

bool loop (bool running, int* myArray, int* tempArray, int myArrayLength, int* pPixels, SDL_Window* pDispllay, SDL_Event event);
void create_arr(int *life_arr, int arr_len);
void fill_pixels_with_arr(int *life_arr, int *pixels_ptr, int len);
void save_first_gen(int * life_arr, int * mytemp_arr, int len);
void save_new_gen(int * life_arr, int * mytemp_arr, int len);