
(cl:in-package :asdf)

(defsystem "comm_bridge-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetSensor" :depends-on ("_package_GetSensor"))
    (:file "_package_GetSensor" :depends-on ("_package"))
  ))