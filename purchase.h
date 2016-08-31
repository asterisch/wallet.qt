#ifndef PURCHASE_H
#define PURCHASE_H

#include <QObject>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QCalendarWidget>
using namespace std;
class Purchase
{
private:
    QString category;
    double amount;
    QString note;
    QDate date;
    QString people;
    QString paymethod;
    QString place;
    QString event;
    int id;
public:
        Purchase(int id,QString categ,double amount,QString desc,QDate date,QString people,QString paym,QString place,QString event);
        Purchase();

        QString getCategory() { return category;}
        double getAmount() {return amount;}
        QString getNote() {return note;}
        QDate getDate() {return date;}
        QString getPeople() {return people;}
        QString getPaymethod() {return paymethod;}
        QString getPlace() {return place;}
        QString getEvent() {return event;}
        int getID() {return id;}
        void setCategory(QString categ) {this->category=categ;}
        void setAmount(double amount) { this->amount=amount;}
        void setNote(QString note) {this->note=note;}
        void setDate(QDate date){this->date=date;}
        void setPeople(QString people) {this->people=people;}
        void setPaymethod(QString paymethod){this->paymethod=paymethod;}
        void setPlace(QString place){this->place=place;}
        void setEvent(QString event){this->event=event;}
};

#endif // PURCHASE_H
