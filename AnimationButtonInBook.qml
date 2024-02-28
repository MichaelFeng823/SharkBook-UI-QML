import QtQuick 2.0
import QtQuick.Controls 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:添加记账菜单界面 支出 / 收入 长按切换
*/

Button{
    signal clickedWithText(string text);
    signal popTips(bool status,string text);
    property bool ispressed: false;
    property int isLongPressed: 0;
    id:animationbutton;
    background: Rectangle{
        id:buttonbackground;
        opacity: 0;
        color: "gray";
        }
    contentItem: Text{
                text: animationbutton.text;
                font.bold: true;
                font.pointSize: 15;
                color: "black";
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
    onPressed: {
        timer.restart();
        btngif.restart();
        clickedWithText(animationbutton.text);
    }
    onReleased: {
        if(isLongPressed >= 2)
            popTips(false,animationbutton.text);
        isLongPressed = 0;
        timer.stop();
        btngif1.restart();
    }
    ParallelAnimation {
        id:btngif;
        NumberAnimation {
            target: buttonbackground;
            property: "opacity";
            to:0.5;
            duration: 500
            easing.type: Easing.InOutQuad
        }
     }
    ParallelAnimation{
        id:btngif1;
        NumberAnimation {
            target: buttonbackground;
            property: "opacity";
            to:0.0;
            duration: 500
        }
    }
    Timer{
        id:timer;
        repeat: true;
        interval: 500;
        onTriggered: {
            isLongPressed += 1;
            console.log("isLongPressed:",isLongPressed);
            if(isLongPressed == 2){
                popTips(true,animationbutton.text);
            }
        }
    }

}
