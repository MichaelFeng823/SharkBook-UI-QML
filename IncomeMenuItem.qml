import QtQuick 2.0
import QtQuick.Controls 2.12;

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:添加记账 收入界面
*/

Rectangle {
    id:incomeMenuItem;
    color: "white";
    anchors.fill: parent;
    GridView{
        id:listview;
        width: parent.width;
        height: parent.height;
        anchors.fill: parent;
        cellWidth: width / 4;
        cellHeight: listview.height/35*33/7.5+15;
        clip: true;
        model:listmodel;
        delegate: picItem;
    }
    ListModel{
        id:listmodel;
    }
    Component{
        id: picItem;
        Button {
            id:picbutton;
            width: listview.cellWidth;
            height: listview.cellHeight;
            checkable: true;
            checked: Checked;
            autoExclusive: true;
            onClicked:{
                console.log("onCheckedChanged-index:",index);
                listmodel.setProperty(index,"Checked",true);
            }
            BorderImage {
                id: borderimage
                smooth: true;
                antialiasing:true;
                source: picbutton.checked ? imageClickedPath : imagePath;
                anchors.fill: picbutton;
            }
            // 通过这两行输出可以看出，代理时动态创建销毁视图项显示数据的，大数据显示无压力
            Component.onCompleted: console.log(index + "create")
            Component.onDestruction: console.log(index + "destory")
        }
    }

    Component.onCompleted: {
        console.log("收入菜单初始化构建");
        initmodel();
    }

    function initmodel()
    {
        listmodel.clear();
        for(var i = 1; i <= 5; i++){
            listmodel.append({"ID":i,"Checked":false,"imagePath":"./image/income_"+i+".jpg","imageClickedPath":"./image/income_"+i+"_clicked.jpg"});
        }
        listmodel.append({"ID":6,"Checked":false,"imagePath":"./image/income_"+6+".jpg","imageClickedPath":"./image/income_"+6+".jpg"});
    }
}
