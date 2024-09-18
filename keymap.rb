# Initialize a Keyboard
kbd = Keyboard.new

# Initialize GPIO assign (controller on the left)
kbd.init_pins(
  [ 21, 20, 19, 18], # row0 (top), row1,... respectively
  [ 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ]  # col0 (left), col1,... respectively
)
#keyboard.row_pins = (board.GP21, board.GP20, board.GP19, board.GP18)
#keyboard.col_pins = (board.GP0, board.GP1, board.GP2, board.GP3, board.GP4, board.GP5, board.GP6, board.GP7, board.GP8, board.GP9, board.GP10, board.GP11, board.GP12, board.GP13)

# default layer should be added at first
kbd.add_layer :default, [
  :KC_ESC,   :KC_Q,   :KC_W,   :KC_E,   :KC_R,  :KC_T,     :KC_Y,    :KC_U,   :KC_I,     :KC_O,    :KC_P,       :KC_LBRC,  :KC_RBRC,   :KC_DEL, 
  :KC_LCTL,  :KC_A,   :KC_S,   :KC_D,   :KC_F,  :KC_G,     :KC_H,    :KC_J,   :KC_K,     :KC_L,    :KC_SCOLON,  :KC_QUOT,  :KC_GRAVE,  :KC_RCTL,    
  :KC_LSFT,  :KC_Z,   :KC_X,   :KC_C,   :KC_V,  :KC_B,     :KC_N,    :KC_M,   :KC_COMM,  :KC_DOT,  :KC_SLSH,    :KC_BSLS,  :KC_NO,     :KC_RSFT,
  :KC_NO,    :KC_NO,  :KC_NO,  :KC_NO,  :FN,    :KC_LGUI,  :KC_SPC,  :KC_NO,  :KC_RALT,  :FN,      :KC_NO,      :KC_NO,    :KC_NO,     :KC_NO     
]
kbd.add_layer :adjust, [
  :KC_TAB,   :KC_1,     :KC_2,   :KC_3,     :KC_4,     :KC_5,     :KC_6,    :KC_7,   :KC_8,     :KC_9,     :KC_0,     :KC_MINUS,  :KC_EQUAL,  :KC_BSPC,
  :KC_LCTL,  :KC_F1,    :KC_F2,  :KC_F3,    :KC_F4,    :KC_F5,    :KC_F6,   :KC_F7,  :KC_F8,    :KC_F9,    :KC_F10,   :KC_F11,    :KC_F12,    :KC_RCTL, 
  :KC_LSFT,  :KC_LEFT,  :KC_UP,  :KC_DOWN,  :KC_RGHT,  :KC_NO,    :KC_NO,   :KC_NO,  :KC_NO,    :KC_LEFT,  :KC_DOWN,  :KC_UP,     :KC_RGHT,   :KC_RSFT,
  :KC_NO,    :KC_NO,    :KC_NO,  :KC_NO,    :FN,       :KC_LGUI,  :KC_ENT,  :KC_NO,  :KC_RALT,  :FN,       :KC_NO,    :KC_NO,     :KC_NO,     :KC_NO    
]
#                   (1)   (2)   (3)     (4)  (5)
kbd.define_mode_key :FN, [nil, :adjust, 120, 150]
# (1) Your custom key name
# (2) Symbol of a keycode, Array of multiple keycodes, or Proc which is going to be called when you tap
# (3) Symbol of a keycode (only a modifier), Symbol of a layer to be held, or Proc
# (4) Release time threshold(ms) to consider as `click the key`
# (5) Re-push time threshold(ms) to consider as `hold the key`

kbd.start!
