/*******************************************************************/

/* Original File Name: Counte.h                                    */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Класс основного функционала.                       */

/*******************************************************************/

#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
public:
    explicit Counter(QObject *parent = nullptr);

    //Метод подсчёта символов
    Q_INVOKABLE int length(const QString str) const;

    //Метод считающий строки
    Q_INVOKABLE int lineCounter(const QString str) const;

    //Метод подсчёта слов
    Q_INVOKABLE int wordsCounter(const QString str) const;

private:
    QString signs;
    QString alph;
};

#endif // COUNTER_H
