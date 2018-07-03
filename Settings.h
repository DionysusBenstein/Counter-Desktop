#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);
    void setKey(QString key);
    QString getKey();

private:
    QSettings settings;
};

#endif //SETTINGS_H
