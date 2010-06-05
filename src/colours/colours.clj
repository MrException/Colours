(ns colours.colours
  (:use [clj-swing core frame label button combo-box list panel document text-field tree]) 
  (:import (javax.swing UIManager SwingUtilities)
           (java.awt GridBagLayout GridBagConstraints))) 

(def sr (ref '["Quick sort" "Bubble Sort"]))
(def lm (ref '["Bla" "Blubb"]))
(def str-ref (ref "A String!"))

(def selected (atom nil))
(def nativeLF (. UIManager getSystemLookAndFeelClassName))

(. UIManager setLookAndFeel nativeLF)

(defn app []
  (frame :title "Sort Visualizer" :layout (GridBagLayout.) :constrains (java.awt.GridBagConstraints.) :name fr
         :show true :pack true
         [:gridx 0 :gridy 0 :anchor :LINE_END
          _ (label "Algorithms")
          :gridy 1
          _ (label "Button")
          :gridx 1 :gridy 0 :anchor :LINE_START
          _ (combo-box [] :model (seq-ref-combobox-model sr selected))
          :gridy 1
          _ (button "Run Algorithm" 
                    :action ([_] (if @selected (dosync (alter lm conj @selected)))))
          :gridx 0 :gridy 2 :gridwidth 2 :anchor :LINE_START
          _ (text-field :str-ref str-ref :columns 10)
          :gridx 3 :gridy 0 :gridheight 3 :anchor :CENTER
          _ (scroll-panel (jlist :model (seq-ref-list-model lm)) :preferred-size [150 100])])) 

(defn -main [& args]
  (SwingUtilities/invokeLater app))
