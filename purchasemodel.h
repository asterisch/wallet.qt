#ifndef PURCHASEMODEL_H
#define PURCHASEMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include "purchase.h"

class purchaseModel : public QAbstractListModel
{
    Q_OBJECT
    std::vector <Purchase> agores;
    int vector_size;
public:

    purchaseModel();
    enum PurchaseRoles
    {
        purchaseRole = Qt::UserRole + 1,
            CategoryRole, AmountRole, NoteRole, DateRole,
            PeopleRole, PaymethodRole, PlaceRole, EventRole,IdRole
    };
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex())const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    void insertPurchase(bool isLoaded,QString categ,double amount, QString note, QDate date,QString ppl, QString paym, QString place, QString event);
    void removePurchase(int id);
    void loadPurchases();
    //QVariant headerData(int section, Qt::Orientation orientation, int role) const;
signals:

public slots:
};

#endif // PURCHASEMODEL_H
