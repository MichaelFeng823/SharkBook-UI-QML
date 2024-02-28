import QtQuick 2.0
import QtQuick.Controls 2.12
//MainArea.qml
/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:主界面
*/

Item {
   id:mainarea;
   width: parent.width;
   height: parent.height;
   Loader{
       id:mainpageloder;
       z:1000;
       anchors.fill: parent;
   }
   ButtonGroup{
       id:buttonGroup;
       buttons:row.children;
       onClicked: load_page(button.data);
   }
   Row{
       id:row;
       anchors.bottom: parent.bottom;
       PicButton{
           id:detailButton;
           data:"detailPage";
           checked: true;
           width: mainarea.width / 5;
           height: mainarea.height / 16;
           imagepathOnClicked: "./image/DetialBottomIcon_Clicked.jpg";
           imagepathOnReleased: "./image/DetialBottomIcon.jpg";

       }
       PicButton{
           id:chartButton;
           data:"chartPage";
           width: detailButton.width;
           height: detailButton.height;
           imagepathOnClicked: "./image/PicChartIcon_Clicked.jpg";
           imagepathOnReleased: "./image/PicChartIcon.jpg";
       }
       PicButton{
           id:addButton;
           checkable:false;
           autoExclusive:false;
           data:"BookingAddPage";
           width: detailButton.width;
           height: detailButton.height;
           imagepathOnClicked: "./image/AddIcon.jpg";
           imagepathOnReleased: "./image/AddIcon.jpg";
       }
       PicButton{
           id:findButton;
           data:"FindPage";
           width: detailButton.width;
           height: detailButton.height;
           imagepathOnClicked: "./image/FindIcon_Clicked.jpg";
           imagepathOnReleased: "./image/FindIcon.jpg";
       }
       PicButton{
           id:mineButton;
           data:"minePage";
           width: detailButton.width;
           height: detailButton.height;
           imagepathOnClicked: "./image/MineIcon_Clicked.jpg";
           imagepathOnReleased: "./image/MineIcon.jpg";
       }
   }

    StackView {
       id: mystackview
       anchors {
           left: parent.left;
           right: parent.right;
           bottom: row.top;
           top: parent.top;
       }
       replaceEnter:Transition {
           enabled: false;
       }
       initialItem: detail_page;
       }

    function load_page(page) {
            console.log("open page is :",page);
            switch (page) {
            case 'detailPage':
                mystackview.replace(detail_page);
                break;
            case 'chartPage':
                mystackview.replace(chart_page);
                break;
            case 'BookingAddPage':
                bookingadd_page.open();
                break;
            case 'FindPage':
                mystackview.replace(find_page);
                break;
            case 'minePage':
                mystackview.replace(mine_page);
                break;
            }
        }
    Item {
            id: detail_page;
            visible: false;
            DetailUI{}
    }
    Item {
            id: chart_page;
            visible: false;
            ChartAreaUI{}
    }
    Popup {
            id: bookingadd_page
            implicitHeight:mainarea.height;
            implicitWidth:mainarea.width;
            background: BookingAddUI{
                id:bookingadd_ui;
                anchors.fill:parent;
                height:mainarea.height;
                width:mainarea.width;
            }
            enter:Transition {
               NumberAnimation { property: "y"; from:mainarea.height; to:0;duration: 300;}
            }
            exit:Transition {
               NumberAnimation { property: "y"; from:0; to:mainarea.height;duration: 300;}
            }
            onOpened: {


            }
            Component.onCompleted: {
                //load_page("detailPage");
                bookingadd_ui.cancelPane.connect(mainarea.closeBookAddPage);
            }
    }
    Item {
            id: find_page;
            visible: false;
            FindUI{}
    }
    Item {
            id: mine_page;
            visible: false;
            MineAreaUI{}
    }
    function closeBookAddPage(status){
        bookingadd_page.close();
    }
    function onOpenDateSelector(){
        console.log("onOpenDateSelector");
        mainpageloder.source = "";
        mainpageloder.source = "DateSelector.qml";
    }
}
