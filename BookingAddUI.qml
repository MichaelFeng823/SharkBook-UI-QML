import QtQuick 2.0
import QtQuick.Controls 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:添加记账菜单界面
*/

Rectangle {
    id:bookingadd;
    color: "white";
    signal cancelPane(bool status);
    property string currentPageName;
    Rectangle{
        id:title;
        width: parent.width;
        height: parent.height * 0.07;
        color: "#f9db61";
        anchors.top: parent.top;
    }
    AnimationButtonInBook{
        id:expandButton;
        text:"支出";
        width:title.width / 5;
        height:title.height;
        anchors.right:title.horizontalCenter;
        anchors.top: title.top;
    }
    AnimationButtonInBook{
        id:incomeButton;
        text:"收入";
        width:title.width / 5;
        height:title.height;
        anchors.left:title.horizontalCenter;
        anchors.top: title.top;
    }
    Rectangle{
        id:slider;
        height: 2;
        width: expandButton.width * 0.5;
        color: "black";
        anchors.bottom: expandButton.bottom;
        x:expandButton.x + expandButton.width * 0.25;
    }
    ParallelAnimation {
        id:slidergif;
        NumberAnimation {
            target: slider;
            property: "x";
            to:expandButton.x + expandButton.width * 0.25;
            duration: 250;
        }
     }
    ParallelAnimation{
        id:slidergif1;
        NumberAnimation {
            target: slider;
            property: "x";
            to:incomeButton.x + incomeButton.width * 0.25;
            duration: 250;
        }
    }
    BaseButton{
        id:cancleButton;
        height: title.height;
        text:"取消";
        backgroundcolor: "transparent";
        fontsize:10;
        anchors.right: title.right;
        anchors.rightMargin: 15;
        onClicked: {
            cancelPane(true);
            expandmenuitem.initmodel();
            incomemenuitem.initmodel();
        }
    }
    StackView{
        id: stackview
        anchors {
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            top: title.bottom;
        }
        initialItem: expandmenu;
    }

    Item {
        visible: false;
        id: incomemenu;
        IncomeMenuItem{
            id:incomemenuitem;
        }
    }
    Item {
        visible: false;
        id: expandmenu;
        ExpandMenuItem{
            id:expandmenuitem;
        }
    }

    Rectangle{
        id:tips;
        property alias tipstext: text.text;
        color: "black";
        visible: true;
        opacity: 0;
        width: 70;
        height: 30;
        radius: 2;
        Text {
            id: text
            color: "ghostwhite";
            font.bold: true;
            text:"支出";
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
            anchors.centerIn: tips;
        }
        anchors.top: title.bottom;
        anchors.margins: 30;
    }
    ParallelAnimation{
        id:tipsopen;
        NumberAnimation {
            target: tips;
            property: "opacity";
            to:0.65
            duration: 250;
        }
    }
    ParallelAnimation{
        id:tipsclose;
        NumberAnimation {
            target: tips;
            property: "opacity";
            to:0;
            duration: 250;
        }
    }
    Timer{
        id:tipstimer;
        repeat: false;
        onTriggered: tipsclose.restart();
    }
    Component.onCompleted: {
        expandButton.clickedWithText.connect(bookingadd.switchPage);
        incomeButton.clickedWithText.connect(bookingadd.switchPage);
        expandButton.popTips.connect(bookingadd.onPopTips);
        incomeButton.popTips.connect(bookingadd.onPopTips);
    }
    function switchPage(pagenume)
    {
        if(pagenume === "支出" && pagenume !== currentPageName){
            slidergif.restart();
            stackview.replace(expandmenu,StackView.PopTransition)


        }
        else if(pagenume === "收入" && pagenume !== currentPageName){
            slidergif1.restart();
            stackview.replace(incomemenu,StackView.PushTransition)

        }
        currentPageName = pagenume;
    }

    function onPopTips(status,text){
        if(text === "支出"){
            tips.x = expandButton.x;
        }else if(text === "收入"){
            tips.x = incomeButton.x;
        }
        if(status === true){
            tips.tipstext = text;
            tipsopen.restart();
        }
        else{
            tipstimer.start(4000);
        }
    }
}

