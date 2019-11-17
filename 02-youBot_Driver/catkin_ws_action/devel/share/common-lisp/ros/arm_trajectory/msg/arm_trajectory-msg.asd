
(cl:in-package :asdf)

(defsystem "arm_trajectory-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "jointsgoalGoal" :depends-on ("_package_jointsgoalGoal"))
    (:file "_package_jointsgoalGoal" :depends-on ("_package"))
    (:file "jointsgoalActionResult" :depends-on ("_package_jointsgoalActionResult"))
    (:file "_package_jointsgoalActionResult" :depends-on ("_package"))
    (:file "jointsgoalResult" :depends-on ("_package_jointsgoalResult"))
    (:file "_package_jointsgoalResult" :depends-on ("_package"))
    (:file "jointsgoalActionFeedback" :depends-on ("_package_jointsgoalActionFeedback"))
    (:file "_package_jointsgoalActionFeedback" :depends-on ("_package"))
    (:file "jointsgoalFeedback" :depends-on ("_package_jointsgoalFeedback"))
    (:file "_package_jointsgoalFeedback" :depends-on ("_package"))
    (:file "jointsgoalAction" :depends-on ("_package_jointsgoalAction"))
    (:file "_package_jointsgoalAction" :depends-on ("_package"))
    (:file "jointsgoalActionGoal" :depends-on ("_package_jointsgoalActionGoal"))
    (:file "_package_jointsgoalActionGoal" :depends-on ("_package"))
  ))