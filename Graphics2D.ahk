drawCross(x, y, line_lenght, gui_count, gui_name)
{
	Gui, %gui_count%:destroy
	pos_xy := line_lenght / 2
	Gui, %gui_count%:Color, 0x00ff00
	Gui, %gui_count%:Add, GroupBox, x1 y%pos_xy% w%line_lenght% h3
	Gui, %gui_count%:Add, GroupBox, x%pos_xy% y2 w1 h%line_lenght%
	Gui, %gui_count%: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
	xc := x - pos_xy -1
	yc := y - pos_xy - 4
	Gui, %gui_count%:Show, x%xc% y%yc% NoActivate, %gui_name%
	WinSet, TransColor, c00ff00 255, %gui_name%
}

drawBox(x, y, x2, y2, box_color, transparency, gui_count, gui_name)
{ 
	Gui, %gui_count%:destroy
	Gui, %gui_count%:Color, 0x0000ff
	Gui, %gui_count%: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
	gui, %gui_count%:margin,, 0
	w := x2 - x
	h := y2 - y
	Gui, %gui_count%:Show, x%x% y%y% w%w% h%h% NoActivate, %gui_name%
	WinSet, TransColor, c0000ff %transparency%, %gui_name%
	Gui, %gui_count%: Color, %box_color%
}

drawString(x, y, string, string_color, background_color, size, Font, gui_count, gui_name, centered)
{
	StringTrimLeft, background_color, background_color, 2
    Gui, %gui_count%:destroy
    Gui, %gui_count%: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
    Gui, %gui_count%:Color, c%background_color%
    Gui, %gui_count%:Font, s%size% q1 c%string_color%, %Font%
    gui, %gui_count%:margin,, 0
    gui, %gui_count%:add, text,, %string%
    Gui, %gui_count%:Show, y%Y% x%X% NoActivate, %gui_name%
    WinSet, TransColor, c%background_color% 255, %gui_name%
	if(centered==1)
	{
		WinGetPos, w_x, w_y, w_w, w_h, %gui_name%
		w_x := w_x - (w_w / 2)
		w_y := w_y - (w_h / 2)
		WinMove, %gui_name%,, %w_x%, %w_y%
	}
}
