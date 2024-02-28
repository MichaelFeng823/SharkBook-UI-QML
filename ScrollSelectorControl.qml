import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
//滚动筛选区
ListView{
    id:listview;
    property alias model:listview.model;
    width: parent.width * 0.2;
    height: parent.height;
    snapMode: ListView.SnapOneItem;                  //单张切换
    highlightRangeMode: ListView.StrictlyEnforceRange;   //currentindex 动态切换
    boundsBehavior:Flickable.StopAtBounds;           //禁止到view边缘滑动
    delegate: selectoritem;
    clip: true;
    Shape {
        z:1000;
        ShapePath {
            strokeWidth: 2;
            strokeColor: "gainsboro"
            strokeStyle: ShapePath.SolidLine
            startX: 0 + listview.width * 0.1;
            startY: 0 + listview.height / 3 * 1;
            PathLine {
                x: 0 + listview.width * 0.9;
                y: listview.y + listview.height / 3 * 1;
            }
        }
    }
    Shape {
        z:1000;
        ShapePath {
            strokeWidth: 2;
            strokeColor: "gainsboro"
            strokeStyle: ShapePath.SolidLine
            startX: 0 + listview.width * 0.1;
            startY: 0 + listview.height / 3 * 2;
            PathLine {
                x: 0 + listview.width * 0.9;
                y: listview.y + listview.height / 3 * 2;
            }
        }
    }
    Rectangle{
        z:1003;
        color: "white";
        opacity: 0.7;
        width: listview.width;
        height: listview.height / 3;
        anchors.left: listview.left;
        anchors.top: listview.top;
    }
    Rectangle{
        z:1003;
        color: "white";
        opacity: 0.7;
        width: listview.width;
        height: listview.height / 3;
        anchors.left: listview.left;
        anchors.bottom: listview.bottom;
    }
    Component{
        id: selectoritem;
        Rectangle{
            id:back;
            width: listview.width;
            height: listview.height / 3;
            Text {
                id: numdate
                text: NumDate;
                width: listview.width;
                height: listview.height / 3;
                font.pointSize: 11;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }
        }
    }
}
