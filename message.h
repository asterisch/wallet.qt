#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include "categorymodel.h"
#include "purchasemodel.h"
#include "budgetmodel.h"
class Message : public QObject{

    Q_OBJECT
    Q_PROPERTY(CategoryModel* catModel READ catModel WRITE catSetModel NOTIFY catModelChanged)
    Q_PROPERTY(purchaseModel* purModel READ purModel WRITE purSetModel NOTIFY purModelChanged)
    Q_PROPERTY(budgetModel* budModel READ budModel WRITE budSetModel NOTIFY budModelChanged)
    private:
        CategoryModel* _categoryModel;
        purchaseModel* _purchaseModel;
        budgetModel* _budgetModel;
        DbManager *db;
    public:

        Message(QObject *parent=0);

        void catSetModel (CategoryModel* c)
        {
            _categoryModel=c;
            emit catModelChanged();
        }

       CategoryModel* catModel()
       {
           return _categoryModel;
       }

       void purSetModel(purchaseModel* p)
       {
           _purchaseModel=p;
           emit purModelChanged();
       }
       purchaseModel* purModel()
       {
           return _purchaseModel;
       }

       void budSetModel(budgetModel* b)
       {
           _budgetModel=b;
           emit budModelChanged();
       }
       budgetModel* budModel()
       {
           return _budgetModel;
       }

    signals:
        void catModelChanged();
        void purModelChanged();
        void budModelChanged();

    public slots:
        void insertCategory (QString name, QString imgPath);
        void test(){}
        void insertPurchase(QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event);
        void removePurchase(int id);
        void loadPurchases();
        void setBudget(double amount,QDate dateFrom,QDate dateTo);
        void removeBudget(int id);
        //sort bud model

        double curBalance(){
            return _budgetModel->lastBal(_budgetModel->posoSize()-1).getAmount();
        }

        QDate curDateFrom(){
            return _budgetModel->lastBal(_budgetModel->posoSize()-1).getDateFrom();
        }

        QDate curDateTo(){
            return _budgetModel->lastBal(_budgetModel->posoSize()-1).getDateTo();
        }
        void changeBalance(double a){
            _budgetModel->lastBal2(_budgetModel->posoSize()-1)->setAmount(a);
        }

};






#endif // MESSAGE_H
