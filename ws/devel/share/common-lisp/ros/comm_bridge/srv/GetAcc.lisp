; Auto-generated. Do not edit!


(cl:in-package comm_bridge-srv)


;//! \htmlinclude GetAcc-request.msg.html

(cl:defclass <GetAcc-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetAcc-request (<GetAcc-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAcc-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAcc-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comm_bridge-srv:<GetAcc-request> is deprecated: use comm_bridge-srv:GetAcc-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAcc-request>) ostream)
  "Serializes a message object of type '<GetAcc-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAcc-request>) istream)
  "Deserializes a message object of type '<GetAcc-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAcc-request>)))
  "Returns string type for a service object of type '<GetAcc-request>"
  "comm_bridge/GetAccRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAcc-request)))
  "Returns string type for a service object of type 'GetAcc-request"
  "comm_bridge/GetAccRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAcc-request>)))
  "Returns md5sum for a message object of type '<GetAcc-request>"
  "4556e909ee62344eea0a88d1ccb4917a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAcc-request)))
  "Returns md5sum for a message object of type 'GetAcc-request"
  "4556e909ee62344eea0a88d1ccb4917a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAcc-request>)))
  "Returns full string definition for message of type '<GetAcc-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAcc-request)))
  "Returns full string definition for message of type 'GetAcc-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAcc-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAcc-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAcc-request
))
;//! \htmlinclude GetAcc-response.msg.html

(cl:defclass <GetAcc-response> (roslisp-msg-protocol:ros-message)
  ((respond
    :reader respond
    :initarg :respond
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetAcc-response (<GetAcc-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAcc-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAcc-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comm_bridge-srv:<GetAcc-response> is deprecated: use comm_bridge-srv:GetAcc-response instead.")))

(cl:ensure-generic-function 'respond-val :lambda-list '(m))
(cl:defmethod respond-val ((m <GetAcc-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm_bridge-srv:respond-val is deprecated.  Use comm_bridge-srv:respond instead.")
  (respond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAcc-response>) ostream)
  "Serializes a message object of type '<GetAcc-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'respond))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'respond))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAcc-response>) istream)
  "Deserializes a message object of type '<GetAcc-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'respond) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'respond)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAcc-response>)))
  "Returns string type for a service object of type '<GetAcc-response>"
  "comm_bridge/GetAccResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAcc-response)))
  "Returns string type for a service object of type 'GetAcc-response"
  "comm_bridge/GetAccResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAcc-response>)))
  "Returns md5sum for a message object of type '<GetAcc-response>"
  "4556e909ee62344eea0a88d1ccb4917a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAcc-response)))
  "Returns md5sum for a message object of type 'GetAcc-response"
  "4556e909ee62344eea0a88d1ccb4917a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAcc-response>)))
  "Returns full string definition for message of type '<GetAcc-response>"
  (cl:format cl:nil "float64[] respond~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAcc-response)))
  "Returns full string definition for message of type 'GetAcc-response"
  (cl:format cl:nil "float64[] respond~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAcc-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'respond) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAcc-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAcc-response
    (cl:cons ':respond (respond msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetAcc)))
  'GetAcc-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetAcc)))
  'GetAcc-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAcc)))
  "Returns string type for a service object of type '<GetAcc>"
  "comm_bridge/GetAcc")