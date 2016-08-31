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

                        if (myPurchase.date.toISOString().split("T")[0]!=="2000-01-01")
                        {
                                myPurchase.place=placetxt.text
                                if (myPurchase.place.trim().length!=0)
                                {
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
                                    stack.pop();
                                    console.log("----------DONE-----------")
                                }else
                                {
                                    console.log("Failed! place is Empty")

                                }
                        }else
                        {
                            console.log("Failed! date is Empty")
                        }
                    }else
                    {
                        console.log("Failed! amount is Empty")
                    }
                }else
                {
                    console.log("Failed! Category is Empty")
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
                    text:"Choose Category"
                    //color: "red"
                    anchors.margins: 5
                    anchors.left: imgLeft1.right
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










//Add button for picture usage AND camera capture



/*

        //////////////////////////////////////////////////////////////////////


        //Just for testing reasons
        //these rows are used to see how scroll works. It does not :P


        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2qw
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12w
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2we
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2bnmnbnm
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12we
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2wexxfxv
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2nm
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12wewdwfw
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2weffgfg
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2we
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12weklkl
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2welll
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2eeee
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12ee
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2e
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2ewe
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12www
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2wewewe
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2w
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12ewewe
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2wfds
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2d
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12sdsd
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2fgfgfgfgfgfggffg
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2sdsd
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12sdsdkl
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2sdsd
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }
        Row{

            width: parent.width
            height: 30
            Rectangle{

                id: rect2sssss
                width: parent.height
                height: parent.height
                color: "gainsboro"
                Image{

                    id: imgLeft12sssssssss
                    source:"images/with.png"
                    width: parent.height
                    height: parent.height-6
                    anchors.margins: 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            TextField{

                id: textField2ssssss
                height: 30
                placeholderText: "With"
                anchors.leftMargin: 1
                anchors.left: rect2.right
                anchors.right: parent.right
            }
        }




*/

    }

}
