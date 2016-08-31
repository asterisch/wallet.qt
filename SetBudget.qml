import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{


    color: "orange"


    Component{
        id: money
        BudgetMoney{}
    }

    Component{
        id: dateFrom
        BudgetDatePickerFrom{}
    }

    Component{
        id: dateTo
        BudgetDatePickerTo{}
    }






    ToolBar{

        id: toolBar4
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Set Budget"}
        BackButton{}

        ToolButton{

            id: saveButton
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.height
            height: parent.height
            Image{

                source: "images/ok.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:{
                    if (myBalance.amount!=0.0)
                    {

                        if (myBalance.dateFrom.toISOString().split("T")[0]!=="2000-01-01")
                        {

                               if (myBalance.dateTo.toISOString().split("T")[0]!=="2000-01-01")
                               {

                                    msg.setBudget(myBalance.amount,myBalance.dateFrom,myBalance.dateTo)

                                    console.log("--------------------------")
                                    console.log("succesfull Set Budget")
                                    console.log(myBalance.amount)
                                    console.log(myBalance.dateFrom.toISOString().split("T")[0])
                                    console.log(myBalance.dateTo.toISOString().split("T")[0])
                                    stack.pop();
                                    console.log("----------DONE-----------")
                                }else
                                {
                                    console.log("Failed! dateTo is Empty")

                                }
                        }else
                        {
                            console.log("Failed! dateFrom is Empty")
                        }
                    }else
                    {
                        console.log("Failed! amount is Empty")
                    }
            }

        }
    }







    Column{

        id: col
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar4.bottom
        height: 30

        anchors.topMargin: 10
        anchors.margins: 3
        spacing: 2



        Row{

            width: parent.width
            Button{

                id: button2
                width: parent.width
                height: 30
                Text{

                    text:"Money Amount"
                    anchors.margins: 5
                    anchors.left: imgLeft2.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image{

                    source:"images/rr.png"
                    width: parent.height
                    height: parent.height
                    anchors.margins: 1
                    anchors.right: parent.right
                }
                Image{

                    id: imgLeft2
                    source:"images/euro.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(money);
                }

            }
        }





        Row{

            width: parent.width
            Button{

                id: button3
                width: parent.width
                height: 30
                Text{

                    text:"From"
                    anchors.margins: 5
                    anchors.left: imgLeft3.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image{

                    source:"images/rr.png"
                    width: parent.height
                    height: parent.height
                    anchors.margins: 1
                    anchors.right: parent.right
                }
                Image{

                    id: imgLeft3
                    source:"images/calendar.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(dateFrom);
                }
            }
        }

        Row{

            width: parent.width
            Button{

                id: button4
                width: parent.width
                height: 30
                Text{

                    text:"To"
                    anchors.margins: 5
                    anchors.left: imgLeft4.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image{

                    source:"images/rr.png"
                    width: parent.height
                    height: parent.height
                    anchors.margins: 1
                    anchors.right: parent.right
                }
                Image{

                    id: imgLeft4
                    source:"images/calendar.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(dateTo);
                }
            }
        }
    }
}


