#pragma once

void create_arr(int *life_arr);
void save_first_gen(int * life_arr, int * mytemp_arr);
void save_new_gen(int * life_arr, int * mytemp_arr);

extern int arr_len;

extern int sim_rand();
extern void update_window();
extern void fill_pixels_with_arr(int *life_arr);