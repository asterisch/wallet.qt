#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include "categorymodel.h"
#include "purchaseModel.h"
class Message : public QObject{

    Q_OBJECT
    Q_PROPERTY(CategoryModel* catModel READ catModel WRITE catSetModel NOTIFY catModelChanged)
    Q_PROPERTY(purchaseModel* purModel READ purModel WRITE purSetModel NOTIFY purModelChanged)
    private:
        CategoryModel* _categoryModel;
        purchaseModel* _purchaseModel;
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

    signals:
        void catModelChanged();
        void purModelChanged();

    public slots:
        void insertCategory (QString name, QString imgPath);
        void test(){}
        void insertPurchase(QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event);

};






#endif // MESSAGE_H
