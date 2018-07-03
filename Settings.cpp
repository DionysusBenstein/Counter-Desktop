#include "Settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{

}

void Settings::setKey(const QString &key)
{
    this->key = key;
    emit keyChanged(key);
}

QString Settings::getKey() const
{
    return this->key;
}
