#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include "categorymodel.h"

class Message : public QObject{

    Q_OBJECT
    Q_PROPERTY(CategoryModel* catModel READ catModel WRITE catSetModel NOTIFY catModelChanged)

    private:
        CategoryModel* _categoryModel;
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

    signals:
        void catModelChanged();

    public slots:
        void insertCategory (QString name, QString imgPath);
        void test(){}
};






#endif // MESSAGE_H
