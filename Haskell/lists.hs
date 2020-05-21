
size [] = 0
size (h:t) = h + size t

prod [] = 1
prod (h:t) = h * prod t
