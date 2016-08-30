#include "categorymodel.h"


CategoryModel::CategoryModel(QObject *parent){
}

QHash<int, QByteArray> CategoryModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[imgPathRole] = "catImg";
    return roles;
}

int CategoryModel::rowCount(const QModelIndex &parent) const
{
    return myData.size();
}

QVariant CategoryModel::data(const QModelIndex &index, int role) const{

    int row = index.row();
    if (myData.size()>row && row>=0)
    {
        Category i = myData[row];
        switch (role)
        {
        case NameRole: return i.getName();
        case imgPathRole: return i.getImgPath();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}

void CategoryModel::insertCategory(QString name, QString imgPath){
    beginResetModel();
    Category c(name,imgPath);
    this->myData.push_back(c);
    endResetModel();
    qDebug("InsertCategory called in Category Model\n");
    qDebug("Size of vector is now %d\n",myData.size());
}

QVariant CategoryModel::headerData(int section, Qt::Orientation orientation, int role) const{

    if (role != Qt::DisplayRole)
        return QVariant();
    if (orientation == Qt::Horizontal)
    {
        switch (role)
        {
            case NameRole: return "Name";
            case imgPathRole: return "ImagePath";
            default: return QVariant();
        }
    }
    else
        return QString("Row %1").arg(section);
}

vector<pair<Category *, double>> CategoryModel::convert(vector<QString> names, vector<double> quantities){

    vector<pair<Category *,double>> components;
    qDebug("in convert\n");
    for (unsigned long i=0;i<names.size();i++)
    {
        for (unsigned long j=0;j<myData.size();j++)
        {
            if ( ((Category)myData[j]).getName()==names[i])
            {
                pair<Category *,double> p(&myData[j],quantities[i]);
                components.push_back(p);
                break;
            }
        }
    }
    qDebug("out of convert\n");
    return components;
}

