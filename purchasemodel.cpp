#include "purchasemodel.h"

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
                                   QString ppl, QString paym, QString place, QString event)
{
    beginResetModel();
    Purchase c(this->vector_size,categ,amount,note,date,ppl,paym,place,event);
    this->agores.push_back(c);
    this->vector_size++;
    endResetModel();
    qDebug("InsertPurchase called in Purchase Model\n");
    qDebug("Size of vector is now %d\n",agores.size());
}
void purchaseModel::removePurchase(int id)
{
    beginResetModel();
    for(int j=0;j<agores.size();j++)
    {
        Purchase p = this->agores.at(j);
        if(p.getID()==id)
        {
            agores.erase(this->agores.begin()+j);
            break;
        }
    }
    endResetModel();
    qDebug("removePurchase called in PurchaseModel");
}

