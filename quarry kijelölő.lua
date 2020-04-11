x=?
y=?
szam=0
p=1

if 2*(x+y)<=1024 then main(x,y)
	else
		Print("Túl nagy terület")
	end

Function main (a,b)
	for k=1,0 do
		for i= 1,a do	
			turtle.dig()
			turtle.forward()
		end
			turtle.turnRight()
		for j= 1,b do
			turtle.dig()
			turlte.forward()
		end
			turtle.turnRight()
		for h= 1,2 do
			for m= 1,a do
				if szam=64 then
					p=p+1
					turtle.select(p)
					turtle.back()
					turtle.place()
					szam=1
				else
					turtle.back()
					turtle.place()
					szam=szam+1
				end
			end
			turtle.turnLeft()
			for n= 1,b do
				if szam=64 then	p=p+1
					turtle.select(p)
					turtle.back()
					turtle.place()
					szam=1
				else
					turtle.back()
					turtle.place()
					szam=szam+1
				end
			end
		turtle.turnLeft()
	end