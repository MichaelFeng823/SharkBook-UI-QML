import QtQuick 2.0
import QtQuick.Controls 2.12
/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:基础按钮控件
*/
Button{
    id:basebutton;
    property  alias backgroundcolor: buttonbackground.color;
    property alias fontsize: contentText.font.pointSize;
    background: Rectangle{
        id:buttonbackground;
        }
    contentItem: Text{
        id:contentText;
        text: basebutton.text;
        color: "black";
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        }
}
