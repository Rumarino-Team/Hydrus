
(cl:in-package :asdf)

(defsystem "nav_sensors-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DVL_Beams" :depends-on ("_package_DVL_Beams"))
    (:file "_package_DVL_Beams" :depends-on ("_package"))
    (:file "DVL_Data" :depends-on ("_package_DVL_Data"))
    (:file "_package_DVL_Data" :depends-on ("_package"))
    (:file "DVL_Info" :depends-on ("_package_DVL_Info"))
    (:file "_package_DVL_Info" :depends-on ("_package"))
    (:file "DVL_MSG" :depends-on ("_package_DVL_MSG"))
    (:file "_package_DVL_MSG" :depends-on ("_package"))
    (:file "DVL_Power" :depends-on ("_package_DVL_Power"))
    (:file "_package_DVL_Power" :depends-on ("_package"))
  ))