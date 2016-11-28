#ifndef CATEGORYMODEL_H
#define CATEGORYMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "category.h"
#include "dbmanager.h"

using namespace std;

class CategoryModel : public QAbstractListModel{
    Q_OBJECT
    private:
        std::vector <Category> catigories;
        int vector_size;
    public:
        enum CategoryRoles{
            NameRole = Qt::UserRole+1,
            imgPathRole,IdRole
        };
        CategoryModel();
        //CategoryModel(QObject *parent = 0);
        QHash<int, QByteArray> roleNames() const;
        int rowCount(const QModelIndex &parent = QModelIndex())const;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
        //QVariant headerData(int section, Qt::Orientation orientation, int role) const;
        //vector<pair<Category *, double>> convert(vector<QString> names, vector<double> quantities);
        void insertCategory(QString name, QString imgPath, DbManager *db);
        void loadCategories(DbManager *db);
        bool checkCategoryExistence(QString category, DbManager *db);
};

#endif // CATEGORYMODEL_H
