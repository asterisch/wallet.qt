import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{

    visible:true
    height: parent.height
    width: parent.width

    ToolBar{
        id: toolBar9
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Payment Method"}
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
            //onClicked:{}
        }
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar9.bottom
        color:"pink"
        anchors.margins: 10
        ListView{
            id: myView
            anchors.fill: parent
            anchors.margins: 3
            clip: true
            ExclusiveGroup{id: radioButtonGroup}
            model: listModel
            delegate: activeDelegate
        }
    }

    Component{
        id: activeDelegate
        Item{
            width: parent.width
            height: 30
            Row{
                width: parent.width
                height:parent.height
                RadioButton{
                    text:name;
                    exclusiveGroup: radioButtonGroup
                }
                Image{
                    id:img
                    anchors.right: parent.right
                    height: parent.height
                    width: parent.height
                    fillMode: Image.PreserveAspectFit
                    source:imgPath
                }
            }
        }
    }


    ListModel{
        id: listModel
        ListElement{
            name:"cash"
            imgPath:"images/cash.png"
        }
        ListElement{
            name:"credit card"
            imgPath:"images/CreditCard.png"
        }
        ListElement{
            name:"check"
            imgPath:"images/check.png"
        }
        ListElement{
            name:"other"
            imgPath:"images/other.png"
        }
    }
}
