#ifndef BUDGETMODEL_H
#define BUDGETMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include "budget.h"

class budgetModel : public QAbstractListModel
{
    Q_OBJECT
    std::vector <Budget> poso;
    int vector_size;
public:
    budgetModel();

    int posoSize(){
        return poso.size();
    }

    Budget lastBal(int a){
        return poso[a];
    }

    Budget *lastBal2(int a){
        return &poso[a];
    }

    enum BudgetRoles
    {
        budgetRole = Qt::UserRole + 1,
            AmountRole, DateFromRole, DateToRole, IdRole
    };
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex())const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    void setBudget(double amount,QDate dateFrom,QDate dateTo);
    void removeBudget(int id);


signals:

public slots:
};

#endif // BUDGETMODEL_H
