package gui

import scala.swing.Swing.CompoundBorder
import scala.swing.Swing.EmptyBorder
import scala.swing.Swing.EtchedBorder
import scala.swing.Swing.TitledBorder
import scala.swing.event.ButtonClicked
import scala.swing.BoxPanel
import scala.swing.Button
import scala.swing.CheckBox
import scala.swing.GridBagPanel
import scala.swing.Label
import scala.swing.MainFrame
import scala.swing.Orientation
import scala.swing.SimpleGUIApplication
import scala.swing.Swing

object checkBox extends SimpleGUIApplication {
  def top = new MainFrame {
    title = "Calorie Calculator"
    //preferredSize = (,300)
    val label = new Label {
      text = "Tick foods to compute their calories"
      font = new java.awt.Font("Verdana",
        java.awt.Font.BOLD, 22)
    }
    val result_label = new Label {
      text = ""
      font = new java.awt.Font("Verdana",
        java.awt.Font.BOLD, 22)
    }
    var cal_button = new Button {
      text = "Calories"
      font = new java.awt.Font("Verdana", java.awt.Font.BOLD, 22)
    }
    var reset_button = new Button {
      text = "Reset"
      font = new java.awt.Font("Verdana", java.awt.Font.BOLD, 22)
    }
    var cals = 0
    val banana = new CheckBox("banana")
    val watermelon = new CheckBox("watermelon")
    val broccoli = new CheckBox("broccoli")
    val coffee = new CheckBox("coffee")
    val cheese = new CheckBox("cheese")
    val veal = new CheckBox("veal")
    val lamb = new CheckBox("lamb")
    var foods = new BoxPanel(Orientation.Vertical) {
      border = CompoundBorder(TitledBorder(EtchedBorder, "Foods"), EmptyBorder(5, 5, 5, 10))
      banana.background = java.awt.Color.lightGray
      watermelon.background = java.awt.Color.lightGray
      broccoli.background = java.awt.Color.lightGray
      coffee.background = java.awt.Color.lightGray
      cheese.background = java.awt.Color.lightGray
      veal.background = java.awt.Color.lightGray
      lamb.background = java.awt.Color.lightGray
      contents.append(banana, watermelon, broccoli,
        coffee, cheese, veal, lamb)
      background = java.awt.Color.lightGray
      listenTo(banana, watermelon, broccoli, coffee, cheese,
        veal, lamb)
      reactions += {
        case ButtonClicked(`banana`) =>
          if (!banana.peer.isSelected())
            cals -= 72
          else
            cals += 72
        case ButtonClicked(`watermelon`) =>
          if (!watermelon.peer.isSelected())
            cals -= 37
          else
            cals += 37
        case ButtonClicked(`broccoli`) =>
          if (!broccoli.peer.isSelected())
            cals -= 11
          else
            cals += 11
        case ButtonClicked(`coffee`) =>
          if (!coffee.peer.isSelected())
            cals -= 1
          else
            cals += 1
        case ButtonClicked(`cheese`) =>
          if (!cheese.peer.isSelected())
            cals -= 69
          else
            cals += 69
        case ButtonClicked(`veal`) =>
          if (!veal.peer.isSelected())
            cals -= 146
          else
            cals += 146
        case ButtonClicked(`lamb`) =>
          if (!lamb.peer.isSelected())
            cals -= 218
          else
            cals += 218
      }
    }
    var mybuttons = new BoxPanel(Orientation.Horizontal) {
      contents.append(cal_button, Swing.HStrut(20), reset_button)
      background = java.awt.Color.lightGray
    }
    contents = new GridBagPanel {
      var c = new Constraints
      c.gridwidth = java.awt.GridBagConstraints.REMAINDER
      add(label, c)
      add(Swing.VStrut(20), c)
      add(foods, c)
      add(Swing.VStrut(20), c)
      add(mybuttons, c)
      add(Swing.VStrut(20), c)
      add(result_label, c)
      background = java.awt.Color.lightGray
      border = Swing.EmptyBorder(50, 50, 50, 50)
    }
    listenTo(cal_button, reset_button)
    reactions += {
      case ButtonClicked(b1) => if (b1.eq(cal_button)) {
        result_label.text = "Total calories: " + cals
      }
    }
    reactions += {
      case ButtonClicked(b2) => if (b2.eq(reset_button)) {
        cals = 0
        banana.peer.setSelected(false)
        watermelon.peer.setSelected(false)
        broccoli.peer.setSelected(false)
        coffee.peer.setSelected(false)
        cheese.peer.setSelected(false)
        veal.peer.setSelected(false)
        lamb.peer.setSelected(false)
        result_label.text = ""
      }
    }
  }

}



