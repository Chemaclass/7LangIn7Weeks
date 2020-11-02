print("Lets learn some Lua basics :)")

name='Chema'
io.write('Size of string ', #name, "\n")

name=4
io.write('F*ng up the variable types', name, "\n")

bigNum = 9345354993535495353 + 1
io.write('All numbers: ', type(bigNum), "\n")

longString = [[
I am a very very long
string that goes on
forever
]]
longString = longString .. name

io.write(longString, "\n")

-- math functions
-- floor, ceil, max, min, sin, cos, tan, 
-- asin, acos, exp, log, log10, pow, sqrt, random

io.write("floor(2.345): ", math.floor(2.345),"\n")
io.write("ceil(2.345): ", math.ceil(2.345),"\n")
io.write("max(2, 3): ", math.max(2, 3),"\n")


math.randomseed(os.time())

print(string.format("Pi = %.10f", math.pi))

-- Conditionals
-- Relational operators: > < >= <= == ~=
-- Logical: and or not
age=13
if (age < 14) or (age > 67) then
	print("You shouldn't work")
end

-- there are no ternary operators in Lua
-- canVote = age > 18 ? true : false <- NOT VALID IN LUA
canVote = age > 18 and true or false -- This works the same way as the line above
print('can I vote? ', tostring(canVote))


-- Strings
quote="A very very long string for testing purposes yeeey"
print("Quote length", #quote)
print("Replace", string.gsub(quote, 'long', 'short'))
-- string.find,upper,lower,...

-- Looping

i = 1
while (i <= 10) do
	io.write(i)
	i = i + 1

	if i == 8 then break end
end
print("\n")

repeat
	print("Enter your guess: ")
	guess = 15 --io.read()
until tonumber(guess) == 15

for i = 1, 10, 1 do
	io.write(i)
end
print("\n")

months = {'January','February', 'March'}
for key, value in pairs(months) do
	io.write(value, " ")
end
print("\n")

-- Tables

aTable = {}

for i = 1, 10 do
	aTable[i] = i
end

io.write(aTable[1])
io.write('Number of items:', #aTable,'\n')

-- functions

function getSumMore(...)
	local sum = 0
	for k, v in pairs{...} do
		sum = sum + v
	end	
	return sum
end

print("Sum ", getSumMore(1,2,3,4,5))

-- having a function inside another one
doubleIt = function(x) return x * 2 end
print(doubleIt(4))

function outerFunc()
	local i = 0

	return function()
		i = i+1
		return i
	end
end

getI = outerFunc()
print(getI())
print(getI())
print(getI())

-- coroutines

co = coroutine.create(function()
	for i = 1, 10, 1 do
		print(i, coroutine.status(co))
		if i == 5 then coroutine.yield() end
	end
end)

print(coroutine.status(co))
coroutine.resume(co)

-- File IO
-- r,w,a,r+,w+,a+

file = io.open("test.lua", "w+")
file:write("Random stirng of text\n")
file:write("Some more text\n")
file:seek("set", 0)
print(file:read("*a"))
file:close()
os.remove("test.lua")

-- Modules
-- in a diff file:
--local convert = {}
--function convert.ftToCm(feet)
--	return feet + 30.48
--end
--return convert

-- you can use it by having:
-- convert = require("convert")

-- Meta tables
-- ...

-- OOP" (Lua is not an OOP lang, but you can simulate it)

Animal = {heigth = 0, weight = 0, name = "No name", sound = "No sound"}

function Animal:new (heigth,weight,name,sound)
	setmetatable({}, Animal)
	self.heigth = heigth
	self.weight = weight
	self.name = name
	self.sound = sound
	return self
end

function Animal:toString()
	return string.format(
		"%s weight %.1f lbs, is %.1f in tall and says %s",
		self.name,
		self.weight,
		self.heigth,
		self.sound
	)

end

spot = Animal:new(10, 15, "Spot", "Woof")
print(spot.weight)
print(spot:toString())


