import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0


Rectangle{

    visible:true
    height: parent.height
    width: parent.width


    Component{
        id: newCategory
        NewCategory{}
    }

    ToolBar{

        id: toolBar5
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Choose Category"}
        BackButton{}
        ToolButton{

            id: addButton
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.height
            height: parent.height
            Image{
                source: "images/addIcon.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:{
                    stack.push(newCategory);
            }
        }
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar5.bottom
        color:"red"
        anchors.margins: 10
        GridView{

                id: myView
                anchors.fill: parent
                anchors.margins: 3
                clip: true
                cellWidth:60
                cellHeight:60
                model: msg.catModel
                delegate: activeDelegate
    }
    }

    Component{
        id: activeDelegate
        Item{
            width: 50
            height: 50
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    msg.categ=l.text
                    myPurchase.categ=l.text
                    stack.pop()
                }
            }

            Column{
                width: parent.width
                height:parent.height
                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:l
                    verticalAlignment: Text.AlignVCenter
                    height:(parent.width-5)/5
                    text:name
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
}
