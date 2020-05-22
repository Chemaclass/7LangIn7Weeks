-- Comments
{-
multiline
comments
-}

import Data.List
import System.IO 

-- Built in math functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999
-- Also sin, cos, tan, asin, atan, acos, sinh
-- tanh, cosh, asinh, atanh, acosh

trueAndFalse = True && False 
trueOrFalse = True || False 
notTrue = not(True)

-- See the types in `ghci` by tying => :t TYPE
-- For example => :t (+)

-- Lists
favNums = 2 : 7 : 21 : 66 : []
multiList = [[3,5,7],[11,13,17]]
primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29]
morePrimes2 = 2 : morePrimes
lenPrime = length morePrimes
revPrime = reverse morePrimes
isListEmpty = null morePrimes
secondPrime = morePrimes !! 1
firstPrime = head morePrimes
lastPrime = last morePrimes
primeInit = init morePrimes
first3Primes = take 3 morePrimes
removedPrimes = drop 3 morePrimes
is7InList = 7 `elem` morePrimes
is7InList2 = elem 7 morePrimes
zeroToTen = [0..10]
evenList = [2,4..20]
letterList = ['A'..'Z']
infinPow10 = [10,20..]
many2s = take 10 (repeat 2)
many3s = replicate 10 3
cycleList = take 10 (cycle [1..5])
listTimes2 = [n * 2 | n <- [1..10], n * 3 <= 50]
divIsBy9N13 = [n | n <- [1..500], mod n 13 == 0, n `mod` 9 == 0]

sortedList = sort [9,6,20,23,1,3]
sumOfLists = zipWith (+) [1,2,3][4,5,6]
listBiggerThen5 = filter (>5) morePrimes
evensUpTo20 = takeWhile (<=20) [2,4..]
multOfList = foldl (*) 1 [1,2,3,4,5]

pow3List = [3^n | n <- [1..10]]
multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

-- Tuples
randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 52)
bobsName = fst bobSmith
bobsAge = snd bobSmith
names = ["Chema", "Juan", "Sus"]
addresses = ["Berlin","Granada","Madrid"]
namesNAddress = zip names addresses


-- functions
helloFunction = do 
  putStrLn "What's your name"
  name <- getLine
  putStrLn ("Hello " ++ name)

addMe :: Int -> Int -> Int
addMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
whatAge _ = "Nothing important..."

-- Recursion
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)

prodFact n = product [1..n]


-- Guards
isOdd :: Int -> Bool
isOdd n
  | n `mod` 2 == 0 = False
  | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
  | (age < 5) = "Keep sleeping"
  | (age >= 5) && (age <= 6) = "Kinderganten"
  | (age > 6) && (age <= 10) = "Elementary School"
  | (age > 10) && (age <= 14) = "Middle School"
  | (age > 14) && (age <= 18) = "High School"
  | otherwise = "Go to college"

-- where clauses
batAvgRatting :: Double -> Double -> String
batAvgRatting hits atBats
  | avg <= 0.200 = "Terrible batting Average"
  | avg <= 0.150 = "Average Player"
  | otherwise = "You're a Superstar"
  where avg = hits / atBats

getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (h:[]) = "Your list start with " ++ show h
getListItems (h:t) = "THe 1st item is "++ show h ++ " and the rest are " ++ show t

getFirstItem :: String -> String 
getFirstItem [] = "Empty string"
getFirstItem all@(h:t) = "The first letter in " ++ all ++ " is " ++ show h

-- high order functions
times4 :: Int -> Int
times4 n = n * 4
listTimes4 = map times4 [1,2,3,4]

mulBy4 :: [Int] -> [Int]
mulBy4 [] = []
mulBy4 (h:t) = times4 h : mulBy4 t 

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (h:t) (h2:t2) = h == h2 && areStringsEq t t2
areStringsEq _ _ = False

doMul :: (Int -> Int) -> Int
doMul func = func 3
num3Times4 = doMul times4

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4

threePlusList = map adds3 [1,2,3,4]

-- lambdas
dbl1To10 = map (\n -> n * 2) [1..10]

-- conditions
doubleEvenNumber n = 
  if (n `mod` 2 /= 0)
    then n
    else n * 2

getSchoolClass :: Int -> String 
getSchoolClass n = case n of 
  5 -> "Go to kindergarten"
  6 -> "Go to elementary school"
  _ -> "Go away"

-- modules
-- module SampFunctions (getSchoolClass, doubleEvenNumber) where 

-- data types
-- enumerator types
data BaseballPlayer = Pitcher 
                    | Catcher
                    | Infielder
                    | Outfield
  deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True
barryInOF = print(barryBonds Outfield)

-- custom types
data Customer = Customer String String Double 
  deriving Show 

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

-- Rock Paper Scissors
data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS -> String 
shoot Paper Rock = "Paper beats Rock"
shoot Rock Scissors = "Rock Beats Scissors"
shoot Scissors Paper = "Scissors Beat Paper"
-- etc ...
shoot _ _ = "Error"

data Shape = Circle Float Float Float 
           | Rectangle Float Float Float Float
  deriving Show 

area :: Shape -> Float
area (Circle  _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs $ x2-x) * (abs(y2-y))

areaOfCircle = area (Circle 50 60 20)
areaOfRect = area $ Rectangle 10 10 100 100

-- type classes
-- Num Eq Or Show ...

data Employee = Employee { 
  name :: String,
  position  :: String,
  idNum :: Int
} deriving (Eq, Show)

samSmith = Employee {name="Sam Smith", position="Manager",idNum=100}
pamMarx = Employee {name="Pam Marx", position="Sales",idNum=101}

isSamPam = samSmith == pamMarx
samSmithData = show samSmith

data ShirtSize = S | M | L

instance Eq ShirtSize where
  S == S = True
  M == M = True
  L == L = True
  _ == _ = False

instance Show ShirtSize where
  show S = "Small"
  show M = "Medium"
  show L = "Large"

smallAvail = elem S [S, M, L]
theSize = show S 


class MyEq a where 
  areEqual :: a -> a -> Bool 

instance MyEq ShirtSize where
  areEqual S S = True
  areEqual M M = True
  areEqual L L = True
  areEqual _ _ = False

newSize = areEqual M M
