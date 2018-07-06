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

    void setColor(const QString &color);
    QString getColor() const;

    void writeSettings();
    void readSettings();


private:
    Q_PROPERTY(QString color READ getColor WRITE setColor NOTIFY colorChanged)

    QString color;
    QSettings settings;

signals:
    void colorChanged(QString);

};

#endif //SETTINGS_H
