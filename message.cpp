#include "message.h"

Message::Message(QObject *parent) : QObject(parent)
{
    _categoryModel = new CategoryModel();
    _purchaseModel = new purchaseModel();
    _budgetModel = new budgetModel();

    QString d = "20/2/2014";
    QDate d1 = QDate::fromString(d,"dd/MM/yyyy");

    insertPurchase("rouxa",12.3,"agorasa rouxakia",d1,"Jim","cash","New York","Easter");
}

void Message::insertCategory (QString name, QString imgPath)
{
    _categoryModel->insertCategory(name,imgPath);
    emit catModelChanged();
    qDebug("InsertCategory called in Msg\n");
}

void Message::insertPurchase(QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event)
{
    _purchaseModel->insertPurchase(categ,amount,note,date,ppl,paym,place,event);
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



