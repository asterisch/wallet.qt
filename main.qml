import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1


ApplicationWindow {

    visible: true
    width:400
    height:550

    Component{
        id: zero
        MainForm {}
    }

    StackView{

        id: stack
        anchors.fill: parent
        initialItem: zero
    }
}


/*
  HEIGHT
The window is 550 px
- 30 for the toolbar -> 520 px
- 150 for each button, lets say 3 buttons -> 70px
- we need 4 spacings -> 70/4 = 17.5 = 17px each spacing


*/
