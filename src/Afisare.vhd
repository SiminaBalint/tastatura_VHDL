library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 	entity E_Afisare is 
  		port( clk: in std_logic;
  		clk_tastatura: in std_logic;
  		aia_care_intra:in std_logic_vector(7 downto 0);
  		aia_care_intra_prec:in std_logic_vector(7 downto 0);
  		aia_care_ies:out std_logic_vector(7 downto 0);   
  		an : out STD_LOGIC_VECTOR (3 downto 0);	 
  		valid:in std_logic);
	end entity;

	architecture A_Afisare of E_Afisare is 	
	signal counter : std_logic_vector(12 downto 0):=(others=>'0');
	signal afisaj_led:std_logic_vector(31 downto 0):=x"FFFFFFFF";
		begin	
		--Divizor de frecventa
		process(clk)
			begin
    		if clk'event and clk='1' then
       		 counter<=counter+1;
    		end if;	
		end process;
		process(counter(12 downto 11))
			begin
			case counter(12 downto 11) is
				when "00" => an <="1110";
				when "01" => an <="1101";
				when "10" => an <="1011";
				when "11" => an <="0111";
				when others  => an<="0000";
			end case;
		end process;
		process(counter, afisaj_led)
			begin
			case counter(12 downto 11) is
				when "00" => aia_care_ies <= afisaj_led(31 downto 24);
				when "01" => aia_care_ies <= afisaj_led(23 downto 16);
				when "10" => aia_care_ies <= afisaj_led(15 downto 8);
				when "11" => aia_care_ies <= afisaj_led(7 downto 0);  
				when others  => aia_care_ies<="00000000";
			end case;	
			end process;
		process(aia_care_intra,clk_tastatura)	
			begin
			if valid='1' and aia_care_intra_prec=x"F0" and clk_tastatura='1' and clk_tastatura'event then
				if aia_care_intra="01011010" then afisaj_led<=x"FFFFFFFF";
				    elsif aia_care_intra="01100110"	 then afisaj_led<="11111111" & afisaj_led(31 downto 8);
					 elsif aia_care_intra= "01000101"then afisaj_led<= afisaj_led(23 downto 0) & "10000001";-- 0
					 elsif aia_care_intra= "00010110"then afisaj_led<= afisaj_led(23 downto 0) & "11001111";-- 1
					 elsif aia_care_intra= "00011110"then afisaj_led<= afisaj_led(23 downto 0) & "10010010";-- 2
					 elsif aia_care_intra= "00100110"then afisaj_led<= afisaj_led(23 downto 0) & "10000110";-- 3
					 elsif aia_care_intra= "00100101"then afisaj_led<= afisaj_led(23 downto 0) & "11001100";-- 4
					 elsif aia_care_intra= "00101110"then afisaj_led<= afisaj_led(23 downto 0) & "10100100";-- 5
					 elsif aia_care_intra= "00110110"then afisaj_led<= afisaj_led(23 downto 0) & "10100000";-- 6
					 elsif aia_care_intra= "00111101"then afisaj_led<= afisaj_led(23 downto 0) & "10001111";-- 7
					 elsif aia_care_intra= "00111110"then afisaj_led<= afisaj_led(23 downto 0) & "10000000";-- 8
					 elsif aia_care_intra= "01000110"then afisaj_led<= afisaj_led(23 downto 0) & "10000100";-- 9
					 elsif aia_care_intra= "00011100"then afisaj_led<= afisaj_led(23 downto 0) & "10001000";-- A
					 elsif aia_care_intra= "00100001"then afisaj_led<= afisaj_led(23 downto 0) & "10110001";-- C
					 elsif aia_care_intra= "00100100"then afisaj_led<= afisaj_led(23 downto 0) & "10110000";-- E
					 elsif aia_care_intra= "00101011"then afisaj_led<= afisaj_led(23 downto 0) & "10111000";-- F
					 elsif aia_care_intra= "00110011"then afisaj_led<= afisaj_led(23 downto 0) & "11001000";-- H
					 elsif aia_care_intra= "00111011"then afisaj_led<= afisaj_led(23 downto 0) & "10000011";-- J
					 elsif aia_care_intra= "01001011"then afisaj_led<= afisaj_led(23 downto 0) & "11110001";-- L
					 elsif aia_care_intra= "01001101"then afisaj_led<= afisaj_led(23 downto 0) & "10011000";-- P
					 elsif aia_care_intra= "00101100"then afisaj_led<= afisaj_led(23 downto 0) & "10111001";-- T
					 elsif aia_care_intra= "00111100"then afisaj_led<= afisaj_led(23 downto 0) & "11000001";-- U
					 elsif aia_care_intra= "01001001"then afisaj_led<= afisaj_led(23 downto 0) & "01111111";-- .
					 elsif aia_care_intra= "00101001"then afisaj_led<= afisaj_led(23 downto 0) & "11111111";-- SPACE
					 elsif aia_care_intra= "01001110"then afisaj_led<= afisaj_led(23 downto 0) & "11111110";-- -
					 elsif aia_care_intra= "01110010" then afisaj_led<= afisaj_led(23 downto 0) & "11110110";
					 elsif aia_care_intra= "01110101" then afisaj_led<= afisaj_led(23 downto 0) & "10111110";
					 elsif aia_care_intra= "01110100" then afisaj_led<= afisaj_led(23 downto 0) & "11001110";
					 elsif aia_care_intra= "01101011" then afisaj_led<= afisaj_led(23 downto 0) & "11111000";
					 else afisaj_led<=afisaj_led(23 downto 0) & "00000000";
					 
		end if;
		end if;
	end process;	 
end Architecture;
