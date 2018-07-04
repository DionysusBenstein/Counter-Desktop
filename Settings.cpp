#include "Settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{

}

void Settings::setKey(const QString &key)
{
    this->key = key;
    emit keyChanged(key);
}

void Settings::setValue(const QString &value)
{
    this->value = value;
    emit valueChanged(key);
}

QString Settings::getKey() const
{
    return this->key;
}

QString Settings::getValue() const
{
    return this->value;
}

