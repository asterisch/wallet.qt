import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle{

    color:"lightblue"

    property int cur
    property int budID
    property double editAmount
    property date editDateFrom
    property date editDateTo

    Component{
        id: dateFrom
        BudgetDatePickerFrom{}
    }

    Component{
        id: dateTo
        BudgetDatePickerTo{}
    }


    ToolBar{
        id: toolBar13
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Edit Budget"}
        BackButton{}
        ToolButton
        {
            anchors.right: parent.right
            anchors.top: parent.top
            id:saveEdit
            width: parent.height
            height:width
            Image
            {
                source: "images/ok.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:
            {
                myBalance.amount=newAmount.text.trim()
                msg.setBudget(myBalance.amount,myBalance.dateFrom,myBalance.dateTo)
                console.log("--------------------------")
                console.log("succesfull Edit Budget")
                console.log(myBalance.amount)
                console.log(myBalance.dateFrom.toISOString().split("T")[0])
                console.log(myBalance.dateTo.toISOString().split("T")[0])
                stack.pop()
                //stack.pop()
            }
        }
    }

    Column{
        id:col
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar13.bottom
        anchors.margins: 10


        Row{
            id: amountRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            width: parent.width
            height: 50
            Column{
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                Label{
                    text:"Amount: "+myBalance.amount+" €"//amount
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Column{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                TextField{
                    id: newAmount
                    placeholderText: "new amount"
                    anchors.fill: parent
                }
            }
        }


        Row{
            id: dateFromRow
            anchors.top: amountRow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            width: parent.width
            height: 50
            Column{
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                Label{
                    text:"From: "+myBalance.dateFrom.toISOString().split("T")[0]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Column{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                anchors.topMargin: 5
                Button{
                    id:idDateFrom
                    anchors.fill: parent
                    text:"Date picker"
                    onClicked:{
                        stack.push(dateFrom);
                    }
                }
            }
        }




        Row{
            id: dateToRow
            anchors.top: dateFromRow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            width: parent.width
            height: 50
            Column{
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                Label{
                    text:"To: "+myBalance.dateTo.toISOString().split("T")[0]
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Column{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: parent.width/2
                anchors.topMargin: 5
                Button{
                    id:idDateTo
                    anchors.fill: parent
                    text:"Date picker"
                    onClicked:{
                        stack.push(dateTo);
                    }
                }
            }
        }






    }
}
