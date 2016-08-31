import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle {
    Item
    {
        id: myBalance
        property int newID
        property double amount:msg.curBalance()
        property date dateFrom:msg.curDateFrom()
        property date dateTo:msg.curDateTo()
    }

    color: "blue"

    Component{
        id: sb
        SetBudget{}
    }

    Component{
        id: eb
        EditBudget{}
    }

    ToolBar{
        id: toolBar12
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"My Budgets"}
        BackButton{}

        ToolButton{

            id: addButton
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height
            width: parent.height
            Image{
                source: "images/addIcon.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:{
                myBalance.amount=0.0
                myBalance.dateFrom="2000-01-01"
                myBalance.dateTo="2000-01-01"
                stack.push(sb);
            }
        }
    }

    Rectangle{

        id: currentBudget
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: toolBar12.bottom
        anchors.margins: 3
        color:"pink"
        width: parent.width
        height: 200

        Row{
            anchors.fill: parent
            Column{
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width: 220//160
                Calendar{
                    minimumDate: myBalance.dateFrom
                    maximumDate: myBalance.dateTo
                    selectedDate: new Date(); //displays the current date
                    anchors.fill: parent
                }
            }
            Column{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                height: parent.height
                width:parent.width - 220
                Row{
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    width: parent.width
                    height: parent.height/3
                    Label{
                        text:myBalance.amount
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Row{
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    width: parent.width
                    height: (parent.height/3)*2
                    Button{
                        anchors.margins: 25
                        anchors.fill: parent
                        text:"EDIT"
                        onClicked:{
                            stack.push({item:eb, properties:{editAmount:myBalance.amount,editDateFrom:myBalance.dateFrom, editDateTo:myBalance.dateTo}});
                            //amount:myBalance.amount
                        }
                    }
                }
            }
        }
    }

    ListView{
            id: listView1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: currentBudget.bottom
            anchors.margins: 30 //-------------------------------------------
            model: msg.budModel
            delegate: Item{
                id:item
                width: listView1.width
                height: 30
                MouseArea{
                    anchors.fill: parent
                    //onclicked:
                    Row{
                        width: parent.width
                        spacing: 5
                        Label{
                            id:label
                            text:dateFrom.toISOString().split("T")[0]+" --- "+dateTo.toISOString().split("T")[0]+" : "+amount.toString()+" €"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
}
