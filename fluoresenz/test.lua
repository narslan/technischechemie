fs = dofile("fs.lua")

function drawZZ()

  xwerte, ywerte = fs.readcsv("data/ph12anregung420_410.txt",23)
  xa, xb= fs.readcsv("data/ph02anregung350_340.txt",23)


  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#xwerte do
    tex.sprint("("..xwerte[i]..","..ywerte[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{2-Naphtholat}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#xa do
    tex.sprint("("..xa[i]..","..xb[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{2-Naphthol}")
end

function drawPU()

  ph12ax,ph12ay = fs.readcsv("data/ph12anregung420_410.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph12emmissions_360_370.txt",23)

  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")
  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")


  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("node [pos=1,anchor=east, text=black] {Fluoreszenzintensität};")
  tex.sprint("\\draw[->] (0,-2) -- (0,4) node[above] {$y(t)$};")
  tex.sprint("\\addlegendentry{Emission}")

end



function drawZU()

  ph12ax,ph12ay = fs.readcsv("data/ph12anregung_350_340.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph12emmissions_320_330.txt",23)



  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Emission}")

end

function drawHU()

  ph12ax,ph12ay = fs.readcsv("data/ph06anregung420_410.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph06emmissions_360_370.txt",23)

  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Emission}")

end

function drawOU()

  ph12ax,ph12ay = fs.readcsv("data/ph06anregung350_340.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph06emmissions_320_330.txt",23)



  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Emission}")

end

function drawBU()

  ph12ax,ph12ay = fs.readcsv("data/ph02anregung420_410.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph02emmissions_360_370.txt",23)

  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Emission}")

end

function drawIU()

  ph12ax,ph12ay = fs.readcsv("data/ph02anregung350_340.txt",23)
  ph12ex,ph12ey = fs.readcsv("data/ph02emmissions_320_330.txt",23)



  tex.sprint("\\addplot[".."no marks,blue".."] coordinates{")

  for i=1,#ph12ax do
    tex.sprint("("..ph12ax[i]..","..ph12ay[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Anregung}")

  tex.sprint("\\addplot[".."no marks,red".."] coordinates{")

  for i=1,#ph12ex do
    tex.sprint("("..ph12ex[i]..","..ph12ey[i]..")")
  end
  tex.sprint("};")
  tex.sprint("\\addlegendentry{Emission}")

end


