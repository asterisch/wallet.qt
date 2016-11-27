#include "message.h"
#include <QtSql>
#include <dbmanager.h>

const QString path = "/home/alex/Desktop/wallet/wallet2/wallet.qt/sqlite3/rest.db";

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
    db = new DbManager(path);
    db->printAllPurchases();
    loadPurchases();
    /*if (db->isOpen())
    {
        //QSqlQuery q("delete from sqlite_sequence where name='purchase'");

        qDebug() << "Loading purchases from db:";

            insertPurchase(true,query.value(1).toString(),query.value(2).toLongLong(),query.value(3).toString(),*dt,query.value(5).toString(),query.value(6).toString(),query.value(7).toString(),query.value(8).toString(),db);
        }

        qDebug() << "End";
    }
    else
    {
        qDebug() << "Database is not open!";
    }*/
}

void Message::insertCategory (QString name, QString imgPath)
{
    _categoryModel->insertCategory(name,imgPath);
    emit catModelChanged();
    qDebug("InsertCategory called in Msg\n");
}

void Message::insertPurchase(QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event)
{
    _purchaseModel->insertPurchase(categ,amount,note,date,ppl,paym,place,event,db);
    emit purModelChanged();
    qDebug("InsertPurchase called in Msg\n");
}

void Message::removePurchase(int id)
{
    _purchaseModel->removePurchase(id,db);
    emit purModelChanged();
    qDebug("Purchase deleted");
}
void Message::loadPurchases()
{
    _purchaseModel->loadPurchases(db);
    emit purModelChanged();
    qDebug("Loaded Database Success!!!!");
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



