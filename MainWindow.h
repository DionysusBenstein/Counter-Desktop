#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    int length(QString str);

    int lineCounter(QString str);


private slots:
    void on_pushButton_clicked();

    void on_checkLines_clicked();

    void on_checkSym_clicked();

    void on_checkSpaces_clicked();

    void on_plainTextEdit_textChanged();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
