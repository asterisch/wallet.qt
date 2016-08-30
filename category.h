#ifndef CATEGORY_H
#define CATEGORY_H

#include <QObject>


class Category{
    private:
            QString name;
            QString imgPath;
    public:
            Category(QString name, QString imgPath);
            QString getName(){return name;}
            QString getImgPath(){return imgPath;}
};

#endif // CATEGORY_H
