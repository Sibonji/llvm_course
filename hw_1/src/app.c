#include "../lib/app.h"

void app() {
    int arr [arr_len][arr_len];  
    int temp_arr[arr_len][arr_len];

    create_arr(&arr[0][0]);
    save_first_gen(&arr[0][0], &temp_arr[0][0]);
    fill_pixels_with_arr(&arr[0][0]);
    
    while (1) {
        save_new_gen(&arr[0][0], &temp_arr[0][0]);
        fill_pixels_with_arr(&arr[0][0]);
        update_window();   
    }

    return;
}

void save_first_gen(int * life_arr, int * mytemp_arr)
{
    for (int i = 0; i < arr_len; i++)
    {
        for (int j = 0; j < arr_len; j++)
        {
            mytemp_arr[i * arr_len+j] = life_arr[i * arr_len + j];
        }
    }
}

void save_new_gen(int * life_arr, int * mytemp_arr)
{
    for (int i = 1; i < arr_len - 1; i++)
    {
        for (int j = 1; j < arr_len - 1; j++)
        {
            int sum = life_arr[i*arr_len + j - 1] +	life_arr[i * arr_len + j + 1] + life_arr[(i - 1) * arr_len + j] + life_arr[(i + 1) * arr_len + j] + 
            life_arr[(i - 1) * arr_len + j - 1] + life_arr[(i - 1) * arr_len + j + 1] + life_arr[(i + 1) * arr_len + j - 1] + life_arr[(i + 1) * arr_len + j + 1];
            
            if (sum == 3)
            {
                mytemp_arr[i * arr_len + j] = 1;
            }
            else if (sum == 2 && life_arr[i * arr_len + j] == 1)
            {
                mytemp_arr[i * arr_len + j] = 1;
            }
            else
            {
                mytemp_arr[i * arr_len + j] = 0;
            }
        }
    }
    
    mytemp_arr[0] = mytemp_arr[(arr_len - 1) * arr_len - 2];
    mytemp_arr[arr_len - 1] = mytemp_arr[arr_len * (arr_len - 2) + 1];
    mytemp_arr[arr_len * (arr_len - 1)] = mytemp_arr[arr_len * 2 - 2];
    mytemp_arr[arr_len * arr_len - 1] = mytemp_arr[arr_len + 1];
    
    for (int j = 1; j < arr_len - 1; j++)
    {
        mytemp_arr[j] = mytemp_arr[arr_len * (arr_len - 2) + j];
        mytemp_arr[arr_len * (arr_len - 1) + j] = mytemp_arr[arr_len + j];
    }
    
    for (int i = 1; i < arr_len - 1; i++)
    {
        mytemp_arr[i * arr_len] = mytemp_arr[i * arr_len + (arr_len - 2)];
        mytemp_arr[i * arr_len + (arr_len - 1)] = mytemp_arr[i * arr_len + 1];
    }
    
    for (int i = 0; i < arr_len; i++)
    {
        for (int j = 0; j < arr_len; j++)
        {
            life_arr[i * arr_len + j] = mytemp_arr[i * arr_len + j];
        }
    }
}

void create_arr(int *life_arr)
{
    for (int i = 0; i < arr_len; i++)
    {
        for (int j = 0; j < arr_len; j++)
        {
            life_arr[i * arr_len + j] = sim_rand() % 2;
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