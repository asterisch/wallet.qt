#include "message.h"

Message::Message(QObject *parent) : QObject(parent)
{
    _categoryModel = new CategoryModel();
  //  insertCategory("Φάβα","images/coffee.png");
    _purchaseModel = new purchaseModel();
}

void Message::insertCategory (QString name, QString imgPath)
{
    _categoryModel->insertCategory(name,imgPath);
    emit catModelChanged();
    qDebug("InsertCategory called in Msg\n");
}
void Message::insertPurchase(QString categ,double amount, QString note, QDate date, QString ppl, QString paym, QString place, QString event)
{
    _purchaseModel->insertPurchase(categ,amount,note,date,ppl,paym,place,event);
}

/*void Message::insertCategory(QString name, QString imgPath)
{
    qDebug("In insertCategory\n");
    vector<QString> names;
    vector<double> quantities;

    //for (int i=0;i<ingredients.size();i++)
        //names.push_back(ingredients[i].toString());

    //for (int i=0;i<grams.size();i++)
        quantities.push_back(grams[i].toDouble());


    qDebug("%s %s %s\n",name.toStdString().c_str(),recipe.toStdString().c_str(),imgPath.toStdString().c_str());
    for (int i=0;i<ingredients.size();i++)
        qDebug("%s %lf\n",ingredients[i].toString().toStdString().c_str(),grams[i].toDouble());

    _dishModel->insertDish(name,recipe,imgPath,_ingredientModel->convert(names,quantities));

}*/

