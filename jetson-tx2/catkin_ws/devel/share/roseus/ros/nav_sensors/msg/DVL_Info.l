;; Auto-generated. Do not edit!


(when (boundp 'nav_sensors::DVL_Info)
  (if (not (find-package "NAV_SENSORS"))
    (make-package "NAV_SENSORS"))
  (shadow 'DVL_Info (find-package "NAV_SENSORS")))
(unless (find-package "NAV_SENSORS::DVL_INFO")
  (make-package "NAV_SENSORS::DVL_INFO"))

(in-package "ROS")
;;//! \htmlinclude DVL_Info.msg.html


(defclass nav_sensors::DVL_Info
  :super ros::object
  :slots (_packet_count _packet_id _version _system_type _system_subtype _fw_major_version _fw_minor_version _fw_patch_version _fw_build_version _year _month _day _hour _minute _second _coordinate_system ))

(defmethod nav_sensors::DVL_Info
  (:init
   (&key
    ((:packet_count __packet_count) 0)
    ((:packet_id __packet_id) 0)
    ((:version __version) 0)
    ((:system_type __system_type) 0)
    ((:system_subtype __system_subtype) 0)
    ((:fw_major_version __fw_major_version) 0)
    ((:fw_minor_version __fw_minor_version) 0)
    ((:fw_patch_version __fw_patch_version) 0)
    ((:fw_build_version __fw_build_version) 0)
    ((:year __year) 0)
    ((:month __month) 0)
    ((:day __day) 0)
    ((:hour __hour) 0)
    ((:minute __minute) 0)
    ((:second __second) 0)
    ((:coordinate_system __coordinate_system) 0)
    )
   (send-super :init)
   (setq _packet_count (round __packet_count))
   (setq _packet_id (round __packet_id))
   (setq _version (round __version))
   (setq _system_type (round __system_type))
   (setq _system_subtype (round __system_subtype))
   (setq _fw_major_version (round __fw_major_version))
   (setq _fw_minor_version (round __fw_minor_version))
   (setq _fw_patch_version (round __fw_patch_version))
   (setq _fw_build_version (round __fw_build_version))
   (setq _year (round __year))
   (setq _month (round __month))
   (setq _day (round __day))
   (setq _hour (round __hour))
   (setq _minute (round __minute))
   (setq _second (round __second))
   (setq _coordinate_system (round __coordinate_system))
   self)
  (:packet_count
   (&optional __packet_count)
   (if __packet_count (setq _packet_count __packet_count)) _packet_count)
  (:packet_id
   (&optional __packet_id)
   (if __packet_id (setq _packet_id __packet_id)) _packet_id)
  (:version
   (&optional __version)
   (if __version (setq _version __version)) _version)
  (:system_type
   (&optional __system_type)
   (if __system_type (setq _system_type __system_type)) _system_type)
  (:system_subtype
   (&optional __system_subtype)
   (if __system_subtype (setq _system_subtype __system_subtype)) _system_subtype)
  (:fw_major_version
   (&optional __fw_major_version)
   (if __fw_major_version (setq _fw_major_version __fw_major_version)) _fw_major_version)
  (:fw_minor_version
   (&optional __fw_minor_version)
   (if __fw_minor_version (setq _fw_minor_version __fw_minor_version)) _fw_minor_version)
  (:fw_patch_version
   (&optional __fw_patch_version)
   (if __fw_patch_version (setq _fw_patch_version __fw_patch_version)) _fw_patch_version)
  (:fw_build_version
   (&optional __fw_build_version)
   (if __fw_build_version (setq _fw_build_version __fw_build_version)) _fw_build_version)
  (:year
   (&optional __year)
   (if __year (setq _year __year)) _year)
  (:month
   (&optional __month)
   (if __month (setq _month __month)) _month)
  (:day
   (&optional __day)
   (if __day (setq _day __day)) _day)
  (:hour
   (&optional __hour)
   (if __hour (setq _hour __hour)) _hour)
  (:minute
   (&optional __minute)
   (if __minute (setq _minute __minute)) _minute)
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:coordinate_system
   (&optional __coordinate_system)
   (if __coordinate_system (setq _coordinate_system __coordinate_system)) _coordinate_system)
  (:serialization-length
   ()
   (+
    ;; uint16 _packet_count
    2
    ;; uint8 _packet_id
    1
    ;; uint8 _version
    1
    ;; uint8 _system_type
    1
    ;; uint8 _system_subtype
    1
    ;; uint8 _fw_major_version
    1
    ;; uint8 _fw_minor_version
    1
    ;; uint8 _fw_patch_version
    1
    ;; uint8 _fw_build_version
    1
    ;; uint8 _year
    1
    ;; uint8 _month
    1
    ;; uint8 _day
    1
    ;; uint8 _hour
    1
    ;; uint8 _minute
    1
    ;; uint8 _second
    1
    ;; uint8 _coordinate_system
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _packet_count
       (write-word _packet_count s)
     ;; uint8 _packet_id
       (write-byte _packet_id s)
     ;; uint8 _version
       (write-byte _version s)
     ;; uint8 _system_type
       (write-byte _system_type s)
     ;; uint8 _system_subtype
       (write-byte _system_subtype s)
     ;; uint8 _fw_major_version
       (write-byte _fw_major_version s)
     ;; uint8 _fw_minor_version
       (write-byte _fw_minor_version s)
     ;; uint8 _fw_patch_version
       (write-byte _fw_patch_version s)
     ;; uint8 _fw_build_version
       (write-byte _fw_build_version s)
     ;; uint8 _year
       (write-byte _year s)
     ;; uint8 _month
       (write-byte _month s)
     ;; uint8 _day
       (write-byte _day s)
     ;; uint8 _hour
       (write-byte _hour s)
     ;; uint8 _minute
       (write-byte _minute s)
     ;; uint8 _second
       (write-byte _second s)
     ;; uint8 _coordinate_system
       (write-byte _coordinate_system s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _packet_count
     (setq _packet_count (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _packet_id
     (setq _packet_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _version
     (setq _version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _system_type
     (setq _system_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _system_subtype
     (setq _system_subtype (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fw_major_version
     (setq _fw_major_version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fw_minor_version
     (setq _fw_minor_version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fw_patch_version
     (setq _fw_patch_version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fw_build_version
     (setq _fw_build_version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _year
     (setq _year (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _month
     (setq _month (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _day
     (setq _day (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hour
     (setq _hour (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _minute
     (setq _minute (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _second
     (setq _second (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _coordinate_system
     (setq _coordinate_system (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get nav_sensors::DVL_Info :md5sum-) "0fce5519a2786a76ac927fac228614af")
(setf (get nav_sensors::DVL_Info :datatype-) "nav_sensors/DVL_Info")
(setf (get nav_sensors::DVL_Info :definition-)
      "
uint16 packet_count # number of packets
uint8 packet_id
uint8 version #
uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)
uint8 system_subtype # Variant on the system type e.g frequency or transducer type
uint8 fw_major_version
uint8 fw_minor_version
uint8 fw_patch_version
uint8 fw_build_version
uint8 year
uint8 month
uint8 day
uint8 hour
uint8 minute
uint8 second
uint8 coordinate_system
")



(provide :nav_sensors/DVL_Info "0fce5519a2786a76ac927fac228614af")


