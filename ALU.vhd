library ieee;
use ieee.std_logic_1164.all;        -- standard unresolved logic UX01ZWLH-
use ieee.numeric_std.all;

entity ALU is
  port (
	clk : in std_logic;
	opcode : in std_logic_vector(5 downto 0);
	funct : in std_logic_vector(5 downto 0);
	shamt : in std_logic_vector(4 downto 0);
	port_1 : in std_logic_vector(31 downto 0);
	port_2 : in std_logic_vector(31 downto 0);
	result : out std_logic_vector(31 downto 0)
  ) ;
end entity ; -- ALU

architecture arch of ALU is

signal mult_hi : std_logic_vector(31 downto 0);
signal mult_lo : std_logic_vector(31 downto 0);

begin

alu_execution : process(clk)

	variable mult_temp : std_logic_vector(63 downto 0);

begin
	if rising_edge(clk) then
		case( funct ) is
		
			when "000000" => --sll 0x00
				result <= std_logic_vector(shift_left(unsigned(port_1), to_integer(unsigned(shamt))));
			when "000010" => --srl 0x02
				result <= std_logic_vector(shift_right(unsigned(port_1), to_integer(unsigned(shamt))));
			when "001000" => --jr 0x08
				-- no operation
			when "010000" => --mfhi 0x10
				result <= mult_hi;
			when "010010" => --mflo 0x12
				result <= mult_lo;
			when "011000" => --mult 0x18
				mult_temp := std_logic_vector(to_signed(to_integer(signed(port_1)) * to_integer(signed(port_2)), 64));
				mult_hi <= mult_temp(63 downto 32);
				mult_lo <= mult_temp(31 downto 0);
			when "011010" => --div 0x1A
				mult_lo <= std_logic_vector(to_signed(to_integer(signed(port_1)) / to_integer(signed(port_2)), 32));
				mult_hi <= std_logic_vector(to_signed(to_integer(signed(port_1)) rem to_integer(signed(port_2)), 32));
			when "100000" => --add 0x20
				result <= std_logic_vector(to_signed(to_integer(signed(port_1)) + to_integer(signed(port_2)), 32));
			when "100010" => --sub 0x22
				result <= std_logic_vector(to_signed(to_integer(signed(port_1)) - to_integer(signed(port_2)), 32));
			when "100100" => --and bit 0x24
				result <= port_1 and port_2;
			when "100101" => --or bit 0x25
				result <= port_1 or port_2;
			when "100110" => --xor bit 0x26
				result <= port_1 xor port_2;
			when "100111" => --nor bit 0x27
				result <= port_1 nor port_2;
			when "101010" => --slt 0x2A
				if to_integer(signed(port_1)) < to_integer(signed(port_2)) then
					result <= x"00000001";
				else 
					result <= x"00000000";
				end if ;
			when others => --Non-R type operations

		end case ;
	end if;
end process ; -- alu_execution

end architecture ; -- arch