#ifndef BUDGETMODEL_H
#define BUDGETMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include "budget.h"

class budgetModel : public QAbstractListModel
{
    Q_OBJECT
    std::vector <Budget> poso;
public:
    budgetModel();
    enum BudgetRoles
    {
        budgetRole = Qt::UserRole + 1,
            AmountRole, DateFromRole, DateToRole
    };
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex())const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    void setBudget(double amount,QDate dateFrom,QDate dateTo);
signals:

public slots:
};

#endif // BUDGETMODEL_H
