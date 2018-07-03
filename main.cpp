#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Counter.h"
#include "Settings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("Counter");
    QGuiApplication::setOrganizationName("Benstein Industries");

    QQmlApplicationEngine engine;

    qmlRegisterType<Counter>("com.benstein.counter", 1, 4, "Counter");
    qmlRegisterType<Settings>("com.benstein.settings", 1, 0, "Settings");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
