// Auto-generated. Do not edit!

// (in-package nav_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DVL_Beams {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.beam1 = null;
      this.beam2 = null;
      this.beam3 = null;
      this.beam4 = null;
    }
    else {
      if (initObj.hasOwnProperty('beam1')) {
        this.beam1 = initObj.beam1
      }
      else {
        this.beam1 = 0.0;
      }
      if (initObj.hasOwnProperty('beam2')) {
        this.beam2 = initObj.beam2
      }
      else {
        this.beam2 = 0.0;
      }
      if (initObj.hasOwnProperty('beam3')) {
        this.beam3 = initObj.beam3
      }
      else {
        this.beam3 = 0.0;
      }
      if (initObj.hasOwnProperty('beam4')) {
        this.beam4 = initObj.beam4
      }
      else {
        this.beam4 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DVL_Beams
    // Serialize message field [beam1]
    bufferOffset = _serializer.float32(obj.beam1, buffer, bufferOffset);
    // Serialize message field [beam2]
    bufferOffset = _serializer.float32(obj.beam2, buffer, bufferOffset);
    // Serialize message field [beam3]
    bufferOffset = _serializer.float32(obj.beam3, buffer, bufferOffset);
    // Serialize message field [beam4]
    bufferOffset = _serializer.float32(obj.beam4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DVL_Beams
    let len;
    let data = new DVL_Beams(null);
    // Deserialize message field [beam1]
    data.beam1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [beam2]
    data.beam2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [beam3]
    data.beam3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [beam4]
    data.beam4 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_sensors/DVL_Beams';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '546dd638b4ab134d8326eefb33315dc0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new DVL_Beams(null);
    if (msg.beam1 !== undefined) {
      resolved.beam1 = msg.beam1;
    }
    else {
      resolved.beam1 = 0.0
    }

    if (msg.beam2 !== undefined) {
      resolved.beam2 = msg.beam2;
    }
    else {
      resolved.beam2 = 0.0
    }

    if (msg.beam3 !== undefined) {
      resolved.beam3 = msg.beam3;
    }
    else {
      resolved.beam3 = 0.0
    }

    if (msg.beam4 !== undefined) {
      resolved.beam4 = msg.beam4;
    }
    else {
      resolved.beam4 = 0.0
    }

    return resolved;
    }
};

module.exports = DVL_Beams;
