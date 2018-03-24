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

    //Метод подсчёта символов
    int length(QString str);

    //Метод считающий строки
    int lineCounter(QString str);

    //Метод подсчёта слов
    int wordsCounter(QString str);

private slots:
    //Слот клика на флажок "Посчитать количество строк"
    void on_checkLines_clicked();

    //Слот клика на флажок "Не считать знаки"
    void on_checkSym_clicked();

    //Слот клика на CheckBox "Не считать пробелы"
    void on_checkSpaces_clicked();

    //Слот клика на CheckBox "Посчитать количество слов"
    void on_checkWords_clicked();

    //Слот клика изменения текста в TextEdit
    void on_plainTextEdit_textChanged();

private:
    Ui::MainWindow *ui;

    //Строки с алфавитом и знаками
    QString signs = "!\"#$%^&*()+=-_'?.,|/`~№:;@[]{}";
    QString alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                   "abcdefghijklmnopqrstuvwxyz"
                   "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
                   "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
};

#endif // MAINWINDOW_H
