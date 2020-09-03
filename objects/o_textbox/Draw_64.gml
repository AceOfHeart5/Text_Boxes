draw_set_valign(fa_top);
draw_set_halign(fa_left);

var _x = 0;
var _y = 40;

var test = text_char_at(60);

/* To draw the text, we iterate over each row and struct
in the 2D text list. Each time, we subtract the string
length of the struct at irow/ichar from _cursor_char. once
the length of the struct is larger than _cursor_char, we
draw the correct portion of the struct, and we are done. */
var _cursor_char = floor(cursor_char);

for (var irow = 0; irow < ds_list_size(text); irow++) {
	_x = 40;
	var row_height = 0;
	// irow is changed when we reach end of typing, so we store value here
	var row_size = ds_list_size(text[|irow]);
	for (var ichar = 0; ichar < row_size; ichar++) {
		var text_struct = text[|irow][|ichar];
		draw_set_font(text_struct.font);
		draw_set_color(text_struct.text_color);
		var draw_x = _x + text_struct.draw_mod_x;
		var draw_y = _y + text_struct.draw_mod_y;
		if (text_struct.get_height() > row_height) row_height = text_struct.get_height();
		
		if (string_length(text_struct.text) < _cursor_char) {
			_cursor_char -= string_length(text_struct.text);
			draw_text(draw_x, draw_y, text_struct.text);
		} else {
			// if we reach this block, we have reached the end of typing
			ichar = ds_list_size(text[|irow]);
			irow = ds_list_size(text);
			var _text = string_copy(text_struct.text, 1, _cursor_char);
			draw_text(draw_x, draw_y, _text);
		}
		
		_x += text_struct.get_width();
	}
	_y += row_height;
}
