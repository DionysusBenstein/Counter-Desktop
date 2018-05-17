/*******************************************************************/

/* Original File Name: MainWindow.cpp                              */

/* Date: 07-03-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Главное окно с основным функционалом программы     */

/*******************************************************************/

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
    int length(const QString str) const;

    //Метод считающий строки
    int lineCounter(const QString str) const;

    //Метод подсчёта слов
    int wordsCounter(const QString str) const;

private slots:
    //Слот клика на флажок "Посчитать количество строк"
    void on_checkLines_clicked();

    //Слот клика на флажок "Не считать знаки"
    void on_checkSym_clicked();

    //Слот клика на CheckBox "Не считать пробелы"
    void on_checkSpaces_clicked();

    //Слот клика на CheckBox "Посчитать количество слов"
    void on_checkWords_clicked();

    //Слот изменения текста в TextEdit
    void on_plainTextEdit_textChanged();

private:
    Ui::MainWindow *ui;

    QString signs = "!\"#$%^&*()+=-_'?.,|/`~№:;@[]{}";
    QString alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                   "abcdefghijklmnopqrstuvwxyz"
                   "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
                   "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
};

#endif // MAINWINDOW_H
