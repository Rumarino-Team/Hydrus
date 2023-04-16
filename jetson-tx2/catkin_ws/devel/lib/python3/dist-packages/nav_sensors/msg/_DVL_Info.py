# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from nav_sensors/DVL_Info.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class DVL_Info(genpy.Message):
  _md5sum = "0fce5519a2786a76ac927fac228614af"
  _type = "nav_sensors/DVL_Info"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
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
uint8 coordinate_system"""
  __slots__ = ['packet_count','packet_id','version','system_type','system_subtype','fw_major_version','fw_minor_version','fw_patch_version','fw_build_version','year','month','day','hour','minute','second','coordinate_system']
  _slot_types = ['uint16','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       packet_count,packet_id,version,system_type,system_subtype,fw_major_version,fw_minor_version,fw_patch_version,fw_build_version,year,month,day,hour,minute,second,coordinate_system

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(DVL_Info, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.packet_count is None:
        self.packet_count = 0
      if self.packet_id is None:
        self.packet_id = 0
      if self.version is None:
        self.version = 0
      if self.system_type is None:
        self.system_type = 0
      if self.system_subtype is None:
        self.system_subtype = 0
      if self.fw_major_version is None:
        self.fw_major_version = 0
      if self.fw_minor_version is None:
        self.fw_minor_version = 0
      if self.fw_patch_version is None:
        self.fw_patch_version = 0
      if self.fw_build_version is None:
        self.fw_build_version = 0
      if self.year is None:
        self.year = 0
      if self.month is None:
        self.month = 0
      if self.day is None:
        self.day = 0
      if self.hour is None:
        self.hour = 0
      if self.minute is None:
        self.minute = 0
      if self.second is None:
        self.second = 0
      if self.coordinate_system is None:
        self.coordinate_system = 0
    else:
      self.packet_count = 0
      self.packet_id = 0
      self.version = 0
      self.system_type = 0
      self.system_subtype = 0
      self.fw_major_version = 0
      self.fw_minor_version = 0
      self.fw_patch_version = 0
      self.fw_build_version = 0
      self.year = 0
      self.month = 0
      self.day = 0
      self.hour = 0
      self.minute = 0
      self.second = 0
      self.coordinate_system = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_H15B().pack(_x.packet_count, _x.packet_id, _x.version, _x.system_type, _x.system_subtype, _x.fw_major_version, _x.fw_minor_version, _x.fw_patch_version, _x.fw_build_version, _x.year, _x.month, _x.day, _x.hour, _x.minute, _x.second, _x.coordinate_system))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.packet_count, _x.packet_id, _x.version, _x.system_type, _x.system_subtype, _x.fw_major_version, _x.fw_minor_version, _x.fw_patch_version, _x.fw_build_version, _x.year, _x.month, _x.day, _x.hour, _x.minute, _x.second, _x.coordinate_system,) = _get_struct_H15B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_H15B().pack(_x.packet_count, _x.packet_id, _x.version, _x.system_type, _x.system_subtype, _x.fw_major_version, _x.fw_minor_version, _x.fw_patch_version, _x.fw_build_version, _x.year, _x.month, _x.day, _x.hour, _x.minute, _x.second, _x.coordinate_system))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.packet_count, _x.packet_id, _x.version, _x.system_type, _x.system_subtype, _x.fw_major_version, _x.fw_minor_version, _x.fw_patch_version, _x.fw_build_version, _x.year, _x.month, _x.day, _x.hour, _x.minute, _x.second, _x.coordinate_system,) = _get_struct_H15B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_H15B = None
def _get_struct_H15B():
    global _struct_H15B
    if _struct_H15B is None:
        _struct_H15B = struct.Struct("<H15B")
    return _struct_H15B
