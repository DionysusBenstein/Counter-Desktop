/*******************************************************************/

/* Original File Name: MainWindow.cpp                              */

/* Date: 07-03-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Главное окно с основным функционалом программы     */

/*******************************************************************/

#include "MainWindow.h"
#include "ui_MainWindow.h"

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

//Метод подсчёта символов
int MainWindow::length(const QString str)
{
    int counter = str.length();
    
    //Отслеживание пробелов
    if(ui->checkSpaces->isChecked())
    {
        //Посимвольное прохождение по введённой строке
        for (int i = 0; i < str.length(); i++)
        {
            //Если встречается пробел, то счётчик уменьшается на единицу
            if (str[i] == ' ')
            {
                counter--;
            }
        }
    }

    //Отслеживание знаков
    if(ui->checkSym->isChecked())
    {
        //Посимвольное прохождение по введённой строке
        for (int i = 0; i < str.length(); i++)
        {
            //Посимвольное прохождение по строке со знаками
            for (int j = 0; j < signs.length(); j++)
            {
                //Если встречается символ, то счётчик уменьшается на единицу
                if (str[i] == signs[j])
                {
                    counter--;
                }
            }
        }
    }

    //Посимвольное прохождение по введённой строке
    for (int i = 0; i < str.length(); i++)
    {
        //Если встречается перенос на следующую строку, то счётчик уменьшается на единицу
        if (str[i] == '\n')
        {
            counter--;
        }
    }

    return counter;
}

//Метод считающий строки
int MainWindow::lineCounter(const QString str)
{
    int counter = 1;

    //Посимвольное прохождение по введённой строке
    for (int i = 0; i < str.length(); ++i)
    {
        //Если встречается перенос на следующую строку, то к счётчику прибавляется единица
        if (str[i] == '\n')
        {
            counter++;
        }
    }

    return counter;
}

//Метод подсчёта слов
int MainWindow::wordsCounter(const QString str)
{
    int counter = 0;

    for (int i = 0; i < alph.length(); ++i)
    {
        //Если нулевой элемент равен букве из алфавита, счётчику присваивается единица
        if (str[0] == alph[i])
        {
            counter = 1;
        }
    }

    //Посимвольное прохождение по введённой строке
    for (int i = 0; i < str.length(); ++i)
    {
        //Посимвольное прохождение по строке с алфавитом
        for (int j = 0; j < alph.length(); ++j)
        {
            //Если встречается пробел, а за ним слдует буква, то увеличиваем счётчик на единицу
            if (str[i] == ' ' && str[i + 1] == alph[j])
            {
                counter++;
            }
            //Если встречается перенос строки, а за ним слдует буква, то увеличиваем счётчик на единицу
            else if (str[i] == '\n' && str[i + 1] == alph[j])
            {
                counter++;
            }
            //Если встречается табуляция, а за ней слдует буква, то увеличиваем счётчик на единицу
            else if (str[i] == '\t' && str[i + 1] == alph[j])
            {
                counter++;
            }

            //Посимвольное прохождение по строке со знаками
            for (int k = 0; k < signs.length(); ++k)
            {
                //Если после знака в строке нет букв, то счётчик не прибавляется
                if (str[i] == signs[k] && str[i + 1] !=  alph[j])
                {
                    continue;
                }
                //Иначе если после знака в строке есть буквы, то счётчик увеличивается на единицу
                else if (str[i] == signs[k] && str[i + 1] ==  alph[j])
                {
                    counter++;
                }
            }
        }
    }

    return counter;
}

//Слот клика на флажок "Посчитать количество строк"
void MainWindow::on_checkLines_clicked()
{
    //Если выбран флажок "Посчитать количество строк", то все остальные флажки, становятся недоступны
    if(ui->checkLines->isChecked())
    {
        //то все остальные флажки, становятся недоступны
        ui->checkSpaces->setEnabled(false);
        ui->checkSym->setEnabled(false);
        ui->checkWords->setEnabled(false);

        //и вызывается метод подсчёта строк
        ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        //иначе флажки становятся доступными
        ui->checkSpaces->setEnabled(true);
        ui->checkSym->setEnabled(true);
        ui->checkWords->setEnabled(true);

        //и вызывается метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на флажок "Не считать знаки"
void MainWindow::on_checkSym_clicked()
{
    //Проверка состояния флажка "Не считать знаки"
    if (ui->checkSym->isChecked())
    {
        ui->checkWords->setEnabled(false);
        ui->checkLines->setEnabled(false);

        //Вызывается метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    //Проверка состояния флажка "Не считать пробелы"
    else if (ui->checkSpaces->isChecked())
    {
        //Вызывается метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->checkWords->setEnabled(true);
        ui->checkLines->setEnabled(true);

        //Вызывается стандартный метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на CheckBox "Не считать пробелы"
void MainWindow::on_checkSpaces_clicked()
{
    if (ui->checkSpaces->isChecked())
    {
        ui->checkWords->setEnabled(false);
        ui->checkLines->setEnabled(false);

        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSym->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->checkWords->setEnabled(true);
        ui->checkLines->setEnabled(true);

        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на CheckBox "Посчитать количество слов"
void MainWindow::on_checkWords_clicked()
{
    if(ui->checkWords->isChecked())
    {
        ui->checkSpaces->setEnabled(false);
        ui->checkSym->setEnabled(false);
        ui->checkLines->setEnabled(false);

        //Вызывется метод подсчёта слов
        ui->label->setText(QString::number(wordsCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->checkSpaces->setEnabled(true);
        ui->checkSym->setEnabled(true);
        ui->checkLines->setEnabled(true);

        //Вызывается метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот изменения текста в TextEdit
void MainWindow::on_plainTextEdit_textChanged()
{
    //Если выбран флажок "Посчитать количество строк"
    if (ui->checkLines->isChecked())
    {
        //Вызывается метод подсчёта строк
         ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    //Если выбран флажок "Не считать пробелы"
    else if (ui->checkSpaces->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    //Если выбран флажок "Посчитать количество слов"
    else if (ui->checkWords->isChecked())
    {
        //Вызывается метод подсчёта слов
        ui->label->setText(QString::number(wordsCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        //Вызывается метод подсчёта символов
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}
