#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QSqlDatabase>
#include <QDate>
#include "purchase.h"
#include "category.h"

/**
 * \class DbManager
 *
 * \brief SQL Database Manager class
 *
 * DbManager sets up the connection with SQL database
 * and performs some basics queries. The class requires
 * existing SQL database. You can create it with sqlite:
 * 1. cd C:\
 * 2. mkdir sqlite3
 * 3. cd sqlite3
 * 4. $ sqlite3 rest.db
 * 5. sqilte> create table purchase (id integer primary key, category text, amount real, note text, date text, people text, payment text, place text, event text);
 * 6. sqlite> create table category (id integer primary key, category text, image BLOB);
 * 7. sqlite> .quit
 */
class DbManager
{
public:
    DbManager(const QString& path);
    ~DbManager();
    bool isOpen() const;
    bool addPurchase(Purchase c);
    bool removePurchase(int id) const;
    bool addCategory(Category c);
    bool checkCategoryExistence(QString category);
    void printAllPurchases() const;
    long int getlastID();
private:
    QSqlDatabase database;
    long int lastID;
};

#endif // DBMANAGER_H
