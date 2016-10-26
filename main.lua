require('platon')
require('functions')



function love.load()
	love.graphics.translate(300, 300)
	love.graphics.setLineWidth(1)
	love.graphics.setLineJoin("none")
	-------
	v = Tetrahedron.new(50, 200, 0, 0)
	u = Tetrahedron.new(50, -200, 0, 0)
	p = {} h = {}
	vec0 = { a = 1/math.sqrt(3), b = 1/math.sqrt(3), c = 1/math.sqrt(3)}
	point0 = { x = 0, y = 0, z = 0}
	InitMatr(vec0, point0)
	matr_rot = RotateMatrix(0)
	-------
	p_1 = projection({x=-1000*vec0.a+point0.x, y=-1000*vec0.b+point0.y, z=-1000*vec0.c+point0.z})
	p_2 = projection({x=1000*vec0.a+point0.x, y=1000*vec0.b+point0.y, z=1000*vec0.c+point0.z})
	axis_face = {{list = {p_1.x, p_1.y, p_2.x, p_2.y, p_1.x, p_1.y}, z_index = 0}}
end

local speed = 0.01
local Angle = 0

function love.update()
	matr_rot = RotateMatrix(speed)
	Angle = Angle + speed
	if Angle >= 2*math.pi then Angle = 0 end
	for i=1,#v do
		--v[i] = rotateY(v[i], speed)
		v[i] = vMuMat(v[i], matr_rot)
 	end
 	for i=1,#u do
 		--u[i] = rotateY(u[i], 0)
 		u[i]= vMuMat(u[i], matr_rot)
 	end
	for i=1,#v do
		p[i] = projection(v[i])
	end
	for i=1,#u do
		h[i] = projection(u[i])
	end
	allFaces = array_concat(v:makeFaces(p), u:makeFaces(h), axis_face)
	if love.keyboard.isDown('z') then
        speed = speed - 0.001
    end
    if love.keyboard.isDown('x') then
    	speed = speed + 0.001
    end
end

function love.draw()
	love.graphics.setBackgroundColor( 255, 255, 255 )
	love.graphics.translate(300, 300)
	Draw(allFaces)
end

function love.keypressed( key, scancode, isrepeat )
	if key=='1' then
		nextLeftFigure()
	end
	if key=='2' then
		nextRightFigure()
	end
	if key=='c' then speed = 0 end;
end

local count = 2;
function nextLeftFigure()
	if count == 1 then u = Tetrahedron.new(50, -200, 0, 0) end
	if count == 2 then u = Cube.new(50, -200, 0, 0) end
	if count == 3 then u = Octahedron.new(80, -200, 0, 0) end
	if count == 4 then u = Dodecahedron.new(40, -200, 0, 0) end
	if count == 5 then u = Icosahedron.new(60, -200, 0, 0) end
	matr_rot = RotateMatrix(Angle)
	for i=1,#u do
		u[i] = vMuMat(u[i], matr_rot)
	end
	count = count+1
	if count > 5 then count = 1 end
end

local count2 = 2;
function nextRightFigure()
	if count2 == 1 then v = Tetrahedron.new(50, 200, 0, 0) end
	if count2 == 2 then v = Cube.new(50, 200, 0, 0) end
	if count2 == 3 then v = Octahedron.new(80, 200, 0, 0) end
	if count2 == 4 then v = Dodecahedron.new(40, 200, 0, 0) end
	if count2 == 5 then v = Icosahedron.new(60, 200, 0, 0) end
	matr_rot = RotateMatrix(Angle)
	for i=1,#v do
		v[i] = vMuMat(v[i], matr_rot)
	end
	count2 = count2+1
	if count2 > 5 then count2 = 1 end
end
