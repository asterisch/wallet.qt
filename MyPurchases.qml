import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle {

    color: "magenta"

    Component{
        id: np
        NewPurchase{}
    }

    ToolBar{

        id: toolBar2
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Money Manager"}
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
                stack.push(np);
            }
        }
    }

    GridView{

        id: gridView1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar2.bottom
        anchors.margins: 15 //-------------------------------------------

        cellWidth: 150
        cellHeight: 150


        //the purchases must be shown here as a grid view, like the main form of the recipes brakas app
        //clickable in order to show some more info
        //with icon
        //we will have some icons to choose from: clothes, food, drink, supermarket, car, entertainment, beauty ...


    }


}
