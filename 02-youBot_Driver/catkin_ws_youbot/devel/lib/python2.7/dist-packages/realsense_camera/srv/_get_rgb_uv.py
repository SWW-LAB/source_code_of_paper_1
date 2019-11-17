# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from realsense_camera/get_rgb_uvRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class get_rgb_uvRequest(genpy.Message):
  _md5sum = "a92ee70ae3aa698002080ad29e31d017"
  _type = "realsense_camera/get_rgb_uvRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int32 x_min_depth
int32 x_min_xy
int32 y_min_depth
int32 y_min_xy
int32 x_max_depth
int32 x_max_xy
int32 y_max_depth
int32 y_max_xy
"""
  __slots__ = ['x_min_depth','x_min_xy','y_min_depth','y_min_xy','x_max_depth','x_max_xy','y_max_depth','y_max_xy']
  _slot_types = ['int32','int32','int32','int32','int32','int32','int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x_min_depth,x_min_xy,y_min_depth,y_min_xy,x_max_depth,x_max_xy,y_max_depth,y_max_xy

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(get_rgb_uvRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.x_min_depth is None:
        self.x_min_depth = 0
      if self.x_min_xy is None:
        self.x_min_xy = 0
      if self.y_min_depth is None:
        self.y_min_depth = 0
      if self.y_min_xy is None:
        self.y_min_xy = 0
      if self.x_max_depth is None:
        self.x_max_depth = 0
      if self.x_max_xy is None:
        self.x_max_xy = 0
      if self.y_max_depth is None:
        self.y_max_depth = 0
      if self.y_max_xy is None:
        self.y_max_xy = 0
    else:
      self.x_min_depth = 0
      self.x_min_xy = 0
      self.y_min_depth = 0
      self.y_min_xy = 0
      self.x_max_depth = 0
      self.x_max_xy = 0
      self.y_max_depth = 0
      self.y_max_xy = 0

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
      buff.write(_struct_8i.pack(_x.x_min_depth, _x.x_min_xy, _x.y_min_depth, _x.y_min_xy, _x.x_max_depth, _x.x_max_xy, _x.y_max_depth, _x.y_max_xy))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.x_min_depth, _x.x_min_xy, _x.y_min_depth, _x.y_min_xy, _x.x_max_depth, _x.x_max_xy, _x.y_max_depth, _x.y_max_xy,) = _struct_8i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_8i.pack(_x.x_min_depth, _x.x_min_xy, _x.y_min_depth, _x.y_min_xy, _x.x_max_depth, _x.x_max_xy, _x.y_max_depth, _x.y_max_xy))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.x_min_depth, _x.x_min_xy, _x.y_min_depth, _x.y_min_xy, _x.x_max_depth, _x.x_max_xy, _x.y_max_depth, _x.y_max_xy,) = _struct_8i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_8i = struct.Struct("<8i")
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from realsense_camera/get_rgb_uvResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class get_rgb_uvResponse(genpy.Message):
  _md5sum = "36c20a9a661d32cf44ffca6c6be7e4a2"
  _type = "realsense_camera/get_rgb_uvResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int32 x_min_uv
int32 y_min_uv
int32 x_max_uv
int32 y_max_uv
"""
  __slots__ = ['x_min_uv','y_min_uv','x_max_uv','y_max_uv']
  _slot_types = ['int32','int32','int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x_min_uv,y_min_uv,x_max_uv,y_max_uv

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(get_rgb_uvResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.x_min_uv is None:
        self.x_min_uv = 0
      if self.y_min_uv is None:
        self.y_min_uv = 0
      if self.x_max_uv is None:
        self.x_max_uv = 0
      if self.y_max_uv is None:
        self.y_max_uv = 0
    else:
      self.x_min_uv = 0
      self.y_min_uv = 0
      self.x_max_uv = 0
      self.y_max_uv = 0

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
      buff.write(_struct_4i.pack(_x.x_min_uv, _x.y_min_uv, _x.x_max_uv, _x.y_max_uv))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.x_min_uv, _x.y_min_uv, _x.x_max_uv, _x.y_max_uv,) = _struct_4i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_4i.pack(_x.x_min_uv, _x.y_min_uv, _x.x_max_uv, _x.y_max_uv))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 16
      (_x.x_min_uv, _x.y_min_uv, _x.x_max_uv, _x.y_max_uv,) = _struct_4i.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_4i = struct.Struct("<4i")
class get_rgb_uv(object):
  _type          = 'realsense_camera/get_rgb_uv'
  _md5sum = '0eb5e9c6325d1b134d64fc42997917cc'
  _request_class  = get_rgb_uvRequest
  _response_class = get_rgb_uvResponse
