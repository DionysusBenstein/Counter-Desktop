#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);
    void setKey(const QString &key);
    QString getKey() const;

private:
    Q_PROPERTY(QString key READ getKey WRITE setKey NOTIFY keyChanged)
    QString key;
    QSettings settings;

signals:
    void keyChanged(QString);
};

#endif //SETTINGS_H
