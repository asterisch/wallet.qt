import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{

    color: "pink"

    ToolBar{
        id: toolBar7
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Budget Money"}
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
                if (amount.text.trim()!=="")
                {
                    myBalance.amount=amount.text.trim()
                }
                stack.pop();
            }
        }
    }



    Column{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar7.bottom
        anchors.margins: 20
        spacing: 20

        Row{
            width: parent.width
            height: 40
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                text: "Set Budget Amount"
                font.family: "Arial"
                font.bold: true
                font.pixelSize: 22
            }
        }

        Row{
            width: parent.width
            height: 60
            TextField{
                id: amount
                height: 50
                font.pixelSize: 16
                placeholderText: "Add Amount"
                anchors.leftMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Row{
            width: parent.width
            height: parent.height - 100
            Image{
                source: "images/Woooooo.png"
                width: 200
                height: 200
                anchors.margins: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }


        }




    }


}
