import QtQuick 2.0
import QtQuick.Controls 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:图片按钮
*/

Button{
    property string data;
    property url imagepathOnClicked;
    property url imagepathOnReleased;
    id:button;
    checkable: true;
    autoExclusive: true;
    background: BorderImage {
        smooth: true;
        antialiasing:true;
        source:button.checked ? imagepathOnClicked : imagepathOnReleased ;
    }
}

