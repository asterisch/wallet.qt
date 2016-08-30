#include "purchasemodel.h"

using namespace std;
purchaseModel::purchaseModel()
{
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
    Purchase c(categ,amount,note,date,ppl,paym,place,event);
    this->agores.push_back(c);
    endResetModel();
    qDebug("InsertPurchase called in Purchase Model\n");
    qDebug("Size of vector is now %d\n",agores.size());
}/*
QVariant purchaseModel::headerData(int section, Qt::Orientation orientation, int role) const{

    if (role != Qt::DisplayRole)
        return QVariant();
    if (orientation == Qt::Horizontal)
    {
        switch (role)
        {
        case CategoryRole: return "Category";
        case AmountRole: return "Amount";
        case NoteRole: return "Note";
        case DateRole: return "Date";
        case PeopleRole: return "People";
        case PaymethodRole: return "Payment Method";
        case PlaceRole: return "Place";
        case EventRole: return "Event";
        default: return QVariant();
        }
    }
    else
        return QString("Row %1").arg(section);
}
*/
