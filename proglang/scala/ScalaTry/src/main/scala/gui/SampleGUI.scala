package gui

import scala.swing.event.ButtonClicked
import scala.swing.Button
import scala.swing.FlowPanel
import scala.swing.Label
import scala.swing.MainFrame
import scala.swing.SimpleGUIApplication

object SampleGUI extends SimpleGUIApplication {
  def top = new MainFrame {
    title = "A Sample Scala Swing GUI"

    val label = new Label { text = "------------" }
    val button = new Button { text = "Click me" }
    val button2 = new Button { text = "OK" }
    
    contents = new FlowPanel {
      contents += label
      contents += button
      contents += button2
    }

    listenTo(button)
    listenTo(button2)

    reactions += {
      case ButtonClicked(someButton) =>
        label.text = "You clicked " + someButton.text
          
      
    }
  }

}