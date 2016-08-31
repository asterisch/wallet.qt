import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle{

    color:"yellow"

    property int cur
    property int purID
    property string viewCateg
    property double viewAmount
    property string viewNote
    property date viewDate
    property string viewPeople
    property string viewPayment
    property string viewPlace
    property string viewEvent


    ToolBar{
        id: toolBar10
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"View Purchase"}
        BackButton{}
        ToolButton
        {
            anchors.right: parent.right
            anchors.top: parent.top
            id:deletePurchase
            width: parent.height
            height:width
            Image
            {

                source: "images/delete.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:
            {
                msg.removePurchase(purID)
                stack.pop()
            }
        }
    }


    Column{
        id: col2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar10.bottom
        height: 30
        width: parent.width
        anchors.topMargin: 10
        anchors.margins: 3
        spacing: 15
        Row{
            width: parent.width
            height: 30
            Label{
                text:"Category: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewCateg
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"Money Spent: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewAmount
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"Note: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewNote
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }


        Row{
            width: parent.width
            height: 30
            Label{
                text:"Date: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewDate.toDateString()
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"With: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewPeople
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"Payment Method: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewPayment
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"Place: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewPlace
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }

        Row{
            width: parent.width
            height: 30
            Label{
                text:"Event: "
                font.pixelSize: 20
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left
            }
            Label{
                text:viewEvent
                font.pixelSize: 20
                font.bold: true
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right
            }
        }
    }
}

