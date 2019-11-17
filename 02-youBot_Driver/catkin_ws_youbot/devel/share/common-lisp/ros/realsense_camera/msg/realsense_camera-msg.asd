
(cl:in-package :asdf)

(defsystem "realsense_camera-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "realsenseConfig" :depends-on ("_package_realsenseConfig"))
    (:file "_package_realsenseConfig" :depends-on ("_package"))
  ))