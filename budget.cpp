#include "budget.h"
#include <QtWidgets/QCalendarWidget>

Budget::Budget(int id,double amount,QDate dateFrom,QDate dateTo)
{
    this->amount=amount;
    this->dateFrom=dateFrom;
    this->dateTo=dateTo;
    this->id=id;
}
Budget::Budget()
{

}
