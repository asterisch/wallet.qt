import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{


    FileDialog{
        id: fileDialog
        nameFilters: ["Image files (*.jpg *.png)"]
        title: "Please select a file"
        folder: shortcuts.pictures
        selectFolder: false
        selectMultiple: false
        selectExisting: true
        onAccepted:{
            console.log("You Choose: "+fileDialog.fileUrls)
            catImg.source=fileDialog.fileUrl;
            fileDialog.close();
        }
        onRejected:{
            console.log("Canceled")
            fileDialog.close();
        }
        Component.onCompleted: visible = false
    }


    ToolBar{
        id: toolBar6
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"New Category"}
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
                msg.insertCategory(name.text,catImg);
                stack.pop();
            }
        }
    }



        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.top: toolBar6.bottom
            anchors.margins: 20
            spacing: 20

            Column{
                Label{
                    anchors.right: parent.right
                    height: 30
                    text: "Category"
                    verticalAlignment: Qt.AlignVCenter
                }
                Rectangle
                {
                    width:100
                    height:100
                    border.width: 1
                    Image
                    {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top:parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: 1
                        id:catImg
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
            Column{
                TextField{
                    id: name
                    height: 30
                    font.pixelSize: 16
                    font.family: "Arial"
                }
                Button
                {
                    width:30
                    height:30
                    Image
                    {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top:parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: 1
                        source: "images/cameraIcon.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    onClicked:
                    {
                        fileDialog.open();
                    }
                }
            }
        }
}
