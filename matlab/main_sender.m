%% main_sender
num_port_send = 5201;
duration_timeout = 1;

sender_udp = SenderUDP();
sender_udp.set_config(num_port_send,duration_timeout);
sender_udp.start;

while 1 == 1
    sender_udp.write("te","string");        
    fprintf('send\n')
    pause(0.1);
end

