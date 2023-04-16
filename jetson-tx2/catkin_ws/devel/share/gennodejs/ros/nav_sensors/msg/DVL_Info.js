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

class DVL_Info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.packet_count = null;
      this.packet_id = null;
      this.version = null;
      this.system_type = null;
      this.system_subtype = null;
      this.fw_major_version = null;
      this.fw_minor_version = null;
      this.fw_patch_version = null;
      this.fw_build_version = null;
      this.year = null;
      this.month = null;
      this.day = null;
      this.hour = null;
      this.minute = null;
      this.second = null;
      this.coordinate_system = null;
    }
    else {
      if (initObj.hasOwnProperty('packet_count')) {
        this.packet_count = initObj.packet_count
      }
      else {
        this.packet_count = 0;
      }
      if (initObj.hasOwnProperty('packet_id')) {
        this.packet_id = initObj.packet_id
      }
      else {
        this.packet_id = 0;
      }
      if (initObj.hasOwnProperty('version')) {
        this.version = initObj.version
      }
      else {
        this.version = 0;
      }
      if (initObj.hasOwnProperty('system_type')) {
        this.system_type = initObj.system_type
      }
      else {
        this.system_type = 0;
      }
      if (initObj.hasOwnProperty('system_subtype')) {
        this.system_subtype = initObj.system_subtype
      }
      else {
        this.system_subtype = 0;
      }
      if (initObj.hasOwnProperty('fw_major_version')) {
        this.fw_major_version = initObj.fw_major_version
      }
      else {
        this.fw_major_version = 0;
      }
      if (initObj.hasOwnProperty('fw_minor_version')) {
        this.fw_minor_version = initObj.fw_minor_version
      }
      else {
        this.fw_minor_version = 0;
      }
      if (initObj.hasOwnProperty('fw_patch_version')) {
        this.fw_patch_version = initObj.fw_patch_version
      }
      else {
        this.fw_patch_version = 0;
      }
      if (initObj.hasOwnProperty('fw_build_version')) {
        this.fw_build_version = initObj.fw_build_version
      }
      else {
        this.fw_build_version = 0;
      }
      if (initObj.hasOwnProperty('year')) {
        this.year = initObj.year
      }
      else {
        this.year = 0;
      }
      if (initObj.hasOwnProperty('month')) {
        this.month = initObj.month
      }
      else {
        this.month = 0;
      }
      if (initObj.hasOwnProperty('day')) {
        this.day = initObj.day
      }
      else {
        this.day = 0;
      }
      if (initObj.hasOwnProperty('hour')) {
        this.hour = initObj.hour
      }
      else {
        this.hour = 0;
      }
      if (initObj.hasOwnProperty('minute')) {
        this.minute = initObj.minute
      }
      else {
        this.minute = 0;
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = 0;
      }
      if (initObj.hasOwnProperty('coordinate_system')) {
        this.coordinate_system = initObj.coordinate_system
      }
      else {
        this.coordinate_system = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DVL_Info
    // Serialize message field [packet_count]
    bufferOffset = _serializer.uint16(obj.packet_count, buffer, bufferOffset);
    // Serialize message field [packet_id]
    bufferOffset = _serializer.uint8(obj.packet_id, buffer, bufferOffset);
    // Serialize message field [version]
    bufferOffset = _serializer.uint8(obj.version, buffer, bufferOffset);
    // Serialize message field [system_type]
    bufferOffset = _serializer.uint8(obj.system_type, buffer, bufferOffset);
    // Serialize message field [system_subtype]
    bufferOffset = _serializer.uint8(obj.system_subtype, buffer, bufferOffset);
    // Serialize message field [fw_major_version]
    bufferOffset = _serializer.uint8(obj.fw_major_version, buffer, bufferOffset);
    // Serialize message field [fw_minor_version]
    bufferOffset = _serializer.uint8(obj.fw_minor_version, buffer, bufferOffset);
    // Serialize message field [fw_patch_version]
    bufferOffset = _serializer.uint8(obj.fw_patch_version, buffer, bufferOffset);
    // Serialize message field [fw_build_version]
    bufferOffset = _serializer.uint8(obj.fw_build_version, buffer, bufferOffset);
    // Serialize message field [year]
    bufferOffset = _serializer.uint8(obj.year, buffer, bufferOffset);
    // Serialize message field [month]
    bufferOffset = _serializer.uint8(obj.month, buffer, bufferOffset);
    // Serialize message field [day]
    bufferOffset = _serializer.uint8(obj.day, buffer, bufferOffset);
    // Serialize message field [hour]
    bufferOffset = _serializer.uint8(obj.hour, buffer, bufferOffset);
    // Serialize message field [minute]
    bufferOffset = _serializer.uint8(obj.minute, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.uint8(obj.second, buffer, bufferOffset);
    // Serialize message field [coordinate_system]
    bufferOffset = _serializer.uint8(obj.coordinate_system, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DVL_Info
    let len;
    let data = new DVL_Info(null);
    // Deserialize message field [packet_count]
    data.packet_count = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [packet_id]
    data.packet_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [version]
    data.version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [system_type]
    data.system_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [system_subtype]
    data.system_subtype = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fw_major_version]
    data.fw_major_version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fw_minor_version]
    data.fw_minor_version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fw_patch_version]
    data.fw_patch_version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fw_build_version]
    data.fw_build_version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [year]
    data.year = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [month]
    data.month = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [day]
    data.day = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hour]
    data.hour = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [minute]
    data.minute = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [coordinate_system]
    data.coordinate_system = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_sensors/DVL_Info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0fce5519a2786a76ac927fac228614af';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DVL_Info(null);
    if (msg.packet_count !== undefined) {
      resolved.packet_count = msg.packet_count;
    }
    else {
      resolved.packet_count = 0
    }

    if (msg.packet_id !== undefined) {
      resolved.packet_id = msg.packet_id;
    }
    else {
      resolved.packet_id = 0
    }

    if (msg.version !== undefined) {
      resolved.version = msg.version;
    }
    else {
      resolved.version = 0
    }

    if (msg.system_type !== undefined) {
      resolved.system_type = msg.system_type;
    }
    else {
      resolved.system_type = 0
    }

    if (msg.system_subtype !== undefined) {
      resolved.system_subtype = msg.system_subtype;
    }
    else {
      resolved.system_subtype = 0
    }

    if (msg.fw_major_version !== undefined) {
      resolved.fw_major_version = msg.fw_major_version;
    }
    else {
      resolved.fw_major_version = 0
    }

    if (msg.fw_minor_version !== undefined) {
      resolved.fw_minor_version = msg.fw_minor_version;
    }
    else {
      resolved.fw_minor_version = 0
    }

    if (msg.fw_patch_version !== undefined) {
      resolved.fw_patch_version = msg.fw_patch_version;
    }
    else {
      resolved.fw_patch_version = 0
    }

    if (msg.fw_build_version !== undefined) {
      resolved.fw_build_version = msg.fw_build_version;
    }
    else {
      resolved.fw_build_version = 0
    }

    if (msg.year !== undefined) {
      resolved.year = msg.year;
    }
    else {
      resolved.year = 0
    }

    if (msg.month !== undefined) {
      resolved.month = msg.month;
    }
    else {
      resolved.month = 0
    }

    if (msg.day !== undefined) {
      resolved.day = msg.day;
    }
    else {
      resolved.day = 0
    }

    if (msg.hour !== undefined) {
      resolved.hour = msg.hour;
    }
    else {
      resolved.hour = 0
    }

    if (msg.minute !== undefined) {
      resolved.minute = msg.minute;
    }
    else {
      resolved.minute = 0
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = 0
    }

    if (msg.coordinate_system !== undefined) {
      resolved.coordinate_system = msg.coordinate_system;
    }
    else {
      resolved.coordinate_system = 0
    }

    return resolved;
    }
};

module.exports = DVL_Info;
