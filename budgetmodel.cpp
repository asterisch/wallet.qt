#include "budgetmodel.h"
using namespace std;
budgetModel::budgetModel()
{
    this->vector_size=0;
}

QHash<int, QByteArray> budgetModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[AmountRole] = "amount";
    roles[DateFromRole] = "dateFrom";
    roles[DateToRole] = "dateTo";
    roles[IdRole] = "id";
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
void budgetModel::setBudget(double amount,QDate dateFrom,QDate dateTo)
{
    beginResetModel();
    Budget b(this->vector_size,amount,dateFrom,dateTo);
    this->poso.push_back(b);
    this->vector_size++;
    endResetModel();
    qDebug("SetBudget called in Purchase Model\n");
    qDebug("Size of vector is now %d\n",poso.size());
}

void budgetModel::removeBudget(int id){
    beginResetModel();
    for(int j=0;j<poso.size();j++){
        Budget b = this->poso.at(j);
        if(b.getID()==id){
            poso.erase(this->poso.begin()+j);
            break;
        }
    }
    endResetModel();
    qDebug("removeBudget called in BudgetModel");
}
