library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

   entity E_Registru is
	 port(DATE:in std_logic ;
	 CLK:in std_logic;
	 bit_paritate:out std_logic;
	 date_primite : out std_logic;
	 Q1: out std_logic_vector (7 downto 0);
	 Q2: out std_logic_vector (7 downto 0));
   end entity;
   
   architecture A_Registru of E_Registru is	
	begin
		process (CLK,DATE) 
		variable registru: std_logic_vector (10 downto 0):="11111111111";
		variable counter :std_logic_vector(3 downto 0):="0000"; 
		variable keyprec,keycurent:std_logic_vector(7 downto 0):="11111111";
			begin
				if CLK'event and CLK='0' then
	       		 counter :=counter + "0001";
			 	 registru := registru(9 downto 0) &'0'; 
			 	 registru(0):=date;
				 date_primite<='0';
			 	 if counter="1011" then 
			 		keyprec:=keycurent;
			 		keycurent(0):=registru(9);
			 		keycurent(1):=registru(8);
			 		keycurent(2):=registru(7);
			 		keycurent(3):=registru(6);
			 		keycurent(4):=registru(5);
			 		keycurent(5):=registru(4);
			 		keycurent(6):=registru(3);
			 		keycurent(7):=registru(2);
			 		bit_paritate<=registru(1);
			 		date_primite<='1';									
			 		registru:="11111111111";
			 		counter:="0000";
			     end if; 
              end if;
			  Q1<=keyprec;
			  Q2<=keycurent;
    end process;
end architecture;