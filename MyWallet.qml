import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
Rectangle{

    color: "orange"

    ToolBar{

        id: tBmW
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"My Wallet"}
        BackButton{}

        ToolButton{

            id: sBnW
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.height
            height: parent.height
            Image{

                source: "images/deleteWallet1.png"
                anchors.fill: parent
                anchors.margins: 1
            }
        }
    }

    Column{

        id: cmW
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: tBmW.bottom
        height: 30

        //color: "lightblue"

        anchors.topMargin: 10
        anchors.margins: 3
        spacing: 2
        //border.width: 2
        //border.color: "white"


            //onClicked: {}

        Row{

            width: parent.width
            Button{

                id: buttonmW1
                width: parent.width
                height: 30
                Text{

                    id: textLeftmW1
                    text:"Hmerominia "
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{

                    text:"Xrimata pou skodeutikan"
                    //color: "red"
                    anchors.margins: 5
                    anchors.left: textLeftmW1.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image{

                    source:"images/rr.png"
                    width: parent.height
                    height: parent.height
                    anchors.margins: 1
                    anchors.right: parent.right
                }


                //onClicked: {}

            }
        }

        }
    }

