num_port_receive = 5200;
duration_timeout = 0.05;

receiver_udp = ReceiverUDP();
receiver_udp.set_config(num_port_receive,duration_timeout);
receiver_udp.start;

while 1 == 1

    receiver_udp.read();
    data_recv = receiver_udp.get_data_recv;
    if ~isempty(data_recv)
        fprintf('New data acquired %d\n',data_recv);
        receiver_udp.data_recv = [];
    end
    pause(0.01);
end

