#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Counter.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("Counter");
    QGuiApplication::setOrganizationName("Benstein Industries");

    QQmlApplicationEngine engine;

    qmlRegisterType<Counter>("com.benstein.counter", 1, 3, "Counter");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
