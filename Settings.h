/*******************************************************************/

/* Original File Name: Settings.h                                  */

/* Date: 03-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Объявление класса, сохраняющего настройки
                приложения.                                        */

/*******************************************************************/

#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);

    void setSavedPrimaryColor(const QString &savedPrimaryColor);
    QString getSavedPrimaryColor() const;

    void setSavedLightColor(const QString &savedLightColor);
    QString getSavedLightColor() const;

    void setSavedDarkColor(const QString &savedDarkColor);
    QString getSavedDarkColor() const;

    Q_INVOKABLE void writeSettings();
    Q_INVOKABLE void readSettings();


private:
    Q_PROPERTY(QString savedPrimaryColor READ getSavedPrimaryColor WRITE setSavedPrimaryColor NOTIFY savedPrimaryColorChanged)
    Q_PROPERTY(QString savedLightColor READ getSavedLightColor WRITE setSavedLightColor NOTIFY savedLightColorChanged)
    Q_PROPERTY(QString savedDarkColor READ getSavedDarkColor WRITE setSavedDarkColor NOTIFY savedDarkColorChanged)

    QSettings settings;
    QString savedPrimaryColor;
    QString savedLightColor;
    QString savedDarkColor;

signals:
    void savedPrimaryColorChanged(QString);
    void savedLightColorChanged(QString);
    void savedDarkColorChanged(QString);

};

#endif //SETTINGS_H
