#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Counter.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling, true);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps, true);

    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("Counter");
    QGuiApplication::setApplicationVersion("2.9.3");
    QGuiApplication::setOrganizationName("Enclave Software");

    qmlRegisterType<Counter>("com.enclave.counter", 1, 4, "Counter");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
