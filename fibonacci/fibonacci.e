class FIBONACCI

insert
	ARGUMENTS
	
creation {ANY}
	make

feature {ANY}
	
	make is
		do
			if argument_count /= 3 or not argument(1).is_integer or not argument(2).is_integer or not argument(3).is_integer then
				io.put_string("Utilisation : ")
				io.put_string(argument(0))
				io.put_string(" <entier>%N")
				die_with_code(exit_failure_code)
			end
			io.put_integer(fibonacci(argument(1).to_integer))
			io.put_new_line
		end


	fibonacci (k: INTEGER): INTEGER is
		require
			k > 0
		local
			j,p,c,n : INTEGER
			tab : ARRAY[INTEGER]
		do 
		create tab.make(0,k)
			from
			
			p := argument(2).to_integer
			c := argument(3).to_integer
			j := 1
			until j=k
			loop
				n := p+c
				p := c
				c := n
				j := j+1
				tab.put(c,j)
			end
			
			io.put_string("Tableau : ")
			display_array(tab)
			
			
			Result := c
		end

	
	display_array (array: ARRAY[INTEGER]) is
	local 
		iter : INTEGER 
	do 
		
		
		from iter := 0
		until iter > argument(1).to_integer
		loop
			io.put_integer(array.item(iter))
			io.put_new_line
			iter := iter+1 
		end
	end

	fibonacci_recursif (k: INTEGER): INTEGER is
		require
			k >= 0
		do
			if k = 0 then
				Result := 0
			else
				if k = 1 then
					Result := 1
				else 
					Result := fibonacci(k-2) + fibonacci(k-1) 
					io.put_integer(k)
					io.put_new_line
				end
			end
		end
	
end

