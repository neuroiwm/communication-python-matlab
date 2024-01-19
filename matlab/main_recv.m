num_port_receive = 5201;
duration_timeout = 0.05;

receiver_udp = ReceiverUDP();
receiver_udp.set_config(num_port_receive,duration_timeout);
receiver_udp.start;
offCaution
while 1 == 1

    receiver_udp.read();
    data_recv = receiver_udp.get_data_recv;
    if ~isempty(data_recv)
        if isstring(data_recv)
            fprintf('New data acquired %s\n',data_recv);
        else
            fprintf('New data acquired %d\n',data_recv);
        end
        receiver_udp.data_recv = [];
    end
    pause(0.01);
    fprintf('recv\n')
end

