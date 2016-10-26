require('functions')

-- ПЛАТОНОВІ ТІЛА

-- Тетраедр
Tetrahedron = {}

Tetrahedron.new = function(a, dx, dy, dz)
	tetra = {}
	
	-- Координати вершин
	tetra[1] = Point.new3(-a+dx,-a+dy,a+dz)
	tetra[2] = Point.new3(-a+dx,a+dy,-a+dz)
	tetra[3] = Point.new3(a+dx,-a+dy,-a+dz)
	tetra[4] = Point.new3(a+dx,a+dy,a+dz)

	-- Створеня списку полінів та z-індексів
	tetra.makeFaces = function(t, p)
		facesT = {}
		facesT[1] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[3].x, p[3].y}, z_index = (t[1].z + t[2].z + t[3].z)/3}
		facesT[2] = {list = {p[1].x, p[1].y, p[3].x, p[3].y, p[4].x, p[4].y}, z_index = (t[1].z + t[3].z + t[4].z)/3}
		facesT[3] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[4].x, p[4].y}, z_index = (t[2].z + t[3].z + t[4].z)/3}
		facesT[4] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[4].x, p[4].y}, z_index = (t[1].z + t[2].z + t[4].z)/3}
		return facesT
	end

	return tetra
end

-- Куб
Cube = {}

Cube.new = function(b, dx, dy, dz)

	cube = {}
	
	-- Координати вершин
	cube[1] = Point.new3(-b+dx,-b+dy,-b+dz)
	cube[2] = Point.new3(-b+dx,b+dy,-b+dz)
	cube[3] = Point.new3(b+dx,b+dy,-b+dz)
	cube[4] = Point.new3(b+dx,-b+dy,-b+dz)
	cube[5] = Point.new3(-b+dx,-b+dy,b+dz)
	cube[6] = Point.new3(-b+dx,b+dy,b+dz)
	cube[7] = Point.new3(b+dx,b+dy,b+dz)
	cube[8] = Point.new3(b+dx,-b+dy,b+dz)

	-- Створеня списку полінів та z-індексів
	cube.makeFaces = function(t, p)
		facesCube = {}
		facesCube[1] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[3].x, p[3].y, p[4].x, p[4].y}, z_index = (t[1].z + t[2].z + t[3].z + t[4].z)/4}
		facesCube[2] = {list = {p[5].x, p[5].y, p[6].x, p[6].y, p[7].x, p[7].y, p[8].x, p[8].y}, z_index = (t[5].z + t[6].z + t[7].z + t[8].z)/4}
		facesCube[3] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[6].x, p[6].y, p[5].x, p[5].y}, z_index = (t[1].z + t[2].z + t[6].z + t[5].z)/4}
		facesCube[4] = {list = {p[3].x, p[3].y, p[4].x, p[4].y, p[8].x, p[8].y, p[7].x, p[7].y}, z_index = (t[3].z + t[4].z + t[8].z + t[7].z)/4}
		facesCube[5] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[7].x, p[7].y, p[6].x, p[6].y}, z_index = (t[2].z + t[3].z + t[7].z + t[6].z)/4}
		facesCube[6] = {list = {p[1].x, p[1].y, p[4].x, p[4].y, p[8].x, p[8].y, p[5].x, p[5].y}, z_index = (t[1].z + t[4].z + t[8].z + t[5].z)/4}
		return facesCube
	end

	return cube
end

-- Октаедр
Octahedron = {}

Octahedron.new = function(c, dx, dy, dz)

	octa = {}
	
	-- Координати вершин
	octa[1] = Point.new3(dx,dy,c+dz)
	octa[2] = Point.new3(dx,dy,-c+dz)
	octa[3] = Point.new3(dx,-c+dy,dz)
	octa[4] = Point.new3(-c+dx,dy,dz)
	octa[5] = Point.new3(dx,c+dy,dz)
	octa[6] = Point.new3(c+dx,dy,dz)

	-- Створеня списку полінів та z-індексів
	octa.makeFaces = function(t, p)
		facesOct = {}
		facesOct[1] = {list = {p[1].x, p[1].y, p[4].x, p[4].y, p[5].x, p[5].y}, z_index = (t[1].z + t[4].z + t[5].z)/3}
		facesOct[2] = {list = {p[1].x, p[1].y, p[3].x, p[3].y, p[4].x, p[4].y}, z_index = (t[1].z + t[3].z + t[4].z)/3}
		facesOct[3] = {list = {p[1].x, p[1].y, p[3].x, p[3].y, p[6].x, p[6].y}, z_index = (t[1].z + t[3].z + t[6].z)/3}
		facesOct[4] = {list = {p[1].x, p[1].y, p[5].x, p[5].y, p[6].x, p[6].y}, z_index = (t[1].z + t[5].z + t[6].z)/3}
		facesOct[5] = {list = {p[2].x, p[2].y, p[4].x, p[4].y, p[5].x, p[5].y}, z_index = (t[2].z + t[4].z + t[5].z)/3}
		facesOct[6] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[4].x, p[4].y}, z_index = (t[2].z + t[3].z + t[4].z)/3}
		facesOct[7] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[6].x, p[6].y}, z_index = (t[2].z + t[3].z + t[6].z)/3}
		facesOct[8] = {list = {p[2].x, p[2].y, p[5].x, p[5].y, p[6].x, p[6].y}, z_index = (t[2].z + t[5].z + t[6].z)/3}
		return facesOct
	end

	return octa
end

-- Додекаедр 
Dodecahedron = {}
Dodecahedron.new = function(c, dx, dy, dz)

	-- золотий перетин
	phi = (1+math.sqrt(5))/2

	dodeca = {}
	
	-- Координати вершин
	dodeca[1] = Point.new3(-c+dx, -c+dy, -c+dz)
	dodeca[2] = Point.new3(-c+dx, -c+dy, c+dz)
	dodeca[3] = Point.new3(-c+dx, c+dy, -c+dz)
	dodeca[4] = Point.new3(c+dx, -c+dy, -c+dz)
	dodeca[5] = Point.new3(-c+dx, c+dy, c+dz)
	dodeca[6] = Point.new3(c+dx, c+dy, -c+dz)
	dodeca[7] = Point.new3(c+dx, -c+dy, c+dz)
	dodeca[8] = Point.new3(c+dx, c+dy, c+dz)
	dodeca[9] = Point.new3(0+dx, -c/phi+dy, -c*phi+dz)
	dodeca[10] = Point.new3(0+dx, c/phi+dy, -c*phi+dz)
	dodeca[11] = Point.new3(0+dx, -c/phi+dy, c*phi+dz)
	dodeca[12] = Point.new3(0+dx, c/phi+dy, c*phi+dz)
	dodeca[13] = Point.new3(-c/phi+dx, -c*phi+dy, 0+dz)
	dodeca[14] = Point.new3(c/phi+dx, -c*phi+dy, 0+dz)
	dodeca[15] = Point.new3(-c/phi+dx, c*phi+dy, 0+dz)
	dodeca[16] = Point.new3(c/phi+dx, c*phi+dy, 0+dz)
	dodeca[17] = Point.new3(-c*phi+dx, 0+dy, -c/phi+dz)
	dodeca[18] = Point.new3(c*phi+dx, 0+dy, -c/phi+dz)
	dodeca[19] = Point.new3(-c*phi+dx, 0+dy, c/phi+dz)
	dodeca[20] = Point.new3(c*phi+dx, 0+dy, c/phi+dz)

	-- Створеня списку полінів та z-індексів
	dodeca.makeFaces = function(t, p)
		facesD = {}
		facesD[1] = {list = {p[2].x, p[2].y, p[11].x, p[11].y, p[7].x, p[7].y, p[14].x, p[14].y, p[13].x, p[13].y},
			z_index = (t[2].z + t[11].z + t[7].z + t[14].z + t[13].z)/5}
		facesD[2] = {list = {p[2].x, p[2].y, p[11].x, p[11].y, p[12].x, p[12].y, p[5].x, p[5].y, p[19].x, p[19].y},
			z_index = (t[2].z + t[11].z + t[12].z + t[5].z + t[19].z)/5}
		facesD[3] = {list = {p[2].x, p[2].y, p[13].x, p[13].y, p[1].x, p[1].y, p[17].x, p[17].y, p[19].x, p[19].y},
			z_index = (t[2].z + t[13].z + t[1].z + t[17].z + t[19].z)/5}
		facesD[4] = {list = {p[11].x, p[11].y, p[7].x, p[7].y, p[20].x, p[20].y, p[8].x, p[8].y, p[12].x, p[12].y},
			z_index = (t[11].z + t[7].z + t[20].z + t[8].z + t[12].z)/5}
		facesD[5] = {list = {p[3].x, p[3].y, p[17].x, p[17].y, p[19].x, p[19].y, p[5].x, p[5].y, p[15].x, p[15].y},
			z_index = (t[3].z + t[17].z + t[19].z + t[5].z + t[15].z)/5}
		facesD[6] = {list = {p[13].x, p[13].y, p[14].x, p[14].y, p[4].x, p[4].y, p[9].x, p[9].y, p[1].x, p[1].y},
			z_index = (t[13].z + t[14].z + t[4].z + t[9].z + t[1].z)/5}
		facesD[7] = {list = {p[3].x, p[3].y, p[17].x, p[17].y, p[1].x, p[1].y, p[9].x, p[9].y, p[10].x, p[10].y},
			z_index = (t[3].z + t[17].z + t[1].z + t[9].z + t[10].z)/5}
		facesD[8] = {list = {p[7].x, p[7].y, p[14].x, p[14].y, p[4].x, p[4].y, p[18].x, p[18].y, p[20].x, p[20].y},
			z_index = (t[7].z + t[14].z + t[4].z + t[18].z + t[20].z)/5}
		facesD[9] = {list = {p[3].x, p[3].y, p[15].x, p[15].y, p[16].x, p[16].y, p[6].x, p[6].y, p[10].x, p[10].y},
			z_index = (t[3].z + t[15].z + t[16].z + t[6].z + t[10].z)/5}
		facesD[10] = {list = {p[5].x, p[5].y, p[12].x, p[12].y, p[8].x, p[8].y, p[16].x, p[16].y, p[15].x, p[15].y},
			z_index = (t[5].z + t[12].z + t[8].z + t[16].z + t[15].z)/5}
		facesD[11] = {list = {p[8].x, p[8].y, p[16].x, p[16].y, p[6].x, p[6].y, p[18].x, p[18].y, p[20].x, p[20].y},
			z_index = (t[8].z + t[16].z + t[6].z + t[18].z + t[20].z)/5}
		facesD[12] = {list = {p[6].x, p[6].y, p[18].x, p[18].y, p[4].x, p[4].y, p[9].x, p[9].y, p[10].x, p[10].y},
			z_index = (t[6].z + t[18].z + t[4].z + t[9].z)/5}
		return facesD
	end

	return dodeca
end

-- Ікосаедр
Icosahedron = {}

Icosahedron.new = function(s, dx, dy, dz)
	icosa = {}

	A = Point.new3(s, 0, -0.5*s)
	icosa[1] = Point.new3(s, 0, -0.5*s)
	icosa[2] = rotateZ(A, 2*math.pi/5)
	icosa[3] = rotateZ(A, 4*math.pi/5)
	icosa[4] = rotateZ(A, 6*math.pi/5)
	icosa[5] = rotateZ(A, 8*math.pi/5)
	A = Point.new3(s, 0, 0.5*s)
	icosa[6] = rotateZ(A, math.pi/5)
	icosa[7] = rotateZ(A, 3*math.pi/5)
	icosa[8] = rotateZ(A, 5*math.pi/5)
	icosa[9] = rotateZ(A, 7*math.pi/5)
	icosa[10] = rotateZ(A, 9*math.pi/5)
	icosa[11] = Point.new3(0, 0, -s*math.sqrt(5)/2)
	icosa[12] = Point.new3(0, 0, s*math.sqrt(5)/2)
	for i=1,#icosa do
		Translate(icosa[i], dx, dy, dz)
	end

	-- Створеня списку полінів та z-індексів
	icosa.makeFaces = function(t, p)
		facesIc = {}
		facesIc[1] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[11].x, p[11].y}, z_index = (t[1].z + t[2].z + t[11].z)/3}
		facesIc[2] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[11].x, p[11].y}, z_index = (t[2].z + t[3].z + t[11].z)/3}
		facesIc[3] = {list = {p[3].x, p[3].y, p[4].x, p[4].y, p[11].x, p[11].y}, z_index = (t[3].z + t[4].z + t[11].z)/3}
		facesIc[4] = {list = {p[4].x, p[4].y, p[5].x, p[5].y, p[11].x, p[11].y}, z_index = (t[4].z + t[5].z + t[11].z)/3}
		facesIc[5] = {list = {p[5].x, p[5].y, p[1].x, p[1].y, p[11].x, p[11].y}, z_index = (t[5].z + t[1].z + t[11].z)/3}
		facesIc[6] = {list = {p[6].x, p[6].y, p[7].x, p[7].y, p[12].x, p[12].y}, z_index = (t[6].z + t[7].z + t[12].z)/3}
		facesIc[7] = {list = {p[7].x, p[7].y, p[8].x, p[8].y, p[12].x, p[12].y}, z_index = (t[7].z + t[8].z + t[12].z)/3}
		facesIc[8] = {list = {p[8].x, p[8].y, p[9].x, p[9].y, p[12].x, p[12].y}, z_index = (t[8].z + t[9].z + t[12].z)/3}
		facesIc[9] = {list = {p[9].x, p[9].y, p[10].x, p[10].y, p[12].x, p[12].y}, z_index = (t[9].z + t[10].z + t[12].z)/3}
		facesIc[10] = {list = {p[10].x, p[10].y, p[6].x, p[6].y, p[12].x, p[12].y}, z_index = (t[10].z+ t[6].z + t[12].z)/3}
		facesIc[11] = {list = {p[1].x, p[1].y, p[2].x, p[2].y, p[6].x, p[6].y}, z_index = (t[1].z + t[6].z + t[6].z)/3}
		facesIc[12] = {list = {p[2].x, p[2].y, p[3].x, p[3].y, p[7].x, p[7].y}, z_index = (t[2].z + t[7].z + t[7].z)/3}
		facesIc[13] = {list = {p[3].x, p[3].y, p[4].x, p[4].y, p[8].x, p[8].y}, z_index = (t[3].z + t[4].z + t[8].z)/3}
		facesIc[14] = {list = {p[4].x, p[4].y, p[5].x, p[5].y, p[9].x, p[9].y}, z_index = (t[4].z + t[5].z + t[9].z)/3}
		facesIc[15] = {list = {p[5].x, p[5].y, p[1].x, p[1].y, p[10].x, p[10].y}, z_index = (t[5].z + t[1].z + t[10].z)/3}
		facesIc[16] = {list = {p[6].x, p[6].y, p[7].x, p[7].y, p[2].x, p[2].y}, z_index = (t[6].z + t[7].z + t[2].z)/3}
		facesIc[17] = {list = {p[7].x, p[7].y, p[8].x, p[8].y, p[3].x, p[3].y}, z_index = (t[7].z + t[8].z + t[3].z)/3}
		facesIc[18] = {list = {p[8].x, p[8].y, p[9].x, p[9].y, p[4].x, p[4].y}, z_index = (t[8].z + t[9].z + t[4].z)/3}
		facesIc[19] = {list = {p[9].x, p[9].y, p[10].x, p[10].y, p[5].x, p[5].y}, z_index = (t[9].z + t[10].z + t[5].z)/3}
		facesIc[20] = {list = {p[10].x, p[10].y, p[6].x, p[6].y, p[1].x, p[1].y}, z_index = (t[10].z+ t[6].z + t[1].z)/3}
		return facesIc
	end

	return icosa
end