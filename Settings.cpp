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

//-------------------------------------------------------------------

void Settings::setSavedPrimaryColor(const QString &savedPrimaryColor)
{
    this->savedPrimaryColor = savedPrimaryColor;
    emit savedPrimaryColorChanged(savedPrimaryColor);
}

QString Settings::getSavedPrimaryColor() const
{
    return this->savedPrimaryColor;
}

//-------------------------------------------------------------------

void Settings::setSavedLightColor(const QString &savedLightColor)
{
    this->savedLightColor = savedLightColor;
    emit savedLightColorChanged(savedLightColor);
}

QString Settings::getSavedLightColor() const
{
    return this->savedLightColor;
}

//-------------------------------------------------------------------

void Settings::setSavedDarkColor(const QString &savedDarkColor)
{
    this->savedDarkColor = savedDarkColor;
    emit savedDarkColorChanged(savedDarkColor);
}

QString Settings::getSavedDarkColor() const
{
    return this->savedDarkColor;
}

//-------------------------------------------------------------------

void Settings::writeSettings()
{
    settings.beginGroup("/settings/saved/color");
    settings.setValue("/primary", savedPrimaryColor);
    settings.setValue("/light", savedLightColor);
    settings.setValue("/dark", savedDarkColor);
    settings.endGroup();
}

void Settings::readSettings()
{
    settings.beginGroup("/Settings");
    savedPrimaryColor = settings.value("/savedPrimaryColor", "").toString();
    savedLightColor = settings.value("/savedLightColor", "").toString();
    savedDarkColor = settings.value("/savedDarkColor", "").toString();
}

