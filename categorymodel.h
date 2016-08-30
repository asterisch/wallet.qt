#ifndef CATEGORYMODEL_H
#define CATEGORYMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "category.h"

using namespace std;

class CategoryModel : public QAbstractListModel{

    Q_OBJECT
    private:
            vector <Category> myData;
    public:
        enum CategoryRoles{
            NameRole = Qt::UserRole+1,
            imgPathRole
        };

        CategoryModel(QObject *parent = 0);
        QHash<int, QByteArray> roleNames() const;
        int rowCount(const QModelIndex &parent = QModelIndex())const;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
        void insertCategory(QString name, QString imgPath);
        QVariant headerData(int section, Qt::Orientation orientation, int role) const;
        vector<pair<Category *, double>> convert(vector<QString> names, vector<double> quantities);
};





#endif // CATEGORYMODEL_H
