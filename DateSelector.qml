import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
/*
Anthor:@MichaelFeng
Date:2023/07/20
biref:日期选择控件
*/
Popup{
    id:popup;
    implicitHeight: parent.height;
    implicitWidth: parent.width;
    background:Rectangle{
        //半透明背景
        id:backgroundRect;
        color: Qt.rgba(0,0,0,0.6);
        width: parent.width;
        height: parent.height;
        enum TypeDate{YearMonthDay,YearMonth,Year}
        Rectangle{
            id:frame;
            color: Qt.lighter("white");
            height: parent.height * 0.35;
            width: parent.width;
            Rectangle{
                id:title;
                opacity: 1.0;
                height: parent.height * 0.15;
                width: parent.width;
                BaseButton{
                    id:cancelButton;
                    height: parent.height;
                    width: parent.width * 0.15;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    text: qsTr("取消");
                    onClicked: popup.close();
                }
                Text {
                    id: titleText;
                    text: qsTr("选择月份");
                    height: parent.height;
                    width: parent.width * 0.7 - 40;
                    anchors.left: cancelButton.right;
                    horizontalAlignment: Text.AlignHCenter;
                    verticalAlignment: Text.AlignVCenter;
                }
                BaseButton{
                    id:makesureButton;
                    width: cancelButton.width;
                    height: cancelButton.height;
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    text: qsTr("确定");
                }
                Shape {
                    z:1000;
                    ShapePath {
                        strokeWidth: 1;
                        strokeColor: "gainsboro"
                        strokeStyle: ShapePath.SolidLine
                        startX: 0;
                        startY: 0 + title.height;
                        PathLine {
                            x: 0 + title.width;
                            y: 0 + title.height;
                        }
                    }
                }
            }
            Rectangle{
                id:bottomArea;
                height: parent.height * 0.85;
                width: parent.width;
                anchors.top: title.bottom;
                anchors.left: title.left;
                Row{
                    ScrollSelectorControl{
                        id:yearview;
                        model:yearmodel;
                        width: bottomArea.width * 0.2;
                        height: parent.height;
                    }
                    ScrollSelectorControl{
                        id:monthview;
                        model:monthmodel;
                        width: bottomArea.width * 0.2;
                        height: parent.height;
                        onCurrentIndexChanged:{
                            onMonthIndexChanged();
                        }
                    }
                    ScrollSelectorControl{
                        id:dayview;
                        model:daymodel;
                        width: bottomArea.width * 0.2;
                        height: parent.height;
                    }
                    anchors.fill: parent;
                    anchors.leftMargin: bottomArea.width * 0.2;
                    anchors.rightMargin: bottomArea.width * 0.2;
                    anchors.topMargin: bottomArea.height * 0.1;
                    anchors.bottomMargin: bottomArea.height * 0.1;
                }
                ListModel{
                    id:yearmodel;
                }
                ListModel{
                    id:monthmodel;
                }
                ListModel{
                    id:daymodel;
                }
            }
            anchors.bottom: backgroundRect.bottom;
            anchors.left: backgroundRect.left;
        }
    }
    Component.onCompleted: {
        initYearModel();
        initMonthModel();
        initDayModel();
        popup.open();
    }
    function initYearModel(){
        yearmodel.clear();
        var date = new Date();
        var year = Number(date.getFullYear());
        for(var j = 0; j < 20; j++){
            yearmodel.append({"NumDate":year + j - 10});
        }
    }
    function initMonthModel(){
        monthmodel.clear();
        monthmodel.append({"NumDate":12});
        for(var i = 1; i < 13; i++){
            monthmodel.append({"NumDate":i});
        }
        //monthmodel.append({"NumDate":1});
    }
    function initDayModel(){
        daymodel.clear();
        daymodel.append({"NumDate":31});
        for(var i = 1; i <= 31; i++){
            daymodel.append({"NumDate":i});
        }
        //daymodel.append({"NumDate":1});
    }
    function initDayModelByMonth(days){
        initDayModel();
        if(days === 30){
            daymodel.remove(31);
            daymodel.remove(0);
            daymodel.insert(0,{"NumDate":30});
            dayview.currentIndex = 0;
        }
        else if(days === 28){
            if(daymodel.count >29){
                daymodel.remove(31);
                daymodel.remove(30);
                daymodel.remove(29);
                daymodel.remove(0);
                daymodel.insert(0,{"NumDate":28});
                dayview.currentIndex = 0;
            }
        }
    }
    function onMonthIndexChanged(){
        console.log(monthmodel.get(monthview.currentIndex+1).NumDate);
        var monthnum = monthmodel.get(monthview.currentIndex+1).NumDate;
        if(monthnum === 1 | monthnum === 3 | monthnum === 5 | monthnum === 7| monthnum === 8 | monthnum === 10 | monthnum === 12){
            initDayModelByMonth(31);
        }else if(monthnum === 2){
            initDayModelByMonth(28);
        }else if(monthnum === 4 | monthnum === 6 | monthnum === 9 | monthnum === 11){
            initDayModelByMonth(30);
        }
    }
}

