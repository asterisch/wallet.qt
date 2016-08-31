
#include <dbmanager.h>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>
#include <QtSql>
#include <QDebug>
#include "purchase.h"

DbManager::DbManager(const QString &path)
{
    database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName(path);
    if (!database.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database: connection ok";
        //QSqlQuery q;
        //q.exec("create table purchase(id int primary key,category text,amount real,note text,date text,people text,payment text,place text,event text ) ");
    }

}

DbManager::~DbManager()
{
    if (database.isOpen())
    {
        database.close();
    }
}

bool DbManager::isOpen() const
{
    return database.isOpen();
}

bool DbManager::addPurchase(Purchase p)
{
    bool success = false;
    QSqlQuery queryAdd;
    //queryAdd.exec(QLatin1String("insert into purchase (id,category,amount,note,date,people,payment,place,event) VALUES ()"));
    queryAdd.prepare(QLatin1String("INSERT INTO purchase( category, amount, note, date, people, payment, place, event)"
                                   "VALUES ( :category, :amount, :note, :date, :people, :payment, :place, :event)"));
    //queryAdd.bindValue(":id", p.getID());
    queryAdd.bindValue(":category",p.getCategory());
    queryAdd.bindValue(":amount",p.getAmount());
    queryAdd.bindValue(":note",p.getNote());
    queryAdd.bindValue(":date",p.getDate());
    queryAdd.bindValue(":people",p.getPeople());
    queryAdd.bindValue(":payment",p.getPaymethod());
    queryAdd.bindValue(":place",p.getPlace());
    queryAdd.bindValue(":event",p.getEvent());
    if(queryAdd.exec())
    {
        success = true;
        qDebug() << "true dat";
    }
    else
    {
        qDebug() << "add purchase failed: " << queryAdd.lastError();
    }
    return success;
}



void DbManager::printAllPurchases() const
{
    qDebug() << "Purchases in db:";
    QSqlQuery query("SELECT * FROM purchase");
    int idName = query.record().indexOf("id");
    qDebug()<< (idName);

    while (query.next())
    {
        QSqlRecord record = query.record();
        for(int index = 0; index < record.count(); ++index) {
                QString key = record.fieldName(index);
                QVariant value = record.value(index);
                qDebug() << key << "---" << value.toString();
         }

        //QString name = query.value(idName).toString();
       // qDebug() << "===" << query.record().field() ;//<< "===" << query.value(1).toString() << "===" << query.record().fieldName(4).toStdString();
    }
}

bool DbManager::removePurchase(int id) const
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare("DELETE FROM purchase WHERE id = (:id)");
    checkQuery.bindValue(":id", id);

    if (checkQuery.exec())
    {
         qDebug() << "purchase deleted from db!!";
    }
    else
    {
        qDebug() << "purchase deletion failed: " << checkQuery.lastError();
    }

    return exists;
}

