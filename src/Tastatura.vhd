library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity E_Tastatura is
port(DATE:in std_logic; 
     CLK:in std_logic;
     CLKPLACA:in std_logic;
	 
     catozi:out std_logic_vector(7 downto 0) ;
	 anod:out std_logic_vector (3 downto 0));
    
end entity ;

architecture A_Tastarura of E_Tastatura is
	
	
	component E_Registru is
	port (DATE: in std_logic ;
	CLK:in std_logic;
	bit_paritate:out std_logic;
	date_primite : out std_logic;
	Q1: out std_logic_vector (7 downto 0);
	Q2: out std_logic_vector (7 downto 0));
	
end component;

component E_Detector_Paritate is
	port (secventainf: in std_logic_vector (7 downto 0);
	bitparitate: in std_logic;
	paritate:out std_logic);
end component; 

 component E_Afisare is 
  port( clk: in std_logic;
  clk_tastatura: in std_logic;
  aia_care_intra:in std_logic_vector(7 downto 0);  
  aia_care_intra_prec:in std_logic_vector(7 downto 0);
  aia_care_ies:out std_logic_vector(7 downto 0); 
  an : out STD_LOGIC_VECTOR (3 downto 0);
  valid:in std_logic);
end component;

	signal secventa_inf: std_logic_vector (7 downto 0);
	signal secventa_inf_prec:std_logic_vector(7 downto 0);
	signal bit_paritate:std_logic;
	signal paritate:std_logic;
	signal valid:std_logic;
	signal date_primite:std_logic;

begin
	C1:E_Registru port map (DATE,CLK,bit_paritate,date_primite,secventa_inf_prec,secventa_inf);
	C2: E_Detector_Paritate port map (secventa_inf,bit_paritate,paritate);
	valid<='1' when (paritate='1' and date_primite='1') else '0';
	C3:E_afisare port map (CLKPLACA,CLK,secventa_inf,secventa_inf_prec,catozi,anod,valid);
	
 
	
end architecture ;