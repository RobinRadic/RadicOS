
import Qt 4.7


Item {
    id: main

    width: screenSize.width
    height: screenSize.height

    property int stage

    onStageChanged: {

        if (stage == 1) {

            tree.opacity = 0.1

        spin.opacity = 1

        }
        if (stage == 2) {


            textDevstationOpac.start()
            tree.opacity = 0.2
        spin.opacity = 1

        }
        if (stage == 3) {

            tree.opacity = 0.3

        spin.opacity = 1

        }
        if (stage == 4) {

            tree.opacity = 0.5
        spin.opacity = 1

        }
        if (stage == 5) {

            tree.opacity = 0.8

        spin.opacity = 1

        }
        if (stage == 6) {

            tree.opacity = 1
        spin.opacity = 1

        }
    }
    Image {
        id: background

        height: 1200
        width: 1920
        x: 0
        y: 0

        source: "images/bg.png"


        Image {
            id: textRadic
            x: screenSize.width * 4
            y: screenSize.height / 2 - height
            source: "images/radic.png"
            NumberAnimation {
                 id: textRadicPlacer
                 target: textRadic
                 properties: "x"
                 to: screenSize.width
                 duration: 2500
                 running: true
                 easing.type: Easing.InCubic
             }
        }

        Image {
            id: textOs
            height: 142
            width: 171
            x: 0
            y: screenSize.height / 2 - height
            source: "images/os.png"
            NumberAnimation {
                 id: textOsPlacer
                 target: textOs
                 properties: "x"
                 to: screenSize.width + textRadic.width
                 duration: 2500
                 running: true
             }
        }

        Image {
            id: textDevstation
            x: screenSize.width / 3
            y: (screenSize.height / 2) + 20
            height: 33
            width: 594
            source: "images/dev-workstation.png"
            smooth: true
            opacity: 0
            NumberAnimation {
                 id: textDevstationOpac
                 target: textDevstation
                 properties: "opacity"
                 to: 1
                 duration: 4000
                 running: false
             }
        }


        Image {
            id: tree
            width: 1293; height: 1200
            anchors.left: parent.left; anchors.bottom: parent.bottom
            source: "images/tree.png"

            smooth: true
            opacity: 0
            Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }
        }



        Rectangle{
          id:frame
          width: 100
          height: 100
          color: "transparent"
          smooth: true

          x: screenSize.width - (width * 2)
          y: screenSize.height - (height * 2)

          opacity: 0
              Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }

              NumberAnimation on opacity {
              id: frameAnimation
              from: 0
              to: 1
              duration: 800
              }


              Text {
                id: freedom
                      // HTML like markup can also be used
                text: '<font color="#eb5922" face="MyriadPro-BoldCond">Loading RadicOS..</font>'

                      // This could also be written font { pointSize: 14 }. Both syntaxes are valid.
                     // font.pointSize: 14

                      font { family: 'MyriadPro'; pointSize: 17; italic: false; bold:false; }
                      // StyledText format supports fewer tags, but is more efficient than RichText
                      textFormat: Text.StyledText
                      x: parent.left - width
                      y: parent.Center + (parent.height )
                  opacity: 1
                  Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }

               }

          Image {
              id: spin

              height: 48
              width: 48
              smooth: true

              x: (frame.width - width) / 6
              y: (frame.height - height) / 1.6

              source: "images/engine.png"

              NumberAnimation {
                  id: animateRotation
                  target: spin
                  properties: "rotation"
                  from: 0
                  to: 360
                  duration: 2000

                  loops: Animation.Infinite
                  running: true
              }

          }

              Image {
              id: spin2

              height: 48
              width: 48
              smooth: true

              x: (frame.width - width) / 1.18
              y: (frame.height - height) / 10

              source: "images/engine.png"

              NumberAnimation {
                  id: animateRotation2
                  target: spin2
                  properties: "rotation"
                  from: 360
                  to: 0
                  duration: 2000

                  loops: Animation.Infinite
                  running: true
              }

          }

                  Image {
              id: spin3

              height: 28
              width: 28
              smooth: true

              x: (frame.width - width) / 1.54
              y: (frame.height - height) / 1.12

              source: "images/engine.png"

              NumberAnimation {
                  id: animateRotation3
                  target: spin3
                  properties: "rotation"
                  from: 360
                  to: 0
                  duration: 1500

                  loops: Animation.Infinite
                  running: true
              }

          }

        }

    }


    /*
    Image {
      id: logo
      
      height: 88
      width: 241
      
      x: (parent.width - width) /2
      y: parent.height / 2 - height
      
      source: "images/kubuntu_logo.png"
    }
    
    Item {
      id: progressindicator
      
      width: 21*5
      height: 21
      
      x: (parent.width - width)/2
      y: logo.y + logo.height + logo.height / 4
      
      Image {
	  id: bullet1
	  width: 21; height: 21
	  anchors.left: parent.left; anchors.top: parent.top
	  source: "images/progress_dot_on.png"
      }
      
      Image {
	  id: bullet2
	  width: 21; height: 21
	  anchors.left: parent.left; anchors.top: parent.top
	  anchors.leftMargin: 23;
	  source: "images/progress_dot_on.png"
      }
      
      Image {
	  id: bullet3
	  width: 21; height: 21
	  anchors.left: parent.left; anchors.top: parent.top
	  anchors.leftMargin: 46;
	  source: "images/progress_dot_on.png"
      }
      
      Image {
	  id: bullet4
	  width: 21; height: 21
	  anchors.left: parent.left; anchors.top: parent.top
	  anchors.leftMargin: 69;
	  source: "images/progress_dot_on.png"
      }
      
      Image {
	  id: bullet5
	  width: 21; height: 21
	  anchors.left: parent.left; anchors.top: parent.top
	  anchors.leftMargin: 92;
	  source: "images/progress_dot_on.png"
      }
    }
    */
}

