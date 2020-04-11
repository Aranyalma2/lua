--Ez a program rohadt sok időm elvette az éltből!!!!!!!!!
--Te ilyet ne írj soha, nem éri meg
--De akkor is én győzök.......Nyertem......

local arg = { ... }

type = arg[1]
sugar= tonumber(arg[2])


bool_1 = false
blocks = 0
if arg[3] == "-c" then
  bool_1 = true
end


positionx = sugar
positiony = sugar
fordul = 0
fordul_epit=0
nem_tudok_tobb_valtozo_nevet = 0


function turnRightTrack()
  turtle.turnRight()
  fordul = fordul + 1
  if fordul >= 4 then
    fordul = 0
  end
end

function turnLeftTrack()
  turtle.turnLeft()
  fordul = fordul - 1
  if fordul < 0 then
    fordul = 3
  end
end

function safeForward()
  elzarva = false
  while not elzarva do
    elzarva = turtle.forward()
    if not elzarva then
      print("Nem tudok elore menni.")
      print("Javitsd, majd uss Enter-t.")
      io.read()
    end
  end
end

function safeBack()
  elzarva = false
  while not elzarva do
    elzarva = turtle.back()
    if not elzarva then
      print("Nem tudok hatra menni.")
      print("Javitsd, majd uss Enter-t.")
      io.read()
    end
  end
end

function safeUp()
  elzarva = false
  while not elzarva do
    elzarva = turtle.up()
    if not elzarva then
      print("Nem tudok felfele menni.")
      print("Javitsd, majd uss Enter-t.")
      io.read()
    end
  end
end

function safeDown()
  elzarva = false
  while not elzarva do
    elzarva = turtle.down()
    if not elzarva then
      print("Nem tudok lelfele menni.")
      print("Javitsd, majd uss Enter-t.")
      io.read()
    end
  end
end

	-- Y tengelyen való mozgás

function moveY(targety)
  if targety == positiony then
    return
  end
  
  if (fordul ~= 0 and fordul ~= 2) then 
    turnRightTrack()
  end
  
  while targety > positiony do
    if fordul == 0 then
      safeForward()
    else
      safeBack()
    end
    positiony = positiony + 1
  end
  
  while targety < positiony do
    if fordul == 2 then
      safeForward()
    else
      safeBack()
    end
    positiony = positiony - 1
  end
end

	-- X tengelyen való mozgás

function moveX(targetx)
  if targetx == positionx then
    return
  end
  
  if (fordul ~= 1 and fordul ~= 3) then 
    turnRightTrack()
  end
  
  while targetx > positionx do
    if fordul == 1 then
      safeForward()
    else
      safeBack()
    end
    positionx = positionx + 1
  end
  
  while targetx < positionx do
    if fordul == 3 then
      safeForward()
    else
      safeBack()
    end
    positionx = positionx - 1
  end
end






function navigateTo(targetx, targety)


  -- mozgás

  if bool_1 then
    return
  end
  
  if fordul == 0 or fordul == 2 then 
    moveY(targety)
    moveX(targetx)
  else
    moveX(targetx)
    moveY(targety)
  end
end



alap_slot = 1

function placeBlock()

  blocks = blocks + 1
  if bool_1 then
    return
  end
  
  if turtle.getItemCount(alap_slot) == 0 then
    Slot = false
    while not Slot do
      for i = 1,16 do
        if turtle.getItemCount(i) > 1 then
          Slot = i
		  nem_tudok_tobb_valtozo_nevet=0
          break
        end
      end
      if not Slot then
		turtle.placeDown()	
		fordul_epit=0
		fordul_epit=fordul
		navigateTo(sugar, sugar)
			t=0
		while (reteg-1>t) do
			t=t+1
			turtle.down()
		end
			turtle.suckDown(64)
			t=0
		while (reteg>t) do
			t=t+1
			turtle.up()
		end
	nem_tudok_tobb_valtozo_nevet=1
      end
    end
    alap_slot = Slot
    turtle.select(Slot)
  end
  if nem_tudok_tobb_valtozo_nevet>0 then       
	nem_tudok_tobb_valtozo_nevet=0
	break
  else
  turtle.placeDown()
  end
end

-- Térbeli építés számítás

--matek elmélet:

szelesseg = sugar * 2 + 1
sqrt3 = 3 ^ 0.5
hatar_sugar = sugar + 1.0
hatar_2 = hatar_sugar ^ 2

--érték bekérés

if type == "kupola" then
  zkezd = sugar
  vegszam=1
elseif type == "gomb" then
  zkezd = 0
  vegszam = 0
else
  print("Hasznalat: <program_neve> <alakzat> <sugar> [-c]")
  os.exit(1)
end
zveg = szelesseg - 1

-- Vertikális réteg építés számítás

for z = zkezd,zveg do
  if not bool_1 then
    safeUp()
  end 
 
	if vegszam==1 then
		reteg=z-sugar+1
		print("Eppen epulo reteg " .. reteg ..".")
		else 
			 print("Eppen epulo reteg " .. z+1 ..".")
	end
	
	--cz
	
  cz2 = (sugar - z) ^ 2
  
  limit_offset_y = (hatar_2 - cz2) ^ 0.5
  max_offset_y = math.ceil(limit_offset_y)
  
  for side = 0,1 do
    
    if (side == 0) then
      ykezd = sugar - max_offset_y
      yveg = sugar + max_offset_y
      ylepes = 1
    else
      ykezd = sugar + max_offset_y
      yveg = sugar - max_offset_y
      ylepes = -1
    end
    
	--cy
	
    for y = ykezd,yveg,ylepes do
      cy2 = (sugar - y) ^ 2
      
      offset_maradek = (hatar_2 - cz2 - cy2)

      
      if offset_maradek >= 0 then
       
        max_offset_x = math.ceil((hatar_2 - cz2 - cy2) ^ 0.5)
	
        
        if (side == 0) then
  
          xkezd = sugar
          xveg = sugar + max_offset_x
        else

          xkezd = sugar - max_offset_x
          xveg = sugar - 1
        end
        
  
        if y > sugar then
          temp = xkezd
          xkezd = xveg
          xveg = temp
          xlepes = -1
        else
          xlepes = 1
        end
        
		--cx
		
        for x = xkezd,xveg,xlepes do
          cx2 = (sugar - x) ^ 2
          kozepontol_valo_tav = (cx2 + cy2 + cz2) ^ 0.5
          
          if kozepontol_valo_tav < hatar_sugar and kozepontol_valo_tav + sqrt3 >= hatar_sugar then
            offsets = {{0, 1, 0}, {0, -1, 0}, {1, 0, 0}, {-1, 0, 0}, {0, 0, 1}, {0, 0, -1}}
            for i=1,6 do
              offset = offsets[i]
              dx = offset[1]
              dy = offset[2]
              dz = offset[3]
              if ((sugar - (x + dx)) ^ 2 + (sugar - (y + dy)) ^ 2 + (sugar - (z + dz)) ^ 2) ^ 0.5 >= hatar_sugar then
               
                navigateTo(x, y)
                placeBlock()
                break
              end
            end
          end
        end
      end
    end
  end
end

--ha vegez, vissza megy oda ahov indul, csak a kész épület tetején

navigateTo(sugar, sugar)
while (fordul > 0) do
  turnLeftTrack()
end
io.write "\n"
print("Felhasznalt block: " .. blocks)
print("Teljes szelesseg: " .. sugar*2+1)
if vegszam==1 then
		print("Teljes magassag: " .. sugar+1)
		
	else
		print("Teljes magassag " .. sugar*2+1)
end

io.write("Az epuletet keszitette:\nGomb epito v11.43\n")