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

//---------------------------------------------------------

void Settings::setPrimaryColor(const QString &primaryColor)
{
    this->primaryColor = primaryColor;
    emit primaryColorChanged(primaryColor);
}

QString Settings::getPrimaryColor() const
{
    return this->primaryColor;
}

//---------------------------------------------------------

void Settings::setLightColor(const QString &lightColor)
{
    this->lightColor = lightColor;
    emit lightColorChanged(lightColor);
}

QString Settings::getLightColor() const
{
    return this->lightColor;
}

//---------------------------------------------------------

void Settings::setDarkColor(const QString &darkColor)
{
    this->darkColor = darkColor;
    emit darkColorChanged(darkColor);
}

QString Settings::getDarkColor() const
{
    return this->darkColor;
}

//---------------------------------------------------------

void Settings::writeSettings()
{
    settings.beginGroup("/settings/color");
    settings.setValue("/primary", primaryColor);
    settings.setValue("/light", lightColor);
    settings.setValue("/dark", darkColor);
    settings.endGroup();
}

void Settings::readSettings()
{
    settings.beginGroup("/Settings");
    primaryColor = settings.value("/primaryColor", "").toString();
    lightColor = settings.value("/lightColor", "").toString();
    darkColor = settings.value("/darkColor", "").toString();
}

