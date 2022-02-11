## Notes: does not seem to work on linux; png file produced on windows

library("hexSticker")

sticker("jkwd.png", package="Davies", p_size=30, s_x=0.975, s_y=1.0,
s_width=0.93,asp=sqrt(3)/2, white_around_sticker=TRUE, h_fill="#7733FF",
h_color="#000000", filename="Davies.png")

