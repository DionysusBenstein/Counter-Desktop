/*******************************************************************/

/* Original File Name: Settings.cpp                                */

/* Date: 03-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация класса, сохраняющего настройки
                приложения.                                        */

/*******************************************************************/

#include "Settings.h"

Settings::Settings(QObject *parent) : QObject(parent) {}

void Settings::setKey(const QString &key)
{
    this->key = key;
    emit keyChanged(key);
}

void Settings::setValue(const QString &value)
{
    this->value = value;
    emit valueChanged(key);
}

void Settings::writeSettings()
{
    settings.beginGroup("/Settings");
    settings.setValue("/color", key);
}

void Settings::readSettings()
{
    settings.beginGroup("/Settings");
    value = settings.value("/color", "").toString();
}

QString Settings::getKey() const
{
    return this->key;
}

QString Settings::getValue() const
{
    return this->value;
}

