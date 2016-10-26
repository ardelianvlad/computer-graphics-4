local  r = 1/1000

-- Проекція
function projection(point)
	local b = 1-point.z*r
	return {x = point.x/b, y = point.y/b}
end

-- Поворот навколо OZ
function rotateZ(ob, alpha)
	return {x = ob.x*math.cos(alpha)+ob.y*math.sin(alpha), 
			y = -ob.x*math.sin(alpha)+ob.y*math.cos(alpha),
			z = ob.z}
end

-- Поворот навколо OY
function rotateY(ob, alpha)
	return {x = ob.x*math.cos(alpha)-ob.z*math.sin(alpha),
			y = ob.y,
			z = ob.x*math.sin(alpha)+ob.z*math.cos(alpha)}
end

-- Поворот навколо OX
function rotateX(ob, alpha)
	return {x = ob.x, 
			y = ob.y*math.cos(alpha)+ob.z*math.sin(alpha),
			z = -ob.y*math.sin(alpha)+ob.z*math.cos(alpha)}
end

-- Сортування і малювання полігонів
function Draw(table_faces)
	for j=1,#table_faces do
		for i=1,#table_faces-1 do
			if table_faces[i].z_index > table_faces[i+1].z_index then
				temp = table_faces[i]
				table_faces[i] = table_faces[i+1]
				table_faces[i+1] = temp
			end
		end
	end

	

	for i=1,#table_faces do
		love.graphics.setColor(100, 220, 50)
		love.graphics.polygon('fill', table_faces[i].list)
		love.graphics.setColor(0, 0, 0)
		love.graphics.polygon('line', table_faces[i].list)
	end

	-- for i=1,#table_faces do
	-- 	love.graphics.setColor(0, 0, 0)
	-- 	love.graphics.polygon('line', table_faces[i].list)
	-- end
end

-- Об'єднання списків
function array_concat(...) 
    local t = {}
    for n = 1,select("#",...) do
        local arg = select(n,...)
        if type(arg)=="table" then
            for _,v in ipairs(arg) do
                t[#t+1] = v
            end
        else
            t[#t+1] = arg
        end
    end
    return t
end

-- Конструктори точок
Point = {}
Point.new2 = function(bx, by)
	return {x = bx, y = by}
end
Point.new3 = function(bx, by, bz)
	return {x = bx, y = by, z = bz}
end

function Translate(point, dx, dy, dz)
	point.x = point.x+dx
	point.y = point.y+dy
	point.z = point.z+dz
end

-- Множення двох матриць
function Mu(A, B)
	result = {}
	for i=1,4 do
		result[i] = {}
	end
	for i=1,4 do
		for j=1,4 do
			result[i][j] = A[i][1]*B[1][j] + A[i][2]*B[2][j] + A[i][3]*B[3][j] + A[i][4]*B[4][j]
		end
	end
	return result
end

-- Множення вектора на матрицю
function vMuMat(v, M)
	result = {}
		result.x = v.x*M[1][1] + v.y*M[2][1] + v.z*M[3][1] + M[4][1]
		result.y = v.x*M[1][2] + v.y*M[2][2] + v.z*M[3][2] + M[4][2]
		result.z = v.x*M[1][3] + v.y*M[2][3] + v.z*M[3][3] + M[4][3]
	return result
end

-- Конструктор матриці зміщення на вектор {x0,y0,z0}
function T(x0, y0, z0)
	return {{1,0,0,0},
			{0,1,0,0},
			{0,0,1,0},
			{x0,y0,z0,1}
		}
end

-- Конструктор матриці повороту 
function R_x(a, b, c)
	d = math.sqrt(b*b+c*c)
	return {{1,0,0,0},
			{0,c/d,b/d,0},
			{0,-b/d,c/d,0},
			{0,0,0,1}
		}
end

-- Конструктор матриці повороту 
function R_y_minus(a, b, c)
	d = math.sqrt(b*b+c*c)
	return {{d,0,a,0},
			{0,1,0,0},
			{-a,0,d,0},
			{0,0,0,1}
		}
end

-- Конструктор матриці повороту навколо Oz
function R_z(t)
	return {{math.cos(t),math.sin(t),0,0},
			{-math.sin(t),math.cos(t),0,0},
			{0,0,1,0},
			{0,0,0,1}
		}
end

-- Конструктор матриці оберненого повороту
function R_y(a, b, c)
	d = math.sqrt(b*b+c*c)
	return {{d,0,-a,0},
			{0,1,0,0},
			{a,0,d,0},
			{0,0,0,1}
		}
end

-- Конструктор матриці повороту 
function R_x_minus(a, b, c)
	d = math.sqrt(b*b+c*c)
	return {{1,0,0,0},
			{0,c/d,-b/d,0},
			{0,b/d,c/d,0},
			{0,0,0,1}
		}
end

function InitMatr(v0,p0)
	A1 = Mu(T(-p0.x,-p0.y,-p0.z),R_x(v0.a,v0.b,v0.c))
	A1 = Mu(A1,R_y_minus(v0.a,v0.b,v0.c))
	A2 = R_y(v0.a,v0.b,v0.c)
	A3 = R_x_minus(v0.a,v0.b,v0.c)
	A4 = T(p0.x,p0.y,p0.z)
end

function RotateMatrix(theta)
	result = A1
	result = Mu(result,R_z(theta))
	result = Mu(result,A2)
	result = Mu(result,A3)
	result = Mu(result,A4)
	return result
end