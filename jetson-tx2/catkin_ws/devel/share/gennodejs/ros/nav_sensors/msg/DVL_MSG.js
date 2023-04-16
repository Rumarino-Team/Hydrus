// Auto-generated. Do not edit!

// (in-package nav_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DVL_Info = require('./DVL_Info.js');
let DVL_Data = require('./DVL_Data.js');
let DVL_Power = require('./DVL_Power.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DVL_MSG {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.is_valid = null;
      this.system_info = null;
      this.data = null;
      this.bit_count = null;
      this.bit_code = null;
      this.power = null;
      this.serial_number = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('is_valid')) {
        this.is_valid = initObj.is_valid
      }
      else {
        this.is_valid = false;
      }
      if (initObj.hasOwnProperty('system_info')) {
        this.system_info = initObj.system_info
      }
      else {
        this.system_info = new DVL_Info();
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new DVL_Data();
      }
      if (initObj.hasOwnProperty('bit_count')) {
        this.bit_count = initObj.bit_count
      }
      else {
        this.bit_count = 0;
      }
      if (initObj.hasOwnProperty('bit_code')) {
        this.bit_code = initObj.bit_code
      }
      else {
        this.bit_code = 0;
      }
      if (initObj.hasOwnProperty('power')) {
        this.power = initObj.power
      }
      else {
        this.power = new DVL_Power();
      }
      if (initObj.hasOwnProperty('serial_number')) {
        this.serial_number = initObj.serial_number
      }
      else {
        this.serial_number = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DVL_MSG
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [is_valid]
    bufferOffset = _serializer.bool(obj.is_valid, buffer, bufferOffset);
    // Serialize message field [system_info]
    bufferOffset = DVL_Info.serialize(obj.system_info, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = DVL_Data.serialize(obj.data, buffer, bufferOffset);
    // Serialize message field [bit_count]
    bufferOffset = _serializer.int64(obj.bit_count, buffer, bufferOffset);
    // Serialize message field [bit_code]
    bufferOffset = _serializer.int64(obj.bit_code, buffer, bufferOffset);
    // Serialize message field [power]
    bufferOffset = DVL_Power.serialize(obj.power, buffer, bufferOffset);
    // Serialize message field [serial_number]
    bufferOffset = std_msgs.msg.String.serialize(obj.serial_number, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DVL_MSG
    let len;
    let data = new DVL_MSG(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_valid]
    data.is_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [system_info]
    data.system_info = DVL_Info.deserialize(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = DVL_Data.deserialize(buffer, bufferOffset);
    // Deserialize message field [bit_count]
    data.bit_count = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [bit_code]
    data.bit_code = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [power]
    data.power = DVL_Power.deserialize(buffer, bufferOffset);
    // Deserialize message field [serial_number]
    data.serial_number = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.String.getMessageSize(object.serial_number);
    return length + 130;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_sensors/DVL_MSG';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b8b06991dd9cca7403c624d30aeebcda';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    std_msgs/Header header
    bool is_valid
    nav_sensors/DVL_Info system_info
    nav_sensors/DVL_Data data
    #two unknowns
    int64 bit_count
    int64 bit_code
    nav_sensors/DVL_Power power
    std_msgs/String serial_number
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: nav_sensors/DVL_Info
    
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
    ================================================================================
    MSG: nav_sensors/DVL_Data
    
    
    geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components
    float32 vel_error
    
    geometry_msgs/Point position
    
    nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)
    #float32 range_beam1
    #float32 range_beam2
    #float32 range_beam3
    #float32 range_beam4
    
    float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams
    float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing
    int64 BT_status # Combines amplitude/correlation erroes and three beam solution information
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: nav_sensors/DVL_Beams
    float32 beam1
    float32 beam2
    float32 beam3
    float32 beam4
    ================================================================================
    MSG: nav_sensors/DVL_Power
    
    float32 input_voltage         # volts
    float32 transmit_voltage # volts
    float32 transmit_current # amps
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DVL_MSG(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.is_valid !== undefined) {
      resolved.is_valid = msg.is_valid;
    }
    else {
      resolved.is_valid = false
    }

    if (msg.system_info !== undefined) {
      resolved.system_info = DVL_Info.Resolve(msg.system_info)
    }
    else {
      resolved.system_info = new DVL_Info()
    }

    if (msg.data !== undefined) {
      resolved.data = DVL_Data.Resolve(msg.data)
    }
    else {
      resolved.data = new DVL_Data()
    }

    if (msg.bit_count !== undefined) {
      resolved.bit_count = msg.bit_count;
    }
    else {
      resolved.bit_count = 0
    }

    if (msg.bit_code !== undefined) {
      resolved.bit_code = msg.bit_code;
    }
    else {
      resolved.bit_code = 0
    }

    if (msg.power !== undefined) {
      resolved.power = DVL_Power.Resolve(msg.power)
    }
    else {
      resolved.power = new DVL_Power()
    }

    if (msg.serial_number !== undefined) {
      resolved.serial_number = std_msgs.msg.String.Resolve(msg.serial_number)
    }
    else {
      resolved.serial_number = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = DVL_MSG;
