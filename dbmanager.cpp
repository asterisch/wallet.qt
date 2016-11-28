#include <dbmanager.h>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>
#include <QtSql>
#include <QDebug>

DbManager::DbManager(const QString &path)
{
    database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName(path);
    if (!database.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database: connection ok";
        //QSqlQuery q;
        //q.exec("create table purchase(id int primary key,category text,amount real,note text,date text,people text,payment text,place text,event text ) ");
    }

}

DbManager::~DbManager()
{
    if (database.isOpen())
    {
        database.close();
    }
}

bool DbManager::isOpen() const
{
    return database.isOpen();
}


/**
 * This method takes as a param a Purchase p
 * and adds that to the purchase table of the Database
 * @param Purchase
 * @return true if successfully added
 */
bool DbManager::addPurchase(Purchase p)
{
    bool success = false;
    QSqlQuery queryAdd;
    //queryAdd.exec(QLatin1String("insert into purchase (id,category,amount,note,date,people,payment,place,event) VALUES ()"));
    queryAdd.prepare(QLatin1String("INSERT INTO purchase( category, amount, note, date, people, payment, place, event)"
                                   "VALUES ( :category, :amount, :note, :date, :people, :payment, :place, :event)"));

    queryAdd.bindValue(":category",p.getCategory());
    queryAdd.bindValue(":amount",p.getAmount());
    queryAdd.bindValue(":note",p.getNote());
    queryAdd.bindValue(":date",p.getDate());
    queryAdd.bindValue(":people",p.getPeople());
    queryAdd.bindValue(":payment",p.getPaymethod());
    queryAdd.bindValue(":place",p.getPlace());
    queryAdd.bindValue(":event",p.getEvent());
    if(queryAdd.exec())
    {
        QSqlQuery q("select MAX(id) from purchase");
        QSqlRecord rec = q.record();
        int nameCol = rec.indexOf("MAX(id)"); // index of the field "name"
        q.next();
        qDebug() << "lastID = "<< q.value(nameCol).toString();
        lastID=q.value(nameCol).toInt();
        success = true;
        qDebug() << "true dat";
    }
    else
    {
        qDebug() << "add purchase failed: " << queryAdd.lastError();
    }
    return success;
}


/**
 * A method that prints all the purchases on the log
 * It is for debugging and testing reasons
 */
void DbManager::printAllPurchases() const
{
    qDebug() << "Purchases in db:";
    QSqlQuery query("SELECT * FROM purchase");
    int idName = query.record().indexOf("id");
    qDebug()<< (idName);

    while (query.next())
    {
        QSqlRecord record = query.record();
        for(int index = 0; index < record.count(); ++index) {
                QString key = record.fieldName(index);
                QVariant value = record.value(index);
                qDebug() << key << "---" << value.toString();
         }
    }
}


/**
 * This method searches and deletes anentry on the purchase table of the Database
 * The deletion is done by id which is given as a param
 * @param int id
 * @return false
 */
bool DbManager::removePurchase(int id) const
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare(QLatin1String("DELETE FROM purchase WHERE id = (:id)"));
    checkQuery.bindValue(":id", id);

    if (checkQuery.exec())
    {
         qDebug() << "purchase deleted from db!!";
    }
    else
    {
        qDebug() << "purchase deletion failed: " << checkQuery.lastError();
    }
    return exists;
}


/**
 * This method can be applied to a Database in order to get the id of the last entry
 * @return long int
 */
long int DbManager::getlastID()
{
    return lastID;
}


/**
 * A method to update the database if a new category is created in a purchase
 * The category is a static object, meaning it will still exist even if all tha purchases in it are removed
 * If a category is created successfully to the database, return TRUE.
 * @return success
 */
bool DbManager::addCategory(Category c){

    bool success = false;
    QSqlQuery queryAdd;
    queryAdd.prepare(QLatin1String("INSERT INTO category(category,image)"
                                   "VALUES ( :category,:image)"));

    queryAdd.bindValue(":category",c.getName());
    queryAdd.bindValue(":image",c.getImgPath());

    if(queryAdd.exec()){
        QSqlQuery q("select MAX(id) from category");
        QSqlRecord rec = q.record();
        int nameCol = rec.indexOf("MAX(id)");
        q.next();
        qDebug() << "category lastID = "<< q.value(nameCol).toString();
        lastID = q.value(nameCol).toInt();
        success = true;
        qDebug() << "VERY TRUE";
    }
    else{
        qDebug() << "add category failed" << queryAdd.lastError();
    }

    return success;
}


/**
 * This method searches an entry on the category table of the Database
 * The search is done by category name which is given as a param
 * If the category exists returns true
 * @param int category name
 * @return false
 */
bool DbManager::checkCategoryExistence(QString category)
{
    bool existence =false;
    QSqlQuery querySearch;
    querySearch.prepare(QLatin1String("SELECT count(*) FROM category WHERE category = (:category)"));
    querySearch.bindValue(":category",category);
    if(querySearch.exec()){
        QSqlRecord rec = querySearch.record();
        int nameCol = rec.indexOf("count(*)");
        querySearch.next();
        qDebug() << "category  = "<< querySearch.value(nameCol).toString();
        if(querySearch.value(nameCol).toString()!="0"){
            existence = true;
        }
        //qDebug() << "VERY TRUE";
    }
    else{
        qDebug() << "add category failed" << querySearch.lastError();
    }
    qDebug()<<existence;
    return existence;
}
