/*******************************************************************/

/* Original File Name: Counte.cpp                                  */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация класса основного функционала.           */

/*******************************************************************/

#include "Counter.h"

Counter::Counter(QObject *parent) : QObject(parent)
{
    signs = "!\"#$%^&*()+=-_'?.,|/`~№:;@[]{}";
    alph  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            "abcdefghijklmnopqrstuvwxyz"
            "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
            "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
}
