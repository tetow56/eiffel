class HELLO_WORLD
--
-- The "Hello World" example.
--
--

creation {ANY}
	main

feature {ANY}
	i : INTEGER
	message(j: INTEGER): STRING is
		do
			if j.is_even then 
				Result := "i is even.%N"
			else
				Result := "i is odd.%N"
			end	
		end
	main is
		do
			from i := 0
			until i >= 10 
			loop	
				i := i + 1
				
				io.put_string(message(i))
			end
		end
	

end -- class HELLO_WORLD
