(in-package #:cl-liballegro)

(defctype event-type event-types)

(defcstruct any-event
  (type event-type) (source :pointer) (timestamp :double))
(defcstruct display-event
  (type event-type) (source :pointer) (timestamp :double)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (orientation :int))
(defcstruct joystick-event
  (type event-type) (source :pointer) (timestamp :double)
  (id :pointer)
  (stick :int)
  (axis :int)
  (pos :float)
  (button :int))
(defcstruct keyboard-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
  (keycode keycodes)
  (unichar :int)
  (modifiers keymods)
  (repeat :boolean))
(defcstruct mouse-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
  (x :int)
  (y :int)
  (z :int)
  (w :int)
  (dx :int)
  (dy :int)
  (dz :int)
  (dw :int)
  (button :uint)
  (pressure :float))
(defcstruct timer-event
  (type event-type) (source :pointer) (timestamp :double)
  (count :int64)
  (error :double))
(defcstruct touch-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
  (id :int)
  (x :int)
  (y :int)
  (dx :int)
  (dy :int)
  (primary :bool))
(defcstruct user-event
  (type event-type) (source :pointer) (timestamp :double)
  (--internal--descr :pointer)
  (data1 (:pointer :int))
  (data2 (:pointer :int))
  (data3 (:pointer :int))
  (data4 (:pointer :int)))
(defcstruct audio-recorder-event
  (type event-type) (source :pointer) (timestamp :double)
  (--internal--desc :pointer)
  (buffer :pointer)
  (samples :uint))
(defcunion event
  (type event-type)
  (any (:struct any-event))
  (display (:struct display-event))
  (joystick (:struct joystick-event))
  (keyboard (:struct keyboard-event))
  (mouse (:struct mouse-event))
  (timer (:struct timer-event))
  (touch (:struct touch-event))
  (user (:struct user-event))
  (audio-record-event (:struct audio-recorder-event)))

(defcstruct (event-source :size 128))
(defcstruct event-queue)
