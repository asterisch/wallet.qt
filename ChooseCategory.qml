import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0


Rectangle{

    visible:true
    height: parent.height
    width: parent.width


    Component {
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

        ToolButton{

            id: addButton
            anchors.right: saveButton.left
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


    property int currentIndex: 100


    ListModel{
        id: listModel

        ListElement{
            //id: cloothes
            cat: "clothes"
            imgPath:"images/coffee.png"
            //onClicked:{
              //  currentIndex = 0
            //}
        }
        ListElement{
            //d: drinks
            cat: "drinks"
            //onClicked:{
              //  currentIndex = 1
            //}
        }
    }


    Rectangle{

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar5.bottom

        color:"red"
        anchors.margins: 10

        ListView{

            id: myView
            anchors.fill: parent
            anchors.margins: 3
            clip: true
            ExclusiveGroup{id: radioButtonGroup}
            //model: listModel
            model: msg.catModel
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
                RadioButton{
                    //text:name;
                    text:cat;
                    exclusiveGroup: radioButtonGroup
                }

                Image{

                    id:img
                    anchors.right: parent.right
                    height: 30//parent.height
                    width: 30//parent.height
                    //fillMode: Image.PreserveAspectFit
                    source:imgPath
                }
            }

            //MouseArea



        }




    }





}
