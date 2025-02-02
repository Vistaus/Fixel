import QtQuick 2.2
import QtQuick.Window 2.2
import Ubuntu.Components 1.1

PageStack {
        id: mainPage_PageStack
        Component.onCompleted: push(main_MainPage)
        property alias goFixerButton: goFixerButton

    Page {
        id:main_MainPage
        title: i18n.tr("Fixel")
        visible: false

        head.actions: [
                        Action {
                            iconName: "settings"
                            text: i18n.tr("Settings")
                            onTriggered: {
                                settingPage.initSetting();
                                mainPage_PageStack.push(settingPage)
                            }
                        },
                       Action {
                           iconName: "info"
                           text: i18n.tr("Info")
                           onTriggered: {
                               mainPage_PageStack.push(aboutPage)
                           }
                       }
                   ]

        Rectangle {
            id: mainRect
            anchors.margins: units.gu(2)
            anchors.fill: parent
            color: "transparent"

            Button {
                id: goFixerButton
                objectName: "button"
                anchors.left: parent.left
                anchors.right: parent.right
                text: i18n.tr("Start")
                color:"#DD4814"
                anchors.top:parent.top
                anchors.topMargin: units.gu(2)
                onClicked: {
                    fixerPage.initFixer();
                    fixerPage.startFixer();
                    main_PageStack.push(fixerPage)
                    mainWindow.visibility=Window.FullScreen
                }
            }

            Button {
                id: goCheckButton
                objectName: "button"
                anchors.left: parent.left
                anchors.right: parent.right
                text: i18n.tr("Check")
                color:"#DD4814"
                anchors.top:goFixerButton.bottom
                anchors.topMargin: units.gu(4)
                onClicked: {
                    checkerPage.initChecker();
                    main_PageStack.push(checkerPage)
                    mainWindow.visibility=Window.FullScreen
                }
            }



            Rectangle {
                id: rectInfo
                height: info.paintedHeight + units.gu(1)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottomMargin: units.gu(2)
                anchors.bottom: rectWarn.top
                color: "#D9EDF7"
                border.color: "#bce8f1"
                border.width: 5
                radius: 10


                Label
                {
                    id: info
                    objectName: "note"
                    anchors.margins: units.gu(2)
                    anchors.fill: parent
                    anchors.centerIn: parent
                    text: i18n.tr("<html><b>Note: </b>Disable the screensaver before starting.</html>")
                    color: "#31708f"
                    wrapMode: TextEdit.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Rectangle {
                id: rectWarn
                height: info.paintedHeight + units.gu(1)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: units.gu(2)
                anchors.bottom: parent.bottom
                color: "#FCF8E3"
                border.color: "#faebcc"
                border.width: 5
                radius: 10

                Label {
                    id: warn
                    objectName: "warn"
                    anchors.margins: units.gu(2)
                    anchors.fill: parent
                    anchors.centerIn: parent
                    text: i18n.tr("<html><b>DO NOT STARE AT THE SCREEN!</b></html>")
                    color: "#8a6d3b"
                    wrapMode: TextEdit.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    AboutPage {
        id: aboutPage
        visible: false
    }
    SettingPage {
        id: settingPage
        visible: false
    }
}
