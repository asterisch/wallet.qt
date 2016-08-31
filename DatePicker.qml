import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{

    ToolBar{

        id: toolBar8
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Pick Date"}
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


                myPurchase.date = cal.selectedDate

                console.log(myPurchase.date.toDateString())
                console.log(myPurchase.date.toLocaleDateString())
                console.log(myPurchase.date.toISOString())
                console.log(myPurchase.date.toUTCString())
                console.log(myPurchase.date.toLocaleString())
                console.log(myPurchase.date.toString())
                console.log(myPurchase.date.toJSON())
                stack.pop();
            }

        }
    }
    Text
    {
        id:temp
        visible: false
        text:new Date().setDate(cal.selectedDate)
    }

    Rectangle{
        anchors.top: toolBar8.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        Calendar{
            id: cal
            anchors.fill: parent
            weekNumbersVisible: true
            dayOfWeekFormat: Locale.NarrowFormat

        }

    }




}


