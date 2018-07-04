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
    //void setValue(const auto &value);
    //auto getValue() const;

private:
    Q_PROPERTY(QString key READ getKey WRITE setKey NOTIFY keyChanged)
    //Q_PROPERTY(int value READ getValue WRITE setValue NOTIFY valueChanged)

    QString key;
    QSettings settings;

signals:
    void keyChanged(QString);
    void valueChanged();
};

#endif //SETTINGS_H
