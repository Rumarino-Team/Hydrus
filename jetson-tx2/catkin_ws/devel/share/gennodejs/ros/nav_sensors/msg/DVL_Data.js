// Auto-generated. Do not edit!

// (in-package nav_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DVL_Beams = require('./DVL_Beams.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class DVL_Data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocity = null;
      this.vel_error = null;
      this.position = null;
      this.beams = null;
      this.mean_bottom_range = null;
      this.speed_of_sound = null;
      this.BT_status = null;
    }
    else {
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('vel_error')) {
        this.vel_error = initObj.vel_error
      }
      else {
        this.vel_error = 0.0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('beams')) {
        this.beams = initObj.beams
      }
      else {
        this.beams = new DVL_Beams();
      }
      if (initObj.hasOwnProperty('mean_bottom_range')) {
        this.mean_bottom_range = initObj.mean_bottom_range
      }
      else {
        this.mean_bottom_range = 0.0;
      }
      if (initObj.hasOwnProperty('speed_of_sound')) {
        this.speed_of_sound = initObj.speed_of_sound
      }
      else {
        this.speed_of_sound = 0.0;
      }
      if (initObj.hasOwnProperty('BT_status')) {
        this.BT_status = initObj.BT_status
      }
      else {
        this.BT_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DVL_Data
    // Serialize message field [velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [vel_error]
    bufferOffset = _serializer.float32(obj.vel_error, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [beams]
    bufferOffset = DVL_Beams.serialize(obj.beams, buffer, bufferOffset);
    // Serialize message field [mean_bottom_range]
    bufferOffset = _serializer.float32(obj.mean_bottom_range, buffer, bufferOffset);
    // Serialize message field [speed_of_sound]
    bufferOffset = _serializer.float32(obj.speed_of_sound, buffer, bufferOffset);
    // Serialize message field [BT_status]
    bufferOffset = _serializer.int64(obj.BT_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DVL_Data
    let len;
    let data = new DVL_Data(null);
    // Deserialize message field [velocity]
    data.velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [vel_error]
    data.vel_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [beams]
    data.beams = DVL_Beams.deserialize(buffer, bufferOffset);
    // Deserialize message field [mean_bottom_range]
    data.mean_bottom_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed_of_sound]
    data.speed_of_sound = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BT_status]
    data.BT_status = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_sensors/DVL_Data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '97ac2a86c0b276ba205c91f67abbbc93';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DVL_Data(null);
    if (msg.velocity !== undefined) {
      resolved.velocity = geometry_msgs.msg.Vector3.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.vel_error !== undefined) {
      resolved.vel_error = msg.vel_error;
    }
    else {
      resolved.vel_error = 0.0
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point()
    }

    if (msg.beams !== undefined) {
      resolved.beams = DVL_Beams.Resolve(msg.beams)
    }
    else {
      resolved.beams = new DVL_Beams()
    }

    if (msg.mean_bottom_range !== undefined) {
      resolved.mean_bottom_range = msg.mean_bottom_range;
    }
    else {
      resolved.mean_bottom_range = 0.0
    }

    if (msg.speed_of_sound !== undefined) {
      resolved.speed_of_sound = msg.speed_of_sound;
    }
    else {
      resolved.speed_of_sound = 0.0
    }

    if (msg.BT_status !== undefined) {
      resolved.BT_status = msg.BT_status;
    }
    else {
      resolved.BT_status = 0
    }

    return resolved;
    }
};

module.exports = DVL_Data;
