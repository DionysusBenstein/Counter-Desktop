/*******************************************************************/

/* Original File Name: Counter.cpp                                  */

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

//Метод подсчёта символов
int Counter::spacesCounter(const QString str) const
{
    int counter = str.length();

    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == ' ')
        {
            counter--;
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
int Counter::linesCounter(const QString str) const
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

//Метод подсчёта слов
//int Counter::wordsCounter(const QString str) const
//{
//    int counter = 0;

//    for (int i = 0; i < alph.length(); ++i)
//    {
//        if (str[0] == alph[i])
//        {
//            counter = 1;
//        }
//    }

//    for (int i = 0; i < str.length(); ++i)
//    {
//        for (int j = 0; j < alph.length(); ++j)
//        {
//            if (str[i] == ' ' && str[i + 1] == alph[j])
//            {
//                counter++;
//            }
//            else if (str[i] == '\n' && str[i + 1] == alph[j])
//            {
//                counter++;
//            }
//            else if (str[i] == '\t' && str[i + 1] == alph[j])
//            {
//                counter++;
//            }

//            for (int k = 0; k < signs.length(); ++k)
//            {
//                if (str[i] == signs[k] && str[i + 1] !=  alph[j])
//                {
//                    continue;
//                }
//                else if (str[i] == signs[k] && str[i + 1] ==  alph[j])
//                {
//                    counter++;
//                }
//            }
//        }
//    }

//    return counter;
//}
