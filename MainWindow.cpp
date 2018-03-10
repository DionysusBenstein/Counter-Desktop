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
                counter -= 1;
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
                    counter -= 1;
                }
            }
        }
    }

    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == '\n')
        {
            counter -= 1;
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
    QString text = ui->plainTextEdit->toPlainText();

    if (ui->checkLines->isChecked())
    {
         ui->label->setText(QString::number(lineCounter(text)));
    }
    else
    {
        ui->label->setText(QString::number(length(text)));
    }
}

void MainWindow::on_checkLines_clicked()
{
    if(ui->checkLines->isChecked())
    {
        ui->checkSpaces->setEnabled(false);
        ui->checkSym->setEnabled(false);
    }
    else
    {
        ui->checkSpaces->setEnabled(true);
        ui->checkSym->setEnabled(true);
    }
}
