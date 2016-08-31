#include "budget.h"
#include <QtWidgets/QCalendarWidget>

Budget::Budget(double amount,QDate dateFrom,QDate dateTo)
{
    this->amount=amount;
    this->dateFrom=dateFrom;
    this->dateTo=dateTo;

}
Budget::Budget()
{

}

