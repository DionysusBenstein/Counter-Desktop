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
    void setValue(const QString &value);
    QString getKey() const;
    QString getValue() const;

private:
    Q_PROPERTY(QString key READ getKey WRITE setKey NOTIFY keyChanged)
    Q_PROPERTY(QString value READ getValue WRITE setValue NOTIFY valueChanged)

    QString key;
    QString value;
    QSettings settings;

signals:
    void keyChanged(QString);
    void valueChanged(QString);
};

#endif //SETTINGS_H
