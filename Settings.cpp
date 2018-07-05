/*******************************************************************/

/* Original File Name: Settings.cpp                                */

/* Date: 03-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация класса, сохраняющего настройки
                приложения.                                        */

/*******************************************************************/

#include "Settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{
    writeSettings();
}

void Settings::setColor(const QString &color)
{
    this->color = color;
    emit colorChanged(color);
}

QString Settings::getColor() const
{
    return this->color;
}

void Settings::writeSettings()
{
    settings.beginGroup("/Settings");
    settings.setValue("/color", color);
    settings.endGroup();
}

void Settings::readSettings()
{
    settings.beginGroup("/Settings");
    color = settings.value("/color", "").toString();
}

