library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stream_scaler is
    Port (
        clk           : in  STD_LOGIC;
        reset_n       : in  STD_LOGIC;
        
        -- Slave Interface (Added tlast)
        s_axis_tdata  : in  STD_LOGIC_VECTOR(31 downto 0);
        s_axis_tlast  : in  STD_LOGIC;  -- <--- ADD THIS
        s_axis_tvalid : in  STD_LOGIC;
        s_axis_tready : out STD_LOGIC;
        
        -- Master Interface (Added tlast)
        m_axis_tdata  : out STD_LOGIC_VECTOR(31 downto 0);
        m_axis_tlast  : out STD_LOGIC;  -- <--- ADD THIS
        m_axis_tvalid : out STD_LOGIC;
        m_axis_tready : in  STD_LOGIC
    );
end stream_scaler;

architecture Behavioral of stream_scaler is
begin
    s_axis_tready <= m_axis_tready;
    
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                m_axis_tvalid <= '0';
                m_axis_tlast  <= '0';
            else
                m_axis_tvalid <= s_axis_tvalid;
                
                if s_axis_tvalid = '1' and m_axis_tready = '1' then
                    m_axis_tdata <= std_logic_vector(shift_left(unsigned(s_axis_tdata), 1));
                    m_axis_tlast <= s_axis_tlast; -- <--- PASS THE SIGNAL THROUGH
                end if;
            end if;
        end if;
    end process;
end Behavioral;