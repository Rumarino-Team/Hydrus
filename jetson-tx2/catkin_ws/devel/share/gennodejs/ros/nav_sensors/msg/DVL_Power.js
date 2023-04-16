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

class DVL_Power {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_voltage = null;
      this.transmit_voltage = null;
      this.transmit_current = null;
    }
    else {
      if (initObj.hasOwnProperty('input_voltage')) {
        this.input_voltage = initObj.input_voltage
      }
      else {
        this.input_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('transmit_voltage')) {
        this.transmit_voltage = initObj.transmit_voltage
      }
      else {
        this.transmit_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('transmit_current')) {
        this.transmit_current = initObj.transmit_current
      }
      else {
        this.transmit_current = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DVL_Power
    // Serialize message field [input_voltage]
    bufferOffset = _serializer.float32(obj.input_voltage, buffer, bufferOffset);
    // Serialize message field [transmit_voltage]
    bufferOffset = _serializer.float32(obj.transmit_voltage, buffer, bufferOffset);
    // Serialize message field [transmit_current]
    bufferOffset = _serializer.float32(obj.transmit_current, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DVL_Power
    let len;
    let data = new DVL_Power(null);
    // Deserialize message field [input_voltage]
    data.input_voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [transmit_voltage]
    data.transmit_voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [transmit_current]
    data.transmit_current = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_sensors/DVL_Power';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aaa18c977dd8bbf8b92f654a90151667';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float32 input_voltage         # volts
    float32 transmit_voltage # volts
    float32 transmit_current # amps
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DVL_Power(null);
    if (msg.input_voltage !== undefined) {
      resolved.input_voltage = msg.input_voltage;
    }
    else {
      resolved.input_voltage = 0.0
    }

    if (msg.transmit_voltage !== undefined) {
      resolved.transmit_voltage = msg.transmit_voltage;
    }
    else {
      resolved.transmit_voltage = 0.0
    }

    if (msg.transmit_current !== undefined) {
      resolved.transmit_current = msg.transmit_current;
    }
    else {
      resolved.transmit_current = 0.0
    }

    return resolved;
    }
};

module.exports = DVL_Power;
