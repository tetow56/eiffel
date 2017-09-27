class TOWER
-- Represente une tour et les disques qu'elle contient
	
creation {ANY}
	full, empty

feature {}
	t: ARRAY[INTEGER]
			-- La tour est un tableau d'entiers.
	      -- L'index i du tableau représente la taille du disque à 
	      -- l'étage i
	top: INTEGER
			-- Represente le dernier étage auquel un disque est present

feature {}
	full (n: INTEGER) is
			-- Creation d'une tour de taille n, avec n disques presents
		require
			n >= 1
		local
			i: INTEGER
		do
			create t.make(1,n)
				from
					i := 0
				until
					i >= n
				loop
					t.put(i + 1, n - i)
					i := i + 1
				end
				top := n
			-- A Remplir

		end

	empty (n: INTEGER) is
			-- Creation d'une tour vide de taille n
		require
			n >= 1
		local
			i: INTEGER
		do
			create t.make(1,n)
			from 
				i := 1
			until			
				i > n
			loop
				t.put(0,i)
				i := i + 1
			end
			top := 1
			-- A Remplir
		ensure
			height = n
			top = 1
		end

feature {HANOI}
	height: INTEGER is
			-- La taille de la tour
		do
			Result := t.upper
		end

	afficher_etage (d: INTEGER) is
			-- Affiche l'etage d de la tour
		require
			1 <= d
			d <= height
		local
			taille_disque, taille_disque_max, i: INTEGER
		do
			taille_disque := t.item(d)
			taille_disque_max := height
			from
				i := taille_disque_max - taille_disque
			until
				i = 0
			loop
				io.put_character(' ')
				i := i - 1
			end
			from
				i := taille_disque
			until
				i = 0
			loop
				io.put_character('=')
				i := i - 1
			end
			io.put_character('|')
			from
				i := taille_disque
			until
				i = 0
			loop
				io.put_character('=')
				i := i - 1
			end
			from
				i := taille_disque_max - taille_disque
			until
				i = 0
			loop
				io.put_character(' ')
				i := i - 1
			end
		end

	retirer_disque: INTEGER is
			-- Retire le dernier disque de la tour courante
		do
			if t.item(top) /= 0 and top >= 1 then
			-- A remplir
				Result := t.item(top)
				t.remove_last
				if top > 1 then			
					top := top - 1
				end
			else
				io.put_string("erreur lors du retrait")
			end
		ensure
			top >= 1
		end

	ajouter_disque (d: INTEGER) is
			-- Ajoute un disque de taille d sur la tour.
			-- Renvoie une erreur (Explicite) si le disque ne peut pas etre ajoute
		do
 			if t.item(top) >= d then
				t.add(d,top)
			else
				io.put_string("Erreur lors de l ajout")
			end
			-- A Remplir
			
		ensure
			top <= height
		end

end -- class TOWER
