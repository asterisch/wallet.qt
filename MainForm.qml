import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3


Rectangle {

    color: "blue"

    Component{
        id: mb
        MyBalance{}
    }


    Component{
        id: mp
        MyPurchases{}
    }




    ToolBar{

        id: toolBar1
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Money Manager"}

    }

    ListView{

        id: listView1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar1.bottom
        anchors.margins: 17

        Column{

            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 17

            MainButton{

                text:"My Balance"
                onClicked:{
                    stack.push(mb);
                }
            }


            MainButton{

                text:"My purchases"
                onClicked:{
                    stack.push(mp);
                }
            }

            //One more button fits here

        }

        //MainButton {text:"adfasfaf"}
        //MainButton {text:"Alex"}
    }
}
