#pragma once

#include <SDL2/SDL.h>
#include <stdio.h>
#include <string>
#include <iostream>
#include <sstream>

int array_base_len = 400;
int arr_len = (array_base_len+2);

void app();
void update_window();
void fill_pixels_with_arr(int *life_arr);
int sim_rand();