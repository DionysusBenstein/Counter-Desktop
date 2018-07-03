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
    Q_PROPERTY(QString key READ getKey WRITE setKey NOTIFY nameChanged)
    QString key;
    QSettings settings;

signals:
    void keyChanged();
};

#endif //SETTINGS_H
