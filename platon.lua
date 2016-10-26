require('functions')

-- ПЛАТОНОВІ ТІЛА

-- Створення граней і z-індексів
function Faces(faces, t)
	for i=1,#faces do
		faces[i].list = {}
		buf = 0
		for j,k in ipairs(faces[i].verticles) do
			table.insert(faces[i].list, t[k].x)
			table.insert(faces[i].list, t[k].y)
			buf = buf + t[k].z
		end
		faces[i].z_min = buf/(#faces[i].verticles)
	end
end

-- Тетраедр
Tetrahedron = {}

Tetrahedron.new = function(a, dx, dy, dz)
	tetra = {}
	
	-- Координати вершин
	tetra[1] = Point.new3(-a+dx,-a+dy,a+dz)
	tetra[2] = Point.new3(-a+dx,a+dy,-a+dz)
	tetra[3] = Point.new3(a+dx,-a+dy,-a+dz)
	tetra[4] = Point.new3(a+dx,a+dy,a+dz)

	-- Створеня списку полігонів та z-індексів
	tetra.makeFaces = function(t, p)
		facesT = {}
		facesT[1] = {verticles = {1, 2, 3}}
		facesT[2] = {verticles = {1, 3, 4}}
		facesT[3] = {verticles = {2, 3, 4}}
		facesT[4] = {verticles = {1, 2, 4}}
		Faces(facesT, t)
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
		facesCube[1] = {verticles = {1, 2, 3, 4}}
		facesCube[2] = {verticles = {5, 6, 7, 8}}
		facesCube[3] = {verticles = {1, 2, 6, 5}}
		facesCube[4] = {verticles = {3, 4, 8, 7}}
		facesCube[5] = {verticles = {2, 3, 7, 6}}
		facesCube[6] = {verticles = {1, 4, 8, 5}}
		Faces(facesCube, t)
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
		facesOct[1] = {verticles = {1, 4, 5}}
		facesOct[2] = {verticles = {1, 3, 4}}
		facesOct[3] = {verticles = {1, 3, 6}}
		facesOct[4] = {verticles = {1, 5, 6}}
		facesOct[5] = {verticles = {2, 4, 5}}
		facesOct[6] = {verticles = {2, 3, 4}}
		facesOct[7] = {verticles = {2, 3, 6}}
		facesOct[8] = {verticles = {2, 5, 6}}
		Faces(facesOct, t)
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
		facesD[1] = {verticles = {2, 11, 7, 14, 13}}
		facesD[2] = {verticles = {2, 11, 12, 5, 19}}
		facesD[3] = {verticles = {2, 13, 1, 17, 19}}
		facesD[4] = {verticles = {11, 7, 20, 8, 12}}
		facesD[5] = {verticles = {3, 17, 19, 5, 15}}
		facesD[6] = {verticles = {13, 14, 4, 9, 1}}
		facesD[7] = {verticles = {3, 17, 1, 9, 10}}
		facesD[8] = {verticles = {7, 14, 4, 18, 20}}
		facesD[9] = {verticles = {3, 15, 16, 6, 10}}
		facesD[10] = {verticles = {5, 12, 8, 16, 15}}
		facesD[11] = {verticles = {8, 16, 6, 18, 20}}
		facesD[12] = {verticles = {6, 18, 4, 9, 10}}
		Faces(facesD, t)
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
		facesIc[1] = {verticles = {1, 2, 11}}
		facesIc[2] = {verticles = {2, 3, 11}}
		facesIc[3] = {verticles = {3, 4, 11}}
		facesIc[4] = {verticles = {4, 5, 11}}
		facesIc[5] = {verticles = {5, 1, 11}}
		facesIc[6] = {verticles = {6, 7, 12}}
		facesIc[7] = {verticles = {7, 8, 12}}
		facesIc[8] = {verticles = {8, 9, 12}}
		facesIc[9] = {verticles = {9, 10, 12}}
		facesIc[10] = {verticles = {10, 6, 12}}
		facesIc[11] = {verticles = {1, 2, 6}}
		facesIc[12] = {verticles = {2, 3, 7}}
		facesIc[13] = {verticles = {3, 4, 8}}
		facesIc[14] = {verticles = {4, 5, 9}}
		facesIc[15] = {verticles = {5, 1, 10}}
		facesIc[16] = {verticles = {6, 7, 2}}
		facesIc[17] = {verticles = {7, 8, 3}}
		facesIc[18] = {verticles = {8, 9, 4}}
		facesIc[19] = {verticles = {9, 10, 5}}
		facesIc[20] = {verticles = {10, 6, 1}}
		Faces(facesIc, t)
		return facesIc
	end

	return icosa
end