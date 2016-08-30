import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3


Rectangle {

    color: "blue "

    Component{
        id: nw
        NewWallet{}
    }

    Component{
        id: mw
        MyWallet{}
    }



    ToolBar{

        id: toolBarmb
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"Money Manager"}
        BackButton{}

        ToolButton{

            id: newWalletButtonmb
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height
            width: parent.height
            Image{
                source: "images/addWallet1.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:{
                stack.push(nw);
            }
        }
    }
    ListView{

        id: listViewmb
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBarmb.bottom
        anchors.margins: 17

        Column{

            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 17


            MainButton{

                text:"My Wallet"
                onClicked:{
                    stack.push(mw);
                }
            }

            }

            //One more button fits here

        }

        //MainButton {text:"adfasfaf"}
        //MainButton {text:"Alex"}





    }


    //a form for:
    //adding money
    //((abstract some money ??))
    //deleting money completely
    //save some money -> an amount that must never be spent
    //set alarm for the balance



