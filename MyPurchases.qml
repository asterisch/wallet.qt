import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle {

    color: "magenta"
    Item
    {
        id: myPurchase
        property int newID
        property string categ: ""
        property double amount: 0.0
        property string note: ""
        property date date: new Date()
        property string people: ""
        property string payment: "cash"
        property string place: ""
        property string event: ""
    }

    Component{
        id: np
        NewPurchase{}
    }

    Component{
        id: vp
        ViewPurchase{}
    }

    GridView{
        id: gridView1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar2.bottom
        anchors.margins: 15 //-------------------------------------------
        cellWidth: 90
        cellHeight: 90
        model: msg.purModel
        delegate: Rectangle{
            id:pur
            border.width: 2
            width: gridView1.cellWidth - 10
            height: width
            color:"red"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log(purchaseID.text)
                    stack.push({item:vp, properties:{purID:purchaseID.text, viewCateg:category, viewAmount:amount, viewNote:note, viewDate:date, viewPeople:people, viewPayment:payment, viewPlace:place, viewEvent:event}});
                }
            }
            Column{
                width: parent.width
                height: parent.height
                /*Image{
                    source:"images/back.png"
                    anchors.fill: parent
                    anchors.margins: 1
                    width: parent.width
                    height: parent.height
*/
                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:l2
                    verticalAlignment: Text.AlignVCenter
                    height:parent.height*0.3
                    text:date.toDateString()
                    font.pixelSize: 10

                }
                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:l
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    height:parent.height*0.3
                    text:category
                }

                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:l3
                    font.italic: true
                    verticalAlignment: Text.AlignVCenter
                    height:parent.height*0.3
                    text:amount+" €"
                }
                Label
                {
                    id: purchaseID
                    visible: false
                    text: id
                }

            }
        }
        //the purchases must be shown here as a grid view, like the main form of the recipes brakas app
        //clickable in order to show some more info
        //with icon
        //we will have some icons to choose from: clothes, food, drink, supermarket, car, entertainment, beauty ...
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
                myPurchase.categ=""
                myPurchase.amount=0.0
                myPurchase.note=""
                myPurchase.date="2000-01-01"
                myPurchase.people=""
                myPurchase.payment="cash"
                myPurchase.place=""
                myPurchase.event=""
                stack.push(np);
            }
        }
    }

    function dater()
    {
        var year=parseInt(myPurchase.date.toISOString().split("T")[0].split("-")[0]);
        var month=parseInt(myPurchase.date.toISOString().split("T")[0].split("-")[1]);
        var day=parseInt(myPurchase.date.toISOString().split("T")[0].split("-")[2]);
        day=day+1;
        if(year===2000 && month===1 && day===2)
        {
            return " "
        }
        if (month%2!=0)
        {
            if(day>30)
            {
                month=month+1;
                day=1;
                if(month===12)
                {
                    year=year+1;
                    month=1;
                }
            }
        }
        else
        {
            if(day>31)
            {
                month=month+1;
                day=1;
                if(month===12)
                {
                    year=year+1;
                    month=1;
                }
            }
            if (month===2 && day>28)
            {
                month=month+1;
                day=1;
            }
        }
        return day.toString()+"-"+month.toString()+"-"+year.toString()
    }
}
