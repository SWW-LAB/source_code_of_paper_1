
(cl:in-package :asdf)

(defsystem "ik-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ik_" :depends-on ("_package_ik_"))
    (:file "_package_ik_" :depends-on ("_package"))
    (:file "ik" :depends-on ("_package_ik"))
    (:file "_package_ik" :depends-on ("_package"))
  ))