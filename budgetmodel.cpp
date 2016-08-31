#include "budgetmodel.h"
using namespace std;
budgetModel::budgetModel()
{

}

QHash<int, QByteArray> budgetModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[AmountRole] = "amount";
    roles[DateFromRole] = "dateFrom";
    roles[DateToRole] = "dateTo";
    return roles;
}
int budgetModel::rowCount(const QModelIndex &parent) const
{
    return poso.size();
}
QVariant budgetModel::data(const QModelIndex &index, int role) const{

    int row = index.row();
    if (poso.size()>row && row>=0)
    {
        Budget i = poso.at(row);
        switch (role)
        {
        case AmountRole: return i.getAmount();
        case DateFromRole: return i.getDateFrom();
        case DateToRole: return i.getDateTo();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}
void budgetModel::setBudget(double amount,QDate dateFrom,QDate dateTo)
{
    beginResetModel();
    Budget b(amount,dateFrom,dateTo);
    this->poso.push_back(b);
    endResetModel();
    qDebug("SetBudget called in Purchase Model\n");
    qDebug("Size of vector is now %d\n",poso.size());

}
