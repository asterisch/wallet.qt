import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Rectangle{


    color: "orange"

    Component{
        id: categories
        ChooseCategory{}
    }

    Component{
        id: money
        MoneySpent{}
    }

    Component{
        id: date
        DatePicker{}
    }

    Component{
        id: method
        PaymentMethod{}
    }

    ToastComponent{
        id: toast
    }






    ToolBar{

        id: toolBar4
        width: parent.width
        height: 30
        anchors.right: parent.right
        anchors.left: parent.left
        TitleLabel {text:"New Purchase"}
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
                if (myPurchase.categ.trim().length!==0)
                {
                    if (myPurchase.amount!=0.0)
                    {
                        console.log(myPurchase.date.toISOString().split("T")[0])
                        if (myPurchase.date.toISOString().split("T")[0]!=="2000-01-01")
                        {
                            if(myPurchase.amount <= msg.curBalance()){
                                    myPurchase.place=placetxt.text
                                    myPurchase.note=notetxt.text
                                    myPurchase.people=peopletxt.text
                                    myPurchase.event=eventtxt.text

                                    msg.insertPurchase(myPurchase.categ,myPurchase.amount,myPurchase.note,myPurchase.date,myPurchase.people,myPurchase.payment,myPurchase.place,myPurchase.event)

                                    console.log("--------------------------")
                                    console.log("succesfull add new Purchase")
                                    console.log(myPurchase.categ)
                                    console.log(myPurchase.amount)
                                    console.log(myPurchase.note)
                                    console.log(myPurchase.date.toISOString().split("T")[0])
                                    console.log(myPurchase.people)
                                    console.log(myPurchase.payment)
                                    console.log(myPurchase.place)
                                    console.log(myPurchase.event)
                                    msg.changeBalance(msg.curBalance()-myPurchase.amount)
                                    console.log("--------------------------")
                                    console.log(msg.curBalance());
                                    console.log("--------------------------")
                                    stack.pop();
                                    console.log("----------DONE-----------")
                            }
                            else{
                                console.log("Failed! Amount greater than balance");
                                toast.show("---ATTENTION---")
                                toast.show("Amount GREATER than BALANCE",5000)
                            }
                        }else
                        {
                            console.log("Failed! date is Empty")
                            toast.show("Date is Empty")
                        }
                    }else
                    {
                        console.log("Failed! amount is Empty")
                        toast.show("Amount is Empty")
                    }
                }else
                {
                    console.log("Failed! Category is Empty")
                    toast.show("Category is Empty")
                }

            }

        }
    }







    Column{

        id: col
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: toolBar4.bottom
        height: 30

        anchors.topMargin: 10
        anchors.margins: 3
        spacing: 2

        Row{

            width: parent.width
            Button{
                id: button1
                width: parent.width
                height: 30
                Text{
                    id: categtxt
                    text:"Choose Category"
                    //color: "red"
                    anchors.margins: 5
                    anchors.left: imgLeft1.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text
                {
                    text:myPurchase.categ
                    anchors.verticalCenterOffset: 0
                    anchors.leftMargin: 274
                    color:"red"
                    font.italic: true
                    font.bold: true
                    font.family: Arial
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    id: imgLeft1
                    source:"images/categories.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(categories);
                }
            }
        }

        Row{

            width: parent.width
            Button{

                id: button2
                width: parent.width
                height: 30
                Text{

                    text:"Money Spent"
                    anchors.margins: 5
                    anchors.left: imgLeft2.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text
                {
                    text:myPurchase.amount
                    anchors.verticalCenterOffset: 0
                    anchors.leftMargin: 274
                    color:"orange"
                    font.italic: true
                    font.bold: true
                    font.family: Arial
                    anchors.horizontalCenter: parent.horizontalCenter
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

                    id: imgLeft2
                    source:"images/euro.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(money);
                }

            }
        }



        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect1
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft11
                    source:"images/note.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: notetxt
                height: 30
                placeholderText: "Add a Note"
                anchors.leftMargin: 1
                anchors.left: rect1.right
                anchors.right: parent.right
            }
        }



        Row{

            width: parent.width
            Button{

                id: button3
                width: parent.width
                height: 30
                Text{

                    text:"Date"
                    anchors.margins: 5
                    anchors.left: imgLeft3.right
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text
                {
                    text:dater()
                    anchors.verticalCenterOffset: 0
                    anchors.leftMargin: 274
                    color:"blue"
                    font.italic: true
                    font.bold: true
                    font.family: Arial
                    anchors.horizontalCenter: parent.horizontalCenter
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

                    id: imgLeft3
                    source:"images/calendar.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(date);
                }
            }
        }





        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: peopletxt
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }




        Row{

            width: parent.width
            Button{

                id: button4
                width: parent.width
                height: 30
                Text{

                    text:"Payment Method"
                    //color: "red"
                    anchors.margins: 5
                    anchors.left: imgLeft4.right
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

                    id: imgLeft4
                    source:"images/payment.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked:{
                    stack.push(method);
                }
            }
        }





        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect3
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft13
                    source:"images/place.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: placetxt
                height: 30
                placeholderText: "Place"
                anchors.leftMargin: 1
                anchors.left: rect3.right
                anchors.right: parent.right
            }
        }





        Row{
            id:lastRow
            width: parent.width
            height: 30
            Rectangle{

                id: rect4
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft14
                    source:"images/event.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: eventtxt
                height: 30
                placeholderText: "Event"
                anchors.leftMargin: 1
                anchors.left: rect4.right
                anchors.right: parent.right
            }
        }


    }
    Rectangle{
            color:"lightgrey"
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            height: 90
            width: parent.width
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 42
                color:"red"
                text:msg.curBalance()
            }
        }

}
