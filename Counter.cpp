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

int Counter::length(const QString str) const
{
    int counter = str.length();

    if(ui->checkSpaces->isChecked())
    {
        for (int i = 0; i < str.length(); i++)
        {
            if (str[i] == ' ')
            {
                counter--;
            }
        }
    }

    if(ui->checkSym->isChecked())
    {
        for (int i = 0; i < str.length(); i++)
        {
            for (int j = 0; j < signs.length(); j++)
            {
                if (str[i] == signs[j])
                {
                    counter--;
                }
            }
        }
    }

    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == '\n')
        {
            counter--;
        }
    }

    return counter;
}

//Метод считающий строки
int Counter::lineCounter(const QString str) const
{
    int counter = 1;

    for (int i = 0; i < str.length(); ++i)
    {
        if (str[i] == '\n')
        {
            counter++;
        }
    }

    return counter;
}
