module OneFifteen where

perms3 :: Eq a => [a] -> [[a]]
perms3 [] = [[]]
perms3 xs = [x:ys | x <- xs, ys <- perms3 (remove x xs)]

remove :: Eq a => a -> [a] -> [a]
remove x = filter (/= x)

-- is the first clause of perms necessary?
--   my guess is yes, just because the list comprehension gives [] when xs is [], which is not
--   the right type.
--   so, it was indeed necessary, but not for type checking. Without that first clause perms3
--   just returns the empty list. Trying to figure out why. I guess when xs is [], the list
--   comprehension is [], which seems to just 'scrap' the whole list comprehension because
--   ys <- [] kinda means there's nothing in the comprehension to output. interesting
--
-- what is the type of perms?
--   will annotate it
-- can one generate the permutations of a list of functions with this definition?
--  gut answer is no because functions are not comparable. Though maybe I should think more about it.
--  well I think that's at least a reason why it wouldn't work as functions indeed do not have an instance
--  of Eq
--
