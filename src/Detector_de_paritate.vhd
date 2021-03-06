library IEEE;
use IEEE.STD_LOGIC_1164.all;																																																

	entity E_Detector_Paritate is
		port (secventainf: in std_logic_vector (7 downto 0);
		bitparitate: in std_logic;
		paritate:out std_logic);
	end entity;

	architecture A_Detector_Paritate of E_Detector_Paritate is
      begin
		paritate<= secventainf(0) xor secventainf(1) xor secventainf(2)
		xor secventainf(3) xor secventainf(4) xor secventainf(5)
		xor secventainf(6) xor secventainf(7) xor bitparitate;
	end architecture;




