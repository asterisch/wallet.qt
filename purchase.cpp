#include "purchase.h"
#include <QtWidgets/QCalendarWidget>

Purchase::Purchase(QString categ,double amount,QString desc,QDate date,QString people,QString paym,QString place,QString event)
{
    this->category=categ;
    this->amount=amount;
    this->note=desc;
    this->people=people;
    this->date=date;
    this->paymethod=paym;
    this->place=place;
    this->event=event;
}
Purchase::Purchase()
{

}
