import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
Rectangle{

    color: "blue"

    ToolBar{

        id: tBnW
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"New Wallet"}
        BackButton{}

        ToolButton{

            id: sBnW
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.height
            height: parent.height
            Image{

                source: "images/ok.png"
                anchors.fill: parent
                anchors.margins: 1
            }
        }
    }

    Column{

        id: cnW
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: tBnW.bottom
        height: 30

        //color: "lightblue"

        anchors.topMargin: 10
        anchors.margins: 3
        spacing: 2
        //border.width: 2
        //border.color: "white"

    Row{

        width: parent.width
        height: 30
        Rectangle{

            id: rnW
            width: parent.height
            height: parent.height
            color: "gainsboro"
            Image{

                id: imgLeftnW
                source:"images/wallet.png"
                width: parent.height
                height: parent.height-6
                anchors.margins: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        TextField{

            id: tFnW
            height: 30
            placeholderText: "Set Wallet's Name"
            anchors.leftMargin: 1
            anchors.left: rnW.right
            anchors.right: parent.right
        }
    }

    Row{

        width: parent.width
        height: 30
        Rectangle{

            id: rnW1
            width: parent.height
            height: parent.height
            color: "gainsboro"
            Image{

                id: imgLeftnW1
                source:"images/euro.png"
                width: parent.height
                height: parent.height-6
                anchors.margins: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        TextField{

            id: tFnW1
            height: 30
            placeholderText: "Set Budget"
            anchors.leftMargin: 1
            anchors.left: rnW1.right
            anchors.right: parent.right
        }
    }

    Row{

        width: parent.width
        Button{

            id: bnW2
            width: parent.width
            height: 30
            Text{

                text:"Payment Methods"
                //color: "red"
                anchors.margins: 5
                anchors.left: imgLeftnW2.right
                anchors.verticalCenter: parent.verticalCenter
            }
            Image{

                source:"images/rr.png"
                width: parent.height
                height: parent.height
                anchors.margins: 1
                anchors.right: parent.right
            }
            Image{

                id: imgLeftnW2
                source:"images/payment.png"
                width: parent.height
                height: parent.height-6
                anchors.margins: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            //onClicked: {}
        }
    }

    Row{

        width: parent.width
        Button{

            id: bnW3
            width: parent.width
            height: 30
            Text{

                text:"Set Period"
                //color: "red"
                anchors.margins: 5
                anchors.left: imgLeftnW3.right
                anchors.verticalCenter: parent.verticalCenter
            }
            Image{

                source:"images/rr.png"
                width: parent.height
                height: parent.height
                anchors.margins: 1
                anchors.right: parent.right
            }
            Image{

                id: imgLeftnW3
                source:"images/calendar.png"
                width: parent.height
                height: parent.height-6
                anchors.margins: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            //onClicked: {}
        }
    }



    Row{

        width: parent.width
        height: 30
        Rectangle{

            id: rnW4
            width: parent.height
            height: parent.height
            color: "gainsboro"
            Image{

                id: imgLeftnW4
                source:"images/note.png"
                width: parent.height
                height: parent.height-6
                anchors.margins: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        TextField{

            id: tFnW4
            height: 30
            placeholderText: "Add a Note"
            anchors.leftMargin: 1
            anchors.left: rnW4.right
            anchors.right: parent.right
        }
    }

  }
}
