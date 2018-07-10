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

    void setLightColor(const QString &lightColor);
    QString getLightColor() const;

    void setDarkColor(const QString &darkColor);
    QString getDarkColor() const;

    void writeSettings();
    Q_INVOKABLE void readSettings();


private:
    Q_PROPERTY(QString savedPrimaryColor READ getSavedPrimaryColor WRITE setSavedPrimaryColor NOTIFY savedPrimaryColorChanged)
    Q_PROPERTY(QString lightColor READ getLightColor WRITE setLightColor NOTIFY lightColorChanged)
    Q_PROPERTY(QString darkColor READ getDarkColor WRITE setDarkColor NOTIFY darkColorChanged)

    QSettings settings;
    QString savedPrimaryColor;
    QString lightColor;
    QString darkColor;

signals:
    void savedPrimaryColorChanged(QString);
    void lightColorChanged(QString);
    void darkColorChanged(QString);

};

#endif //SETTINGS_H
