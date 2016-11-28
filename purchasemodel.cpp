#include "purchasemodel.h"
#include <QtSql>
#include "dbmanager.h"
using namespace std;

purchaseModel::purchaseModel()
{
    this->vector_size=0;

}
QHash<int, QByteArray> purchaseModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[CategoryRole] = "category";
    roles[AmountRole] = "amount";
    roles[NoteRole] = "note";
    roles[DateRole] = "date";
    roles[PeopleRole] = "people";
    roles[PaymethodRole] = "payment";
    roles[PlaceRole] = "place";
    roles[EventRole] = "event";
    roles[IdRole]="id";
    return roles;
}
int purchaseModel::rowCount(const QModelIndex &parent) const
{
    return agores.size();
}
QVariant purchaseModel::data(const QModelIndex &index, int role) const{

    int row = index.row();
    if (agores.size()>row && row>=0)
    {
        Purchase i = agores.at(row);
        switch (role)
        {
        case CategoryRole: return i.getCategory();
        case AmountRole: return i.getAmount();
        case NoteRole: return i.getNote();
        case DateRole: return i.getDate();
        case PeopleRole: return i.getPeople();
        case PaymethodRole: return i.getPaymethod();
        case PlaceRole: return i.getPlace();
        case EventRole: return i.getEvent();
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
void purchaseModel::insertPurchase(QString categ, double amount, QString note, QDate date,
                                   QString ppl, QString paym, QString place, QString event,DbManager *db)
{
    beginResetModel();  
    if (db->isOpen())
    {

       Purchase c(0,categ,amount,note,date,ppl,paym,place,event);
       db->addPurchase(c);
       long int lastID = db->getlastID();
       c.setID(lastID);
       this->agores.push_back(c);
    }
    endResetModel();
    qDebug("InsertPurchase called in Purchase Model\n");
}

void purchaseModel::removePurchase(int id,DbManager *db)
{
    beginResetModel();
    if (db->isOpen())
    {
            Purchase p  ;
         db->removePurchase(id);
         for (int i=0;i<this->agores.size();i++)
         {
             p=this->agores.at(i);
             if( p.getID() == id)
             {
                 this->agores.erase(this->agores.begin()+i);
                 break;
             }
         }
    }

    endResetModel();
    qDebug("removePurchase called in PurchaseModel");
}


void purchaseModel::loadPurchases(DbManager *db)
{
    if(db->isOpen())
    {
        this->agores.clear();
        QSqlQuery query("SELECT * FROM purchase");
        while (query.next())
        {
            QString date=query.value(4).toString();
            QDate *dt = new QDate(date.split("-")[0].toInt(),date.split("-")[1].toInt(),date.split("-")[2].toInt());
            Purchase c(query.value(0).toLongLong(),query.value(1).toString(),query.value(2).toDouble(),query.value(3).toString(),*dt,query.value(5).toString(),query.value(6).toString(),query.value(7).toString(),query.value(8).toString());
            this->agores.push_back(c);
        }
    }
}
