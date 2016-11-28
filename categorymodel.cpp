#include "categorymodel.h"
#include "QtSql"

/*
CategoryModel::CategoryModel(QObject *parent){
    Category a("clothes","images/clothes.png");
    myData.push_back(a);
}*/

using namespace std;

CategoryModel::CategoryModel(){
    this->vector_size=0;
}

QHash<int, QByteArray> CategoryModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[imgPathRole] = "imgPath";
    roles[IdRole] = "id";
    return roles;
}

int CategoryModel::rowCount(const QModelIndex &parent) const
{
    return catigories.size();
}

QVariant CategoryModel::data(const QModelIndex &index, int role) const{

    int row = index.row();
    if (catigories.size()>row && row>=0)
    {
        Category i = catigories.at(row);
        switch (role)
        {
        case NameRole: return i.getName();
        case imgPathRole: return i.getImgPath();
        case IdRole: return i.getID();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}

void CategoryModel::insertCategory(QString category, QString imgPath,DbManager *db){

    beginResetModel();
    if(db->isOpen()){
        Category c(0,category,imgPath);
        db->addCategory(c);
        long int lastID = db->getlastID();
        c.setID(lastID);
        this->catigories.push_back(c);
    }
    endResetModel();
    qDebug("Insert Category called in Category Model \n");
}


void CategoryModel::loadCategories(DbManager *db){

    if(db->isOpen()){
        this->catigories.clear();
        QSqlQuery query("SELECT * FROM category");
        while(query.next()){
            Category c(query.value(0).toLongLong(),query.value(1).toString(),query.value(2).toString());
            this->catigories.push_back(c);
        }
    }
}


bool CategoryModel::checkCategoryExistence(QString category, DbManager *db){
    if(db->isOpen()){
        if(db->checkCategoryExistence(category)==true){
            qDebug("CAT exist");
            return true;
        }
    }
    qDebug("CAT not exist");
    return false;
}



/*
QVariant CategoryModel::headerData(int section, Qt::Orientation orientation, int role) const{

    if (role != Qt::DisplayRole)
        return QVariant();
    if (orientation == Qt::Horizontal)
    {
        switch (role)
        {
            case NameRole: return "Name";
            case imgPathRole: return "ImagePath";
        case IdRole: return "id";
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
*/
