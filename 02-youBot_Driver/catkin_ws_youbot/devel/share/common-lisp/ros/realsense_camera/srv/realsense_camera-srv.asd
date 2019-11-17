
(cl:in-package :asdf)

(defsystem "realsense_camera-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "get_rgb_uv" :depends-on ("_package_get_rgb_uv"))
    (:file "_package_get_rgb_uv" :depends-on ("_package"))
  ))