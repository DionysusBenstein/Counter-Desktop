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
    Q_INVOKABLE void readSettings();


private:
    Q_PROPERTY(QString primaryColor READ getPrimaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(QString lightColor READ getColor WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QString darkColor READ getColor WRITE setColor NOTIFY colorChanged)

    QSettings settings;
    QString primaryColor;
    QString lightColor;
    QString darkColor;

signals:
    void primaryColorChanged(QString);
    void lightColorChanged(QString);
    void darkColorChanged(QString);

};

#endif //SETTINGS_H
