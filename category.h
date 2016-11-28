#ifndef CATEGORY_H
#define CATEGORY_H

#include <QObject>


class Category{
    private:
            QString name;
            QString imgPath;
            long int id;
    public:
            Category(long int id,QString name, QString imgPath);
            QString getName(){return name;}
            QString getImgPath(){return imgPath;}
            int getID() {return id;}
            void setID(int id) {this->id=id;}
            void setName(QString category) {this->name=category;}
            void setImgPath(QString imgPath){this->imgPath=imgPath;}
};

#endif // CATEGORY_H
