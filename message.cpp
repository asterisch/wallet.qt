#include "message.h"
#include <QtSql>
#include <dbmanager.h>

const QString path = "/sqlite3/rest.db";
Message::Message(QObject *parent) : QObject(parent)
{
    _categoryModel = new CategoryModel();
    _purchaseModel = new purchaseModel();
    _budgetModel = new budgetModel();
    QString d = "20/8/2016";
    QString d22 = "5/9/2016";
    QDate d1 = QDate::fromString(d,"dd/MM/yyyy");
    QDate d2 =QDate::fromString(d22,"dd/MM/yyyy");
    setBudget(12.12,d1,d2);
    setBudget(12.12,d1,d2);
    DbManager db(path);

    if (db.isOpen())
    {
        QSqlQuery q("delete from sqlite_sequence where name='purchase'");
        db.printAllPurchases();
        qDebug() << "Loading purchases from db:";
        QSqlQuery query("SELECT * FROM purchase");
        while (query.next())
        {
            QString date=query.value(4).toString();
            QDate *dt = new QDate(date.split("-")[0].toInt(),date.split("-")[1].toInt(),date.split("-")[2].toInt());
            insertPurchase(true,query.value(1).toString(),query.value(2).toLongLong(),query.value(3).toString(),*dt,query.value(5).toString(),query.value(6).toString(),query.value(7).toString(),query.value(8).toString());
        }

        qDebug() << "End";
    }
    else
    {
        qDebug() << "Database is not open!";
    }
}

void Message::insertCategory (QString name, QString imgPath)
{
    _categoryModel->insertCategory(name,imgPath);
    emit catModelChanged();
    qDebug("InsertCategory called in Msg\n");
}

void Message::insertPurchase(bool isLoaded,QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event)
{
    _purchaseModel->insertPurchase(false,categ,amount,note,date,ppl,paym,place,event);
    emit purModelChanged();
    qDebug("InsertPurchase called in Msg\n");
}

void Message::removePurchase(int id)
{
    _purchaseModel->removePurchase(id);
    emit purModelChanged();
    qDebug("Purchase deleted");
}

void Message::setBudget(double amount,QDate dateFrom,QDate dateTo)
{
    _budgetModel->setBudget(amount,dateFrom,dateTo);
    emit budModelChanged();
    qDebug("SetBudget called in Msg\n");
}

void Message::removeBudget(int id){
    _budgetModel->removeBudget(id);
    emit budModelChanged();
    qDebug("Budget deleted");
}



