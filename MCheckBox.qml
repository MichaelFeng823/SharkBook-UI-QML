import QtQuick 2.14
import QtQuick.Controls 2.0
/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:登陆界面 复选框
*/
Item {
    property alias text : chcekbox.text;
    property alias body : chcekbox;
    CheckBox{
        id:chcekbox;
        text: "";
        font.pointSize: 10;
        indicator: Rectangle {
                     width: 20;
                     height: 20;
                     radius: 3;
                     border.color: chcekbox.down ? "#17a81a" : "#21be2b";

                     Rectangle {
                         width: 16;
                         height: 16;
                         x: 2;
                         y: 2;
                         radius: 2;
                         color: chcekbox.down ? "#17a81a" : "#21be2b";
                         visible: chcekbox.checked;
                     }
                     anchors.verticalCenter: chcekbox.verticalCenter;
                 }
        contentItem: Text {
                     text: chcekbox.text;
                     font: chcekbox.font;
                     opacity: enabled ? 1.0 : 0.3;
                     verticalAlignment: Text.AlignVCenter;
                     leftPadding: chcekbox.indicator.width;
                 }
    }
}
