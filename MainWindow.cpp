#include "MainWindow.h"
#include "ui_MainWindow.h"

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->pushButton->setDefault(true);
}

MainWindow::~MainWindow()
{
    delete ui;
}

int MainWindow::length(QString str)
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
        QString sym = "!\"#$%^&*()+=-_'?.,|/`~№:;@[]{}";

        for (int i = 0; i < str.length(); i++)
        {
            for (int j = 0; j < sym.length(); j++)
            {
                if (str[i] == sym[j])
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

int MainWindow::lineCounter(QString str)
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

void MainWindow::on_pushButton_clicked()
{
    if (ui->checkLines->isChecked())
    {
         ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

void MainWindow::on_checkLines_clicked()
{
    if(ui->checkLines->isChecked())
    {
        ui->checkSpaces->setEnabled(false);
        ui->checkSym->setEnabled(false);

        ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->checkSpaces->setEnabled(true);
        ui->checkSym->setEnabled(true);

        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}

void MainWindow::on_checkSym_clicked()
{
    if (ui->checkSym->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSpaces->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(ui->plainTextEdit->toPlainText().length()));
    }
}

void MainWindow::on_checkSpaces_clicked()
{
    if (ui->checkSpaces->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else if (ui->checkSym->isChecked())
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(ui->plainTextEdit->toPlainText().length()));
    }
}

void MainWindow::on_plainTextEdit_textChanged()
{
    if (ui->checkLines->isChecked())
    {
         ui->label->setText(QString::number(lineCounter(ui->plainTextEdit->toPlainText())));
    }
    else
    {
        ui->label->setText(QString::number(length(ui->plainTextEdit->toPlainText())));
    }
}
