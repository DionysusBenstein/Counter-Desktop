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
    MainWindow::setWindowTitle("Counter v1.9.1");

    signs = "!\"#$%^&*()+=-_'?.,|/`~№:;@[]{}";
    alph  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            "abcdefghijklmnopqrstuvwxyz"
            "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
            "абвгдеёжзийклмнопрстуфхцчшщъыьэюя";
}

MainWindow::~MainWindow()
{
    delete ui;
}

//Метод подсчёта символов
int MainWindow::length(const QString str) const
{
    int counter = str.length();

    if(ui->checkSpaces->isChecked())
    {
        for (int i = 0; i < str.length(); i++)
        {
            if (str[i] == ' ')
            {
                counter--;
            }
        }
    }

    if(ui->checkSym->isChecked())
    {
        for (int i = 0; i < str.length(); i++)
        {
            for (int j = 0; j < signs.length(); j++)
            {
                if (str[i] == signs[j])
                {
                    counter--;
                }
            }
        }
    }

    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == '\n')
        {
            counter--;
        }
    }

    return counter;
}

//Метод считающий строки
int MainWindow::lineCounter(const QString str) const
{
    int counter = 1;

    for (int i = 0; i < str.length(); ++i)
    {
        if (str[i] == '\n')
        {
            counter++;
        }
    }

    return counter;
}

//Метод подсчёта слов
int MainWindow::wordsCounter(const QString str) const
{
    int counter = 0;

    for (int i = 0; i < alph.length(); ++i)
    {
        if (str[0] == alph[i])
        {
            counter = 1;
        }
    }

    for (int i = 0; i < str.length(); ++i)
    {
        for (int j = 0; j < alph.length(); ++j)
        {
            if (str[i] == ' ' && str[i + 1] == alph[j])
            {
                counter++;
            }
            else if (str[i] == '\n' && str[i + 1] == alph[j])
            {
                counter++;
            }
            else if (str[i] == '\t' && str[i + 1] == alph[j])
            {
                counter++;
            }

            for (int k = 0; k < signs.length(); ++k)
            {
                if (str[i] == signs[k] && str[i + 1] !=  alph[j])
                {
                    continue;
                }
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
    if(ui->checkLines->isChecked())
    {
        ui->checkSpaces->setChecked(false);
        ui->checkSym->setChecked(false);
        ui->checkWords->setChecked(false);

        ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на флажок "Не считать знаки"
void MainWindow::on_checkSym_clicked()
{
    if (ui->checkSym->isChecked())
    {
        ui->checkWords->setChecked(false);
        ui->checkLines->setChecked(false);

        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSpaces->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на CheckBox "Не считать пробелы"
void MainWindow::on_checkSpaces_clicked()
{
    if (ui->checkSpaces->isChecked())
    {
        ui->checkWords->setChecked(false);
        ui->checkLines->setChecked(false);

        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSym->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот клика на CheckBox "Посчитать количество слов"
void MainWindow::on_checkWords_clicked()
{
    if(ui->checkWords->isChecked())
    {
        ui->checkSpaces->setChecked(false);
        ui->checkSym->setChecked(false);
        ui->checkLines->setChecked(false);

        ui->label->setText(QString::number(wordsCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

//Слот изменения текста в TextEdit
void MainWindow::on_plainTextEdit_textChanged()
{
    if (ui->checkLines->isChecked())
    {
         ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSpaces->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkWords->isChecked())
    {
        ui->label->setText(QString::number(wordsCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}
