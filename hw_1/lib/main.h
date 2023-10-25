#pragma once

#include <SDL2/SDL.h>
#include <stdio.h>
#include <time.h>

int array_base_len = 100;
int arr_len = 102;

void app();
void update_window();
void fill_pixels_with_arr(int *life_arr);
int sim_rand();